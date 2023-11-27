import 'package:amadeusapi/models/hotels/offers/v3/markup.dart';

/// Daily price variations and the average daily price (when available) is shown here
class PriceVariation {
  /// Begin date of the period Format: YYYY-MM-DD
  final DateTime startDate;

  /// End date of the period Format: YYYY-MM-DD
  final DateTime endDate;

  /// Currency Code apply to all elements of the price
  final String? currency;

  /// SellingTotal = Total + margins + markup + totalFees - discounts
  final String? sellingTotal;

  /// Total = base + totalTaxes
  final String? total;

  /// Base price
  final String? base;

  /// Markups applied to provide a service or a product to the client. The
  /// markup can be introduced by any stakeholder. Typical use case is to convey
  /// markup information set by the travel agent or in case of merchant mode.
  final List<Markup>? markups;

  PriceVariation(
      {required this.startDate,
      required this.endDate,
      this.currency,
      this.sellingTotal,
      this.total,
      this.base,
      this.markups});

  PriceVariation.fromJson(Map<String, dynamic> json)
      : startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        currency = json['currency'],
        sellingTotal = json['sellingTotal'],
        total = json['total'],
        base = json['base'],
        markups = json['markups'] == null
            ? null
            : List<Markup>.from(json['markups'].map((x) => Markup.fromJson(x)));
}
