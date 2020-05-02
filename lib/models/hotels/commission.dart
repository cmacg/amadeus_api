import 'package:amadeusapi/models/hotels/description.dart';

class Commission {

  final String percentage;
  final String amount;
  final Description description;

  Commission(this.percentage, this.amount, this.description);

  Commission.fromJson(Map<String, dynamic> json)
  :   percentage = json['percentage'],
    amount = json['amount'],
    description = json['description'] == null ? null : Description.fromJson(json['description']);

  Map<String, dynamic> toJson() => {
    'percentage': percentage,
    'amount': amount,
    'description': description == null ? null :  description.toJson(),
  };
}