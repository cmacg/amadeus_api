import 'package:amadeusapi/credentials.dart';
import 'package:amadeusapi/clients/hotels/amadeus_hotels_client.dart';
import 'package:amadeusapi/client_exception.dart';
import 'package:amadeusapi/models/hotels/offers/v3/multi_response.dart';
import 'package:amadeusapi/models/hotels/search/v1/distance.dart';
import 'package:amadeusapi/models/hotels/search/v1/hotels_search_response.dart';

import 'package:test/test.dart';

void main() async {
  final AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);

  var ids = ['MCLONGHM', 'MCMARCOI'];
  DateTime now = DateTime.now();
  try {
    MultiResponse multiResponse = await hotelClient.getMultiHotelOffers(
        hotelIds: ids,
        checkInDate: DateTime(now.year, now.month, now.day + 1),
        checkOutDate: DateTime(now.year, now.month, now.day + 2),
        countryOfResidence: 'US',
        adults: 1,
        includeClosed: false,
        bestRateOnly: false);

    test('Testing the Amadeus hotels v3 client', () {
      expect(multiResponse, isNotNull);
    });
  } on AmadeusClientHttpException catch (e) {
    print('Exception occurred when trying to call getMultiHotelOffers: $e');
  }

  try {
    HotelsSearchResponse citySearchResponse =
        await hotelClient.searchHotelsByCityCode(
            cityCode: 'PAR', radius: 5, radiusUnit: DistanceUnit.KILOMETERS);

    test('Testing the hotel search by city', () {
      expect(citySearchResponse, isNotNull);
    });
  } on AmadeusClientHttpException catch (e) {
    print('Exception occurred when trying to call search hotels: $e');
  }
  print('Success');

  try {
    HotelsSearchResponse geoCodeSearchResponse =
        await hotelClient.searchHotelsByGeoCode(
            latitude: 37.791552,
            longitude: -122.4320108,
            radius: 5,
            radiusUnit: DistanceUnit.KILOMETERS);

    test('Testing the hotel search by geo code', () {
      expect(geoCodeSearchResponse, isNotNull);
    });
  } on AmadeusClientHttpException catch (e) {
    print('Exception occurred when trying to call search hotels: $e');
  }
  print('Success');

  try {
    HotelsSearchResponse hotelIdSearchResponse =
        await hotelClient.searchHotelsByHotelId(hotelIds: ['WVSFOTMH']);

    test('Testing the hotel search by hotel id ', () {
      expect(hotelIdSearchResponse, isNotNull);
    });
  } on AmadeusClientHttpException catch (e) {
    print('Exception occurred when trying to call search hotels: $e');
  }
  print('Success');
}
