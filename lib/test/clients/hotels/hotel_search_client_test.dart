import 'package:test/test.dart';

import '../../../credentials.dart';
import '../../../src/clients/hotels/amadeus_hotels_client.dart';
import '../../../src/models/distance.dart';
import '../../../src/models/hotels/search/v1/hotels_search_response.dart';

void main() async {
  final AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);

  test('Testing the hotel search by city', () async {
    HotelsSearchResponse citySearchResponse =
        await hotelClient.searchHotelsByCityCode(
            cityCode: 'PAR', radius: 5, radiusUnit: DistanceUnit.KILOMETERS);
    expect(citySearchResponse, isNotNull);
  });

  test('Testing the hotel search by geo code', () async {
    HotelsSearchResponse geoCodeSearchResponse =
        await hotelClient.searchHotelsByGeoCode(
            latitude: 37.791552,
            longitude: -122.4320108,
            radius: 5,
            radiusUnit: DistanceUnit.KILOMETERS);
    expect(geoCodeSearchResponse, isNotNull);
  });

  test('Testing the hotel search by hotel id ', () async {
    HotelsSearchResponse hotelIdSearchResponse =
        await hotelClient.searchHotelsByHotelId(hotelIds: ['WVSFOTMH']);
    expect(hotelIdSearchResponse, isNotNull);
  });
}
