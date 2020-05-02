import 'dart:collection';
import 'dart:convert';

import 'package:amadeusapi/client_exception.dart';
import 'package:amadeusapi/models/hotels/hotel_offers.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AmadeusHotelsClient {
  final String apiKey;
  final String apiSecret;
  final String authority = 'api.amadeus.com';
  final String testAuthority = 'test.api.amadeus.com';
  final String path = '/v2/shopping/hotel-offers';
  final bool test;
  String _accessToken;

  AmadeusHotelsClient({this.apiKey, this.apiSecret, this.test = false});

  Future<String> authorize() async {
    if (_accessToken != null) {
      return _accessToken;
    }

    String body = 'grant_type=client_credentials&client_id=' + apiKey +
        '&client_secret=' + apiSecret;

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    String authUri = 'https://api.amadeus.com/v1/security/oauth2/token';
    if (test) {
      authUri = 'https://test.api.amadeus.com/v1/security/oauth2/token';
    }

    print(authUri);
    print(body);

    http.Response response = await http.post(authUri, headers: headers, body: body);
      if (response.statusCode != 200) {
        throw AmadeusClientHttpException(
            response.statusCode, 'Unable to authenticate');
      }

      AuthenticationResponse authResponse =
          AuthenticationResponse.fromJson(json.decode(response.body));
      _accessToken = authResponse.accessToken;

      return _accessToken;
  }

  Future<List<HotelOffers>> hotelSearch(
      {String cityCode,
      double latitude,
      double longitude,
      List<String> hotelIds,
      DateTime checkInDate,
      DateTime checkOutDate,
      int roomQuantity,
      int adults,
      List<int> childAges,
      int radius,
      RadiusUnit radiusUnit,
      String hotelName,
      List<String> chains,
      List<RateCode> rateCodes,
      List<Amenity> amenities,
      List<int> ratings,
      int minimumPrice,
      int maximumPrice,
      String currency,
      PaymentPolicy paymentPolicy,
      BoardType boardType,
      bool includeClosed,
      bool bestRateOnly,
      ViewType viewType,
      SortType sortType,
      int pageLimit,
      int pageOffset,
      String lang}) async {
    if ((latitude != null && longitude == null) ||
        (latitude == null && longitude != null)) {
      throw AmadeusClientHttpException(
          400,
          'Both latitude and longitude needs to be supplied.  Only detected ' +
              'one of them.');
    }

    if (latitude != null && radius == null) {
      throw AmadeusClientHttpException(
          400, 'When searching by geocode, radius must be specified.');
    }

    if (cityCode == null && latitude == null && hotelIds == null) {
      throw AmadeusClientHttpException(
          400,
          'At least one of the following needs to be supplied: city code, ' +
              'geopoint(latitude and longitude), or the list of hotel identifiers.');
    }

    if (checkInDate != null &&
        checkInDate.millisecondsSinceEpoch <
            DateTime.now().millisecondsSinceEpoch) {
      throw AmadeusClientHttpException(
          400, 'The supplied check in date occurs in the past');
    }

    if (cityCode != null && radius == null) {
      throw AmadeusClientHttpException(
          400, 'The radius is required when searching by city code.');
    }

    if (radius != null && radiusUnit == null) {
      throw AmadeusClientHttpException(
          400, 'When searching by radius, the radius units must be supplied.');
    }

    final String priceRange = _getPriceRange(minimumPrice, maximumPrice);

    Map<String, String> query = new HashMap<String, String>();

    if (cityCode != null) {
      query.putIfAbsent('cityCode', () => cityCode);
    }
    if (latitude != null) {
      query.putIfAbsent('latitude', () => latitude.toString());
    }
    if (longitude != null) {
      query.putIfAbsent('longitude', () => longitude.toString());
    }
    if (hotelIds != null) {
      query.putIfAbsent('hotelIds', () => hotelIds.join(','));
    }
    if (checkInDate != null) {
      query.putIfAbsent(
          'checkInDate', () => DateFormat('yyyy-MM-dd').format(checkInDate));
    }
    if (checkOutDate != null) {
      query.putIfAbsent(
          'checkOutDate', () => DateFormat('yyyy-MM-dd').format(checkInDate));
    }
    if (roomQuantity != null) {
      query.putIfAbsent('roomQuantity', () => roomQuantity.toString());
    }
    if (adults != null) {
      query.putIfAbsent('adults', () => adults.toString());
    }
    if (childAges != null) {
      query.putIfAbsent('childAges', () => childAges.join(','));
    }
    if (radius != null) {
      query.putIfAbsent('radius', () => radius.toString());
    }
    if (radiusUnit != null) {
      query.putIfAbsent(
          'radiusUnit', () => radiusUnit.toString().split('.').last);
    }
    if (hotelName != null) {
      query.putIfAbsent('hotelName', () => hotelName);
    }
    if (chains != null) {
      query.putIfAbsent('chains', () => chains.join(','));
    }
    if (rateCodes != null) {
      query.putIfAbsent('rateCodes', () => _getEnumValues(rateCodes));
    }
    if (amenities != null) {
      query.putIfAbsent('amenities', () => _getEnumValues(amenities));
    }
    if (ratings != null) {
      query.putIfAbsent('ratings', () => ratings.join(','));
    }
    if (priceRange != null) {
      query.putIfAbsent('priceRange', () => priceRange);
    }
    if (currency != null) {
      query.putIfAbsent('currency', () => currency);
    }
    if (paymentPolicy != null) {
      query.putIfAbsent(
          'paymentPolicy', () => paymentPolicy.toString().split('.').last);
    }
    if (boardType != null) {
      query.putIfAbsent(
          'boardType', () => boardType.toString().split('.').last);
    }
    if (includeClosed != null) {
      query.putIfAbsent('includeClosed', () => includeClosed.toString());
    }
    if (bestRateOnly != null) {
      query.putIfAbsent('bestRateOnly', () => bestRateOnly.toString());
    }
    if (viewType != null) {
      query.putIfAbsent('view', () => viewType.toString().split('.').last);
    }
    if (sortType != null) {
      query.putIfAbsent('sort', () => sortType.toString().split('.').last);
    }
    if (pageLimit != null) {
      query.putIfAbsent('page[limit]', () => pageLimit.toString());
    }
    if (pageOffset != null) {
      query.putIfAbsent('page[offset]', () => pageOffset.toString());
    }
    if (lang != null) {
      query.putIfAbsent('lang', () => lang);
    }

    Uri uri = Uri.https(authority, path, query);
    if (test) {
      uri = Uri.https(testAuthority, path, query);
    }

    print('Uri: ' + uri.toString());

    if (_accessToken == null) {
      print('Authenticating with the Amadeus OAth');
      _accessToken = await authorize();
      print('Authenticated - access token received');
    }

    final Map<String, String> headers = {
      'Authorization': 'Bearer ' + _accessToken
    };

    final response = await http.get(uri.toString(), headers: headers);
    print('Response: ' + response.body);
    if (response == null || response.statusCode != 200) {
      throw AmadeusClientHttpException(
          response.statusCode, 'Http error when calling service');
    }

    Map<String, dynamic> responseJson = json.decode(response.body);

    return (responseJson['data'] as List).map((i) => HotelOffers.fromJson(i)).toList();
  }

  String _getEnumValues(List<dynamic> enumerations) {
    StringBuffer buffer = StringBuffer();
    for (dynamic enumeration in enumerations) {
      buffer.write(enumeration.toString().split('.').last + ',');
    }
    return buffer.toString();
  }

  String _getPriceRange(int min, int max) {
    if (min != null && max != null) {
      return min.toString() + '-' + max.toString();
    }
    if (min != null) {
      return min.toString() + '-';
    }
    if (max != null) {
      return '-' + max.toString();
    }
    return null;
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

//TODO Get a full list of chains, brands and merchants
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

void main() async {
  AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: 'DliX4pnlWMxirhNB7gxRAASy2QtBVlSR', apiSecret: 'k7oJQF5fuG9bw0X6', test: true);
  String token = await hotelClient.authorize();
  print(token);
}
