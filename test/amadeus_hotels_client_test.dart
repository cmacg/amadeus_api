import 'package:amadeusapi/amadeus_hotels_client.dart';
import 'package:amadeusapi/models/hotels/hotel_offers.dart';

final String apiKey = 'DliX4pnlWMxirhNB7gxRAASy2QtBVlSR';
final String apiSecret = 'k7oJQF5fuG9bw0X6';

void main() async {

    AmadeusHotelsClient hotelClient = AmadeusHotelsClient(apiKey: apiKey, apiSecret: apiSecret, test: true);
    String token = await hotelClient.authorize();
    print('Token: ' + token);

    //https://test.api.amadeus.com/v2/shopping/hotel-offers?cityCode=PAR&adults=1&radius=5
    // &radiusUnit=KM&paymentPolicy=NONE&includeClosed=false&bestRateOnly=true&view=FULL&sort=PRICE

    List<HotelOffers> offers = await hotelClient.hotelSearch(cityCode: 'PAR', adults: 1, radius: 5, radiusUnit: RadiusUnit.KM,
        paymentPolicy: PaymentPolicy.NONE, includeClosed: false, bestRateOnly: true, viewType: ViewType.FULL,
        sortType: SortType.PRICE);

    print('We got offers ' + offers.toString());
}