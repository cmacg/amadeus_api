import 'package:amadeusapi/models/hotels/offers/v3/hotel_offers.dart';

class MultiResponse {
  final List<HotelOffers>? data;

  MultiResponse({this.data});

  MultiResponse.fromJson(Map<String, dynamic> json)
      : data = json['data'] == null
            ? null
            : (json['data'] as List)
                .map((i) => HotelOffers.fromJson(i))
                .toList();
}