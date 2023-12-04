/// Rooms repartition (when used the rooms array items must match the shopping
/// offer roomQuantity).
class Room {
  /// Ids of the guest that will be in the room.
  final List<int>? guestIds;

  /// If missing, the first payment is used (optional)
  final int? paymentId;

  /// Special request to send to the reception (optional)
  final String? specialRequest;

  Room({this.guestIds, this.paymentId, this.specialRequest});

  Map<String, dynamic> toJson() => {
        'guestIds': this.guestIds == null ? null : guestIds,
        'paymentId': this.paymentId,
        'specialRequest': this.specialRequest
      };
}
