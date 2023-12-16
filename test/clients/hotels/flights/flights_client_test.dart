import 'package:amadeusapi/clients/flights/amadeus_flights_client.dart';
import 'package:amadeusapi/credentials.dart';
import 'package:amadeusapi/models/flights/locations/v1/location.dart';
import 'package:amadeusapi/models/flights/offers/v2/flight_offer.dart';
import 'package:amadeusapi/models/flights/offers/v2/itineraries.dart';
import 'package:amadeusapi/models/flights/offers/v2/segment.dart';
import 'package:amadeusapi/models/flights/status/v2/flight_status.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

final String locationId = "CMUC";

void main() async {
  final AmadeusFlightsClient flightsClient = AmadeusFlightsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);

  test('Testing location lookup', () async {
    Location location =
        await flightsClient.searchLocationsById(locationId: locationId);
    expect(location.id, locationId);
    expect(location.type, 'location');
    expect(location.subType, LocationSubType.CITY);
    expect(location.name, 'MUNICH');
    expect(location.iataCode, 'MUC');
    expect(location.address!.cityCode, 'MUC');
    expect(location.address!.cityName, 'MUNICH');
    expect(location.address!.countryName, 'GERMANY');
    expect(location.address!.countryCode, 'DE');
    expect(location.geoCode!.latitude, 48.35389);
    expect(location.geoCode!.longitude, 11.78612);
    expect(location.analytics!.travelers, isNotNull);
    expect(location.analytics!.travelers!.score, 27);
  });

  test('Testing locations search', () async {
    List<Location> locations = await flightsClient.searchLocations(
        locationSubType: LocationSubType.CITY, keyword: 'MUC');

    expect(locations, isNotNull);
    expect(locations.length, 1);
    expect(locations[0].name, 'MUNICH');
    expect(locations[0].iataCode, 'MUC');
    expect(locations[0].address!.cityCode, 'MUC');
    expect(locations[0].address!.cityName, 'MUNICH');
    expect(locations[0].address!.countryName, 'GERMANY');
    expect(locations[0].address!.countryCode, 'DE');
    expect(locations[0].geoCode!.latitude, 48.35389);
    expect(locations[0].geoCode!.longitude, 11.78612);
    expect(locations[0].analytics!.travelers, isNotNull);
    expect(locations[0].analytics!.travelers!.score, 27);
  });

  test('testing flight offers search', () async {
    DateTime now = DateTime.now();
    DateTime depart = DateTime(now.year, now.month, now.day + 14);
    List<FlightOffer> flightOffers = await flightsClient.searchFlightOffers(
        originLocationCode: 'PDX',
        destinationLocationCode: 'LAX',
        departureDate: DateFormat('yyyy-M-d').format(depart));

    expect(flightOffers, isNotNull);
    expect(flightOffers.length, isNonNegative);
    FlightOffer flightOffer = flightOffers[0];
    expect(flightOffer.type, 'flight-offer');
    expect(flightOffer.itineraries, isNotEmpty);
    Itineraries itineraries = flightOffer.itineraries![0];
    expect(itineraries.segments, isNotEmpty);
    Segment segment = itineraries.segments[0];
    expect(segment.departure!.iataCode, 'PDX');
  });

  test('Testing flight status', () async {
    DateTime now = DateTime.now();

    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    FlightStatus flightStaus = await flightsClient.flightStatus(
        carrierCode: 'TP',
        flightNumber: '487',
        scheduledDepartureDate: dateFormat.format(now));

    expect(flightStaus, isNotNull);
  });
}
