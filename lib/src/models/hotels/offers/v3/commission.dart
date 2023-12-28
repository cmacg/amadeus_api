import 'qualified_free_text.dart';

class Commission {
  /// Percentage of the commission paid to the travel seller. Value is between
  /// 0 and 100.
  /// pattern: ^\\d+(\\.\\d+)?$
  final String? percentage;

  /// Amount of the commission paid to the travel seller. The amount is always
  /// linked to the currency code of the offer.
  final String? amount;

  /// Specific type to convey a list of string for specific information type
  /// (via qualifier) in specific character set, or language.
  final QualifiedFreeText? description;

  Commission({this.percentage, this.amount, this.description});

  Commission.fromJson(Map<String, dynamic> json)
      : percentage = json['percentage'],
        amount = json['amount'],
        description = json['description'] == null
            ? null
            : QualifiedFreeText.fromJson(json['description']);
}
