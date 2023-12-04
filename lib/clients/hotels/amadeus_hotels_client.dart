import 'dart:collection';
import 'dart:convert';

import 'package:amadeusapi/client_exception.dart';
import 'package:amadeusapi/clients/amadeus_client.dart';
import 'package:amadeusapi/models/hotels/booking/v1/hotel_booked_response.dart';
import 'package:amadeusapi/models/hotels/offers/v3/multi_response.dart';
import 'package:amadeusapi/models/hotels/search/v1/distance.dart';
import 'package:amadeusapi/models/hotels/search/v1/hotels_search_response.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AmadeusHotelsClient extends AmadeusClient {
  final String hotelsSearchPath =
      '/v1/reference-data/locations/hotels/by-hotels';
  final String citySearchPath = '/v1/reference-data/locations/hotels/by-city';
  final String geoCodeSearchPath =
      '/v1/reference-data/locations/hotels/by-geocode';
  final String offersPath = '/v3/shopping/hotel-offers';

  AmadeusHotelsClient(
      {required super.apiKey, required super.apiSecret, super.test = false});

  Future<HotelsSearchResponse> searchHotelsByCityCode(
      {required String cityCode,
      int? radius,
      DistanceUnit? radiusUnit,
      List<String>? chainCodes,
      List<Amenity>? amenities,
      List<int>? ratings,
      HotelSource hotelSource = HotelSource.ALL}) async {
    Map<String, String> query = new HashMap<String, String>();
    query.putIfAbsent('cityCode', () => cityCode);
    if (radius != null) {
      query.putIfAbsent('radius', () => radius.toString());
    }
    if (radiusUnit != null) {
      query.putIfAbsent(
          'radiusUnit', () => radiusUnit.toString().split('.').last);
    }
    if (chainCodes != null) {
      query.putIfAbsent('chainCodes', () => chainCodes.join(','));
    }
    if (amenities != null) {
      query.putIfAbsent(
          'amenities',
          () => amenities
              .map((i) => i.toString().split('.').last)
              .toList()
              .toString());
    }
    if (ratings != null) {
      query.putIfAbsent('ratings', () => ratings.join(','));
    }
    query.putIfAbsent(
        'hotelSource', () => hotelSource.toString().split('.').last);

    Uri uri = Uri.https(authority, citySearchPath, query);
    if (test) {
      uri = Uri.https(testAuthority, citySearchPath, query);
    }

    String accessToken = await getAccessToken();

    final response = await executeQuery(uri, query, accessToken);

    return HotelsSearchResponse.fromJson(json.decode(response.body));
  }

  Future<HotelsSearchResponse> searchHotelsByGeoCode(
      {required num latitude,
      required num longitude,
      int? radius,
      DistanceUnit? radiusUnit,
      List<String>? chainCodes,
      List<Amenity>? amenities,
      List<int>? ratings,
      HotelSource hotelSource = HotelSource.ALL}) async {
    Map<String, String> query = new HashMap<String, String>();
    query.putIfAbsent('latitude', () => latitude.toString());
    query.putIfAbsent('longitude', () => longitude.toString());
    if (radius != null) {
      query.putIfAbsent('radius', () => radius.toString());
    }
    if (radiusUnit != null) {
      query.putIfAbsent(
          'radiusUnit', () => radiusUnit.toString().split('.').last);
    }
    if (chainCodes != null) {
      query.putIfAbsent('chainCodes', () => chainCodes.join(','));
    }
    if (amenities != null) {
      query.putIfAbsent(
          'amenities',
          () => amenities
              .map((i) => i.toString().split('.').last)
              .toList()
              .toString());
    }
    if (ratings != null) {
      query.putIfAbsent('ratings', () => ratings.join(','));
    }
    query.putIfAbsent(
        'hotelSource', () => hotelSource.toString().split('.').last);

    Uri uri = Uri.https(authority, geoCodeSearchPath, query);
    if (test) {
      uri = Uri.https(testAuthority, geoCodeSearchPath, query);
    }

    String accessToken = await getAccessToken();

    final response = await executeQuery(uri, query, accessToken);

    return HotelsSearchResponse.fromJson(json.decode(response.body));
  }

  Future<HotelsSearchResponse> searchHotelsByHotelId(
      {required List<String> hotelIds}) async {
    Map<String, String> query = new HashMap<String, String>();

    query.putIfAbsent('hotelIds', () => hotelIds.join(','));

    Uri uri = Uri.https(authority, hotelsSearchPath, query);
    if (test) {
      uri = Uri.https(testAuthority, hotelsSearchPath, query);
    }

    String accessToken = await getAccessToken();

    final response = await executeQuery(uri, query, accessToken);

    return HotelsSearchResponse.fromJson(json.decode(response.body));
  }

  Future<HotelBookedResponse> bookHotel(
      {required List<String> hotelIds}) async {
    Map<String, String> query = new HashMap<String, String>();

    query.putIfAbsent('hotelIds', () => hotelIds.join(','));

    Uri uri = Uri.https(authority, hotelsSearchPath, query);
    if (test) {
      uri = Uri.https(testAuthority, hotelsSearchPath, query);
    }

    String accessToken = await getAccessToken();

    final response = await executeQuery(uri, query, accessToken);

    return HotelBookedResponse.fromJson(json.decode(response.body));
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

    Uri uri = Uri.https(authority, offersPath, query);
    if (test) {
      uri = Uri.https(testAuthority, offersPath, query);
    }

    String accessToken = await getAccessToken();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ' + accessToken
    };

    final response = await http.get(uri, headers: headers);

    if (test) print('Response: ' + response.body);

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

enum BoardType { ROOM_ONLY, BREAKFAST, HALF_BOARD, FULL_BOARD, ALL_INCLUSIVE }

enum ViewType { FULL, LIGHT, NONE }

enum SortType { NONE, DISTANCE, PRICE }

enum PaymentPolicy { GUARANTEE, DEPOSIT, NONE }

// TODO handle gotchas
// gotchas:
// BABY_SITTING vs. BABY-SITTING
// BAR_OR_LOUNGE vs. BAR or LOUNGE
// WIFI_IN_ROOM vs. WI-FI_IN_ROOM
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
  BAR_OR_LOUNGE,
  KIDS_WELCOME,
  NO_PORN_FILMS,
  MINIBAR,
  TELEVISION,
  WIFI_IN_ROOM,
  ROOM_SERVICE,
  GUARDED_PARKG,
  SERV_SPEC_MENU
}

enum HotelSource { BEDBANK, DIRECTCHAIN, ALL }
