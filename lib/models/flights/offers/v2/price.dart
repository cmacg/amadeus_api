import 'package:amadeusapi/models/flights/offers/v2/fee.dart';
import 'package:amadeusapi/models/hotels/offers/v3/tax.dart';

class Price {
  /// The currency code of the prices
  final String? currency;

  /// Total amount paid by the user
  final String? total;

  /// Amount without taxes
  final String? base;

  /// List of applicable fees
  final List<Fee>? fees;

  /// List of applicable taxes
  final List<Tax>? taxes;

  /// The amount of taxes which are refundable
  final String? refundableTaxes;

  Price(
      {this.currency,
      this.total,
      this.base,
      this.fees,
      this.taxes,
      this.refundableTaxes});

  Price.fromJson(Map<String, dynamic> json)
      : currency = json['currency'],
        total = json['total'],
        base = json['base'],
        fees = json['fees'] == null
            ? null
            : (json['fees'] as List).map((e) => Fee.fromJson(e)).toList(),
        taxes = json['taxes'] == null
            ? null
            : (json['taxes'] as List).map((e) => Tax.fromJson(e)).toList(),
        refundableTaxes = json['refundableTaxes'];
}
