import 'package:amadeusapi/models/hotels/offers/v3/hotel_price.dart';
import 'package:amadeusapi/models/hotels/offers/v3/price_variation.dart';

/// Daily price variations and the average daily price (when available).
class PriceVariations {
  /// Price valuation information.
  final HotelPrice? average;

  /// A collection of price periods if the daily price changes during the stay.
  final List<PriceVariation>? priceVariations;

  PriceVariations({this.average, this.priceVariations});

  PriceVariations.fromJson(Map<String, dynamic> json)
      : average = json['average'] == null
            ? null
            : HotelPrice.fromJson(json['average']),
        priceVariations = json['changes'] == null
            ? null
            : List<PriceVariation>.from(json["changes"]
                .map((variation) => PriceVariation.fromJson(variation)));
}
