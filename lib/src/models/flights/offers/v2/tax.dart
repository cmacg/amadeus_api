class Tax {
  /// The amount of the taxes
  final String? amount;

  /// Currency code?
  final String? code;

  Tax({this.amount, this.code});

  Tax.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        code = json['code'];
}
