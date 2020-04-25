import 'package:amadeusapi/models/hotels/tax.dart';
import 'package:amadeusapi/models/hotels/variations.dart';

class Price {
  final String currency;
  final String total;
  final String base;
  final List<Tax> taxes;
  final Variations variations;

  Price({this.currency, this.total, this.base, this.taxes, this.variations});

  Price.fromJson(Map<String, dynamic> json)
      : currency = json['currency'],
        total = json['total'],
        base = json['base'],
        taxes = json['taxes'] == null
            ? null
            : List<Tax>.from(json['taxes'].map((x) => Tax.fromJson(x))),
        variations = json['variations'] == null
            ? null
            : Variations.fromJson(json['variations']);

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'total': total,
        'base': base,
        'taxes': List<dynamic>.from(taxes.map((x) => x.toJson())),
        'variations': variations == null ? null : variations.toJson(),
      };
}
