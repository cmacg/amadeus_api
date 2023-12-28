import 'hotel.dart';
import 'hotel_offer.dart';

class HotelOffers {
  final String? type;

  /// Indicates whether the offer is available or not.
  final bool? available;

  /// Hotel information.
  final Hotel? hotel;

  /// List of offers.
  final List<HotelOffer>? offers;

  /// A self link to the object. Use this to refresh the Offers prices.
  final String? self;

  HotelOffers(
      {required this.type,
      this.available = false,
      this.hotel,
      this.offers,
      required this.self});

  HotelOffers.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        available = json['available'],
        hotel = json['hotel'] == null ? null : Hotel.fromJson(json['hotel']),
        offers = json['offers'] == null
            ? null
            : (json['offers'] as List)
                .map((i) => HotelOffer.fromJson(i))
                .toList(),
        self = json['self'];
}
