class Tax {

  final String currency;
  final String amount;
  final String code;
  final String percentage;
  final bool included;
  final String description;
  final String pricingFrequency;
  final String pricingMode;

  Tax({this.currency, this.amount, this.code, this.percentage, this.included,
      this.description, this.pricingFrequency, this.pricingMode});

  Tax.fromJson(Map<String, dynamic> json)
    : currency = json['currency'],
      amount = json['amount'],
      code = json['code'],
      percentage = json['percentage'],
      included = json['included'],
      description = json['description'],
      pricingFrequency = json['pricingFrequenct'],
      pricingMode = json['pricingMode'];

  Map<String, dynamic> toJson() => {
    'currency': currency,
    'amount': amount,
    'code': code,
    'percentage': percentage,
    'included': included,
    'description': description,
    'pricingFrequency': pricingFrequency,
    'pricingMode': pricingMode,
  };


}