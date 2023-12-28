import 'markup.dart';
import 'price_variations.dart';
import 'tax.dart';

/// Hotel price information.
class HotelPrice {
  /// The currency Code apply to all elements of the price.
  final String? currency;

  /// SellingTotal = Total + margins + markup + totalFees - discounts.
  final String? sellingTotal;

  /// Total = base + totalTaxes.
  final String? total;

  /// Base price.
  final String? base;

  /// IATA Tax definition: An impost for raising revenue for the general
  /// treasury and which will be used for general public purposes.
  final List<Tax>? taxes;

  /// Markup applied to provide a service or a product to the client. The markup
  /// can be introduced by any stakeholder. Typical use case is to convey markup
  /// information set by the travel agent or in case of merchant mode.
  final List<Markup>? markups;

  /// Daily price variations and the average daily price (when available).
  final PriceVariations? variations;

  HotelPrice(
      {this.currency,
      this.sellingTotal,
      this.total,
      this.base,
      this.taxes,
      this.markups,
      this.variations});

  HotelPrice.fromJson(Map<String, dynamic> json)
      : currency = json['currency'],
        sellingTotal = json['sellingTotal'],
        total = json['total'],
        base = json['base'],
        taxes = json['taxes'] == null
            ? null
            : List<Tax>.from(json['taxes'].map((x) => Tax.fromJson(x))),
        markups = json['markups'] == null
            ? null
            : List<Markup>.from(json['markups'].map((x) => Markup.fromJson(x))),
        variations = json['variations'] == null
            ? null
            : PriceVariations.fromJson(json['variations']);
}
