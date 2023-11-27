import 'package:amadeusapi/credentials.dart';
import 'package:amadeusapi/amadeus_hotels_v3_client.dart';
import 'package:amadeusapi/client_exception.dart';
import 'package:amadeusapi/models/hotels/offers/v3/multi_response.dart';

import 'package:test/test.dart';

void main() async {
  AmadeusHotelsV3Client hotelClient = AmadeusHotelsV3Client(
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

  print('Success');
}
