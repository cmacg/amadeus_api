/// Details of chargeable checked bags
class ChargeableCheckedBags {
  /// Total number of units
  final int? quantity;

  /// Weight of the baggage allowance
  final int? weight;

  /// Code to qualify unit as pounds or kilos (ex. KG)
  final String? weightUnit;

  /// Id of the chargeable bag
  final String? id;

  ChargeableCheckedBags({this.quantity, this.weight, this.weightUnit, this.id});

  ChargeableCheckedBags.fromJson(Map<String, dynamic> json)
      : quantity = json['quantity'],
        weight = json['weight'],
        weightUnit = json['weightUnit'],
        id = json['id'];
}
