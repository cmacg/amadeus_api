class Fee {
  /// Fee amount.
  final String? amount;

  /// The type of the fee
  final FeeType? feeType;

  Fee({this.amount, this.feeType});

  Fee.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        feeType = json['type'] == null ? null : _getFeeType(json['type']);

  static FeeType? _getFeeType(String type) {
    for (FeeType feeType in FeeType.values) {
      if (feeType.toString().endsWith(type)) {
        return feeType;
      }
    }
    return null;
  }
}

enum FeeType { TICKETING, FORM_OF_PAYMENT, SUPPLIER }
