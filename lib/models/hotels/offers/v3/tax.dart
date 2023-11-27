/// IATA Tax definition: An impost for raising revenue for the general treasury
/// and which will be used for general public purposes.
class Tax {
  /// Defines a monetary unit. It is a three alpha code (iata code). Example: EUR
  /// for Euros, USD for US dollar, etc.
  final String? currency;

  /// Defines amount with decimal separator.
  final String? amount;

  /// International Standards Organization (ISO) Tax code.It is a two-letter
  /// country code.
  final String? code;

  /// In the case of a tax on TST value, the percentage of the tax will be
  /// indicated in this field.
  final String? percentage;

  /// Indicates if tax is included or not
  final bool? included;

  /// Example - "Governement tax"
  final String? description;

  /// Specifies if the tax applies per stay or per night
  final PricingFrequency? pricingFrequency;

  /// Specifies if the tax applies per occupant or per room
  final PricingMode? pricingMode;

  Tax(
      {this.currency,
      this.amount,
      this.code,
      this.percentage,
      this.included,
      this.description,
      this.pricingFrequency,
      this.pricingMode});

  Tax.fromJson(Map<String, dynamic> json)
      : currency = json['currency'],
        amount = json['amount'],
        code = json['code'],
        percentage = json['percentage'],
        included = json['included'],
        description = json['description'],
        pricingFrequency = json['pricingFrequency'] == null
            ? null
            : _getPricingFrequency(json['pricingFrequency']),
        pricingMode = json['pricingMode'] == null
            ? null
            : _getPricingMode(json['pricingMode']);

  static PricingFrequency? _getPricingFrequency(String frequency) {
    for (PricingFrequency pricingFrequency in PricingFrequency.values) {
      if (pricingFrequency.toString().endsWith(frequency)) {
        return pricingFrequency;
      }
    }
    return null;
  }

  static PricingMode? _getPricingMode(String mode) {
    for (PricingMode pricingMode in PricingMode.values) {
      if (pricingMode.toString().endsWith(mode)) {
        return pricingMode;
      }
    }
    return null;
  }
}

enum PricingFrequency { PER_STAY, PER_NIGHT }

enum PricingMode { PER_OCCUPANT, PER_ROOM }
