class Address {
  final List<String> lines;
  final String postalCode;
  final String cityName;
  final String stateCode;
  final String countryCode;

  Address({this.lines, this.postalCode, this.cityName, this.stateCode, this.countryCode});

  Address.fromJson(Map<String, dynamic> json)
      : lines = json['lines'] == null ? null : List<String>.from(json["lines"].map((x) => x)),
        postalCode = json['postalCode'],
        cityName = json['cityName'],
        stateCode = json['stateCode'],
        countryCode = json['countryCode'];

  Map<String, dynamic> toJson() => {
    'lines': lines == null ? null : lines,
    'postalCode': postalCode,
    'cityName': cityName,
    'stateCode': stateCode,
    'countryCode': countryCode,
  };
}