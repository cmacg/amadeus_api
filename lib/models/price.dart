import 'package:amadeusapi/models/tax.dart';
import 'package:amadeusapi/models/variations.dart';

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
    taxes = (json['taxes'] as List).map((i) => Tax.fromJson(i)),
    variations = Variations.fromJson(json['variations']);

  Map<String, dynamic> toJson() => {
    'currency': currency,
    'total': total,
    'base': base,
    'taxes': taxes.map((i) => i.toJson()),
    'variations': variations.toJson(),
  };

}