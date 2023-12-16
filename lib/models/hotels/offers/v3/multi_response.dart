import 'package:amadeusapi/models/hotels/offers/v3/hotel_offers.dart';

/// Response with multiple hotel offers that is returned by the client when the
/// user is searching for multiple hotel offers.
class MultiResponse {
  final List<HotelOffers>? hotelOffers;

  MultiResponse({this.hotelOffers});

  MultiResponse.fromJson(Map<String, dynamic> json)
      : hotelOffers = json['data'] == null
            ? null
            : (json['data'] as List)
                .map((i) => HotelOffers.fromJson(i))
                .toList();
}
