import 'dart:collection';
import 'dart:convert';

import 'package:amadeusapi/credentials.dart';
import 'package:amadeusapi/models/hotels/offers/v3/multi_response.dart';

import '../../client_exception.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AmadeusHotelsV3Client {
  final String? apiKey;
  final String? apiSecret;
  final String authority = 'api.amadeus.com';
  final String testAuthority = 'test.api.amadeus.com';
  final String path = '/v3/shopping/hotel-offers';
  final String authPath = '/v1/security/oauth2/token';
  final bool test;
  String? _accessToken;

  AmadeusHotelsV3Client(
      {this.apiKey = Credentials.API_KEY,
      this.apiSecret = Credentials.API_SECRET,
      this.test = false}) {}

  Future<String> _getAccessToken() async {
    if (_accessToken != null) {
      return Future<String>.value(_accessToken);
    }

    String body = 'grant_type=client_credentials&client_id=' +
        apiKey! +
        '&client_secret=' +
        apiSecret!;

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var authUri = Uri(
        scheme: 'https',
        host: (test) ? testAuthority : authority,
        path: authPath);

    if (test) {
      print(authUri);
      print(body);
    }

    http.Response response =
        await http.post(authUri, headers: headers, body: body);

    if (response.statusCode != 200) {
      throw AmadeusClientHttpException(response.statusCode,
          'Unable to authenticate: ' + response.toString(), null);
    }

    AuthenticationResponse authResponse =
        AuthenticationResponse.fromJson(json.decode(response.body));
    _accessToken = authResponse.accessToken;

    return Future<String>.value(_accessToken);
  }

  Future<MultiResponse> getMultiHotelOffers(
      {required List<String>? hotelIds,
      int adults = 1,
      required DateTime checkInDate,
      required DateTime checkOutDate,
      String? countryOfResidence,
      int roomQuantity = 1,
      String? priceRange,
      String? currency,
      PaymentPolicy paymentPolicy = PaymentPolicy.NONE,
      BoardType boardType = BoardType.ROOM_ONLY,
      bool includeClosed = false,
      bool bestRateOnly = false,
      String lang = 'en-US'}) async {
    if (checkInDate.millisecondsSinceEpoch <
        DateTime.now().millisecondsSinceEpoch) {
      throw AmadeusClientHttpException(
          400, 'The supplied check in date occurs in the past', null);
    }

    Map<String, String> query = new HashMap<String, String>();

    query.putIfAbsent('hotelIds', () => '[' + hotelIds!.join(',') + ']');
    query.putIfAbsent('adults', () => adults.toString());
    query.putIfAbsent(
        'checkInDate', () => DateFormat('yyyy-MM-dd').format(checkInDate));
    query.putIfAbsent(
        'checkOutDate', () => DateFormat('yyyy-MM-dd').format(checkOutDate));
    if (countryOfResidence != null) {
      query.putIfAbsent('countryOfResidence', () => countryOfResidence);
    }
    query.putIfAbsent('roomQuantity', () => roomQuantity.toString());
    if (priceRange != null) {
      query.putIfAbsent('priceRange', () => priceRange);
    }
    if (currency != null) {
      query.putIfAbsent('currency', () => currency);
    }

    query.putIfAbsent(
        'paymentPolicy', () => paymentPolicy.toString().split('.').last);
    query.putIfAbsent('boardType', () => boardType.toString().split('.').last);
    query.putIfAbsent('includeClosed', () => includeClosed.toString());
    query.putIfAbsent('bestRateOnly', () => bestRateOnly.toString());
    query.putIfAbsent('lang', () => lang);

    Uri uri = Uri.https(authority, path, query);
    if (test) {
      uri = Uri.https(testAuthority, path, query);
    }

    if (test) {
      print('Uri: ' + uri.toString());
    }

    if (_accessToken == null) {
      print('Getting OAuth2 access token');
      try {
        _accessToken = await _getAccessToken();
      } on AmadeusClientHttpException catch (e) {
        throw e;
      }
      if (test) {
        print('OAuth2 access token: ' + _accessToken!);
      }
    }

    final Map<String, String> headers = {
      'Authorization': 'Bearer ' + _accessToken!
    };

    final response = await http.get(uri, headers: headers);
    print('Response: ' + response.body);
    if (response.statusCode != 200) {
      throw AmadeusClientHttpException(
          response.statusCode, 'Http error when calling service', null);
    }

    return MultiResponse.fromJson(json.decode(response.body));
  }

  String _getEnumValues(List<dynamic> enumerations) {
    StringBuffer buffer = StringBuffer();
    for (dynamic enumeration in enumerations) {
      buffer.write(enumeration.toString().split('.').last + ',');
    }
    return buffer.toString();
  }
}

class AuthenticationResponse {
  final String type;
  final String username;
  final String applicationName;
  final String clientId;
  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final String state;
  final String scope;

  AuthenticationResponse.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        username = json['username'],
        applicationName = json['application_name'],
        clientId = json['client_id'],
        tokenType = json['token_type'],
        accessToken = json['access_token'],
        expiresIn = json['expires_in'],
        state = json['state'],
        scope = json['scope'];
}

enum RadiusUnit { KM, MILE }

// TODO Get a full list of chains, brands and merchants
final Map<String, String> chainCodes = {
  'marriott': 'EM',
  'hilton': 'EH',
  'ihg': '6C',
  'wyndham': 'WR',
  'accor': 'RT',
  'best western': 'BW',
  'choice': 'EC',
  'radisson': 'CW',
  'value hotels': 'AD',
  'hrs': 'HV,'
};

// TODO Get a full list of rate codes
enum RateCode { GOV, AAA, MIL, SNR, PRO, COR }

//TODO WI-FI_IN_ROOM was changed to WIFI_IN_ROOM and BABY-SITTING was changed to BABY_SITTING
enum Amenity {
  SWIMMING_POOL,
  SPA,
  FITNESS_CENTER,
  AIR_CONDITIONING,
  RESTAURANT,
  PARKING,
  PETS_ALLOWED,
  AIRPORT_SHUTTLE,
  BUSINESS_CENTER,
  DISABLED_FACILITIES,
  WIFI,
  MEETING_ROOMS,
  NO_KID_ALLOWED,
  TENNIS,
  GOLF,
  KITCHEN,
  ANIMAL_WATCHING,
  BABY_SITTING,
  BEACH,
  CASINO,
  JACUZZI,
  SAUNA,
  SOLARIUM,
  MASSAGE,
  VALET_PARKING,
  BAR,
  KIDS_WELCOME,
  NO_PORN_FILMS,
  MINIBAR,
  TELEVISION,
  WIFI_IN_ROOM,
  ROOM_SERVICE,
  GUARDED_PARKG,
  SERV_SPEC_MENU
}

enum BoardType { ROOM_ONLY, BREAKFAST, HALF_BOARD, FULL_BOARD, ALL_INCLUSIVE }

enum ViewType { FULL, LIGHT, NONE }

enum SortType { NONE, DISTANCE, PRICE }

enum PaymentPolicy { GUARANTEE, DEPOSIT, NONE }
