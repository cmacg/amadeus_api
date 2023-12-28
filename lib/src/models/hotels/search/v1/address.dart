/// Address information
class Address {
  /// ISO 3166-1 country code
  final String countryCode;

  Address({required this.countryCode});

  Address.fromJson(Map<String, dynamic> json)
      : countryCode = json['countryCode'];
}
