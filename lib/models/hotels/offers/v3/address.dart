/// Generic address class
class Address {
  /// Address lines
  final List<String>? lines;

  /// Postal code
  final String? postalCode;

  /// City name
  final String? cityName;

  /// State code
  final String? stateCode;

  /// Country code
  final String? countryCode;

  Address(
      {required this.lines,
      required this.postalCode,
      this.cityName,
      this.stateCode,
      required this.countryCode});

  Address.fromJson(Map<String, dynamic> json)
      : lines = json['lines'] == null
            ? null
            : List<String>.from(json['lines'].map((x) => x)),
        postalCode = json['postalCode'] == null ? null : json['postalCode'],
        cityName = json['cityName'] == null ? null : json['cityName'],
        stateCode = json['stateCode'] == null ? null : json['stateCode'],
        countryCode = json['countryCode'] == null ? null : json['countryCode'];
}
