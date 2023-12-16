class BaggageAllowance {
  /// Total number of units.
  final int? quantity;

  /// Weight of the baggage allowance.
  final int? weight;

  /// Code to qualify unit as pounds or kilos.
  final String? weightUnit;

  BaggageAllowance({this.quantity, this.weight, this.weightUnit});

  BaggageAllowance.fromJson(Map<String, dynamic> json)
      : quantity = json['quantity'],
        weight = json['weight'],
        weightUnit = json['weightUnit'];
}
