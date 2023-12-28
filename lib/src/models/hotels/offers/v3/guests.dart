class Guests {
  /// Number of adult guests (1-9) per room.
  final int adults;

  /// List of ages of each child at the time of check-out from the hotel. If
  /// several children have the same age, the ages will be repeated.
  final List<int>? childAges;

  Guests({this.adults = 1, this.childAges});

  Guests.fromJson(Map<String, dynamic> json)
      : adults = json['adults'],
        childAges =
            json['childAges'] == null ? null : json['childAges'] as List<int>;
}
