import 'dart:collection';
import 'dart:convert';

import '../../models/flights/locations/v1/location.dart';
import '../../models/flights/offers/v2/flight_offer.dart';
import '../../models/flights/offers/v2/travel_class.dart';
import '../../models/flights/status/v2/flight_status.dart';
import '../amadeus_client.dart';

class AmadeusFlightsClient extends AmadeusClient {
  static const String locationsPath = '/v1/reference-data/locations';
  static const String flightOffersPath = '/v2/shopping/flight-offers';
  static const String flightStatusPath = '/v2/schedule/flights';

  AmadeusFlightsClient(
      {required super.apiKey, required super.apiSecret, super.test = false});

  /// Method used to get the status of a flight.
  /// [carrierCode] 2 to 3-character IATA carrier code (IATA table codes).
  /// [flightNumber] 1 to 4-digit number of the flight. e.g. 4537
  /// [scheduledDepartureDate] Scheduled departure date of the flight, local to the departure airport, format YYYY-MM-DD.
  /// [operationalSuffix] 1-letter operational suffix assigned by the carrier to differentiate flight in case of delay changing the departure date e.g. A
  Future<FlightStatus> flightStatus(
      {required String carrierCode,
      required String flightNumber,
      required String scheduledDepartureDate,
      String? operationalSuffix}) async {
    Map<String, String> query = HashMap<String, String>();
    query.putIfAbsent('carrierCode', () => carrierCode);
    query.putIfAbsent('flightNumber', () => flightNumber);
    query.putIfAbsent('scheduledDepartureDate', () => scheduledDepartureDate);
    if (operationalSuffix != null) {
      query.putIfAbsent('operationalSuffix', () => operationalSuffix);
    }

    Uri uri = getUri(flightStatusPath, query, test);
    final response = await executeQuery(uri);

    return FlightStatus.fromJson(json.decode(response.body));
  }

  Future<Location> searchLocationsById({required String locationId}) async {
    Map<String, String> query = new HashMap<String, String>();

    Uri uri = getUri(locationsPath + "/" + locationId, query, test);
    final response = await executeQuery(uri);

    return Location.fromJson(json.decode(response.body)['data']);
  }

  Future<List<Location>> searchLocations(
      {required LocationSubType locationSubType,
      required String keyword,
      String? countryCode,
      int pageLimit = 10,
      int pageOffset = 0,
      String sort = 'analytics.travelers.score',
      ResultView resultView = ResultView.FULL}) async {
    Map<String, String> query = HashMap<String, String>();
    query.putIfAbsent(
        'subType', () => locationSubType.toString().split('.').last);
    query.putIfAbsent('keyword', () => keyword);
    if (countryCode != null) {
      query.putIfAbsent('countryCode', () => countryCode);
    }
    query.putIfAbsent('page[limit]', () => pageLimit.toString());
    query.putIfAbsent('page[offset]', () => pageOffset.toString());
    query.putIfAbsent('sort', () => sort);
    query.putIfAbsent('view', () => resultView.toString().split('.').last);

    Uri uri = getUri(locationsPath, query, test);
    final response = await executeQuery(uri);

    return (jsonDecode(response.body)['data'] as List)
        .map((i) => Location.fromJson(i))
        .toList();
  }

