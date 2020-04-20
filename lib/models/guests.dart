class Guests {
  final int adults;
  final List<int> childAges;

  Guests({this.adults, this.childAges});

  Guests.fromJson(Map<String, dynamic> json)
  : adults = json['adults'],
    childAges = json['childAges'] as List<int>;

  Map<String, dynamic> toJson() => {
    'adults': adults,
    'childAges': childAges,
  };
}