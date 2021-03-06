import 'package:amadeusapi/models/hotels/hotel.dart';
import 'package:amadeusapi/models/hotels/offer.dart';

class HotelOffers {
  final String type;
  final bool available;
  final Hotel hotel;
  final List<Offer> offers;
  final String self;

  HotelOffers({this.type, this.available, this.hotel, this.offers, this.self});

  HotelOffers.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        available = json['available'],
        hotel = json['hotel'] == null ? null : Hotel.fromJson(json['hotel']),
        offers = json['offers'] == null ? null :
            (json['offers'] as List).map((i) => Offer.fromJson(i)).toList(),
        self = json['self'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'available': available,
        'hotel': hotel == null ? null : hotel.toJson(),
        'offers': offers == null ? null : offers.map((i) => i.toJson()),
        'self': self,
      };
}
