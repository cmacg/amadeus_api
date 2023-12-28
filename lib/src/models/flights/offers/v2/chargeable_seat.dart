/// Details of a chargeable seat
class ChargeableSeat {
  /// Id of the chargeable seat
  final String? id;

  /// The seat number. Pattern: [1-9][0-9]{0,2}[A-Z]?
  final String? number;

  ChargeableSeat({this.id, this.number});

  ChargeableSeat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        number = json['number'];
}