  /// Returns a list of [FlightOffer]s based on search criteria passed into this
  /// method.
  /// [originLocationCode] city/airport IATA code from which the traveler will
  /// depart, e.g. BOS for Boston
  /// [destinationLocationCode] city/airport IATA code to which the traveler is
  /// going, e.g. PAR for Paris
  /// [departureDate] the date on which the traveler will depart from the origin
  /// to go to the destination. Dates are specified in the ISO 8601 YYYY-MM-DD
  /// format, e.g. 2017-12-25
  /// [returnDate] the date on which the traveler will depart from the destination
  /// to return to the origin. If this parameter is not specified, only one-way
  /// itineraries are found. If this parameter is specified, only round-trip
  /// itineraries are found. Dates are specified in the ISO 8601 YYYY-MM-DD
  /// format, e.g. 2018-02-28
  /// [adults] the number of adult travelers (age 12 or older on date of
  /// departure). The total number of seated travelers (adult and children) can
  /// not exceed 9.
  /// [children] the number of child travelers (older than age 2 and younger than
  /// age 12 on date of departure) who will each have their own separate seat. If
  /// specified, this number should be greater than or equal to 0. The total
  /// number of seated travelers (adult and children) can not exceed 9.
  /// [infants] the number of infant travelers (whose age is less or equal to 2 on
  /// date of departure). Infants travel on the lap of an adult traveler, and thus
  /// the number of infants must not exceed the number of adults. If specified,
  /// this number should be greater than or equal to 0
  /// [travelClass] most of the flight time should be spent in a cabin of this
  /// quality or higher. The accepted travel class is economy, premium economy,
  /// business or first class. If no travel class is specified, the search
  /// considers any travel class. Available values : ECONOMY, PREMIUM_ECONOMY,
  /// BUSINESS, FIRST
  /// [includeAirlineCodes] This option ensures that the system will only consider
  /// these airlines. This can not be cumulated with parameter
  /// excludedAirlineCodes.  Airlines are specified as IATA airline codes and are
  /// comma-separated, e.g. 6X,7X,8X
  /// [excludeAirlineCodes] This option ensures that the system will ignore these
  /// airlines. This can not be cumulated with parameter includedAirlineCodes.
  /// Airlines are specified as IATA airline codes and are comma-separated, e.g.
  /// 6X,7X,8X
  /// [nonStop] if set to true, the search will find only flights going from the
  /// origin to the destination with no stop in between
  /// [currencyCode] the preferred currency for the flight offers. Currency is
  /// specified in the ISO 4217 format, e.g. EUR for Euro
  /// [maxPrice] maximum price per traveler. By default, no limit is applied.
  /// If specified, the value should be a positive number with no decimals
  /// [max] maximum number of flight offers to return. If specified, the value
  /// should be greater than or equal to 1
  Future<List<FlightOffer>> searchFlightOffers(
      {required String originLocationCode,
      required String destinationLocationCode,
      required String departureDate,
      String? returnDate,
      int adults = 1,
      int? children,
      int? infants,
      TravelClass? travelClass,
      String? includeAirlineCodes,
      String? excludeAirlineCodes,
      bool? nonStop = false,
      String? currencyCode,
      int? maxPrice,
      int? max = 250}) async {
    Map<String, String> query = HashMap<String, String>();
    query.putIfAbsent('originLocationCode', () => originLocationCode);
    query.putIfAbsent('destinationLocationCode', () => destinationLocationCode);
    query.putIfAbsent('departureDate', () => departureDate);
    if (returnDate != null) {
      query.putIfAbsent('returnDate', () => returnDate);
    }
    query.putIfAbsent('adults', () => adults.toString());
    if (children != null) {
      query.putIfAbsent('children', () => children.toString());
    }
    if (infants != null) {
      query.putIfAbsent('infants', () => infants.toString());
    }
    if (travelClass != null) {
      query.putIfAbsent(
          'travelClass', () => travelClass.toString().split('.').last);
    }
    if (includeAirlineCodes != null) {
      query.putIfAbsent('includeAirlineCodes', () => includeAirlineCodes);
    }
    if (excludeAirlineCodes != null) {
      query.putIfAbsent('excludeAirlineCodes', () => excludeAirlineCodes);
    }
    if (nonStop != null) {
      query.putIfAbsent('nonStop', () => nonStop.toString());
    }
    if (currencyCode != null) {
      query.putIfAbsent('currencyCode', () => currencyCode);
    }
    if (maxPrice != null) {
      query.putIfAbsent('maxPrice', () => maxPrice.toString());
    }
    query.putIfAbsent('max', () => max.toString());

    Uri uri = getUri(flightOffersPath, query, test);
    final response = await executeQuery(uri);

    // TODO check for errors

    return (json.decode(response.body)['data'] as List)
        .map((e) => FlightOffer.fromJson(e))
        .toList();
  }
}

enum ResultView { FULL, LIGHT }
