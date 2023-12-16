class Address {
  /// Name of the city of the location; equal to name if the location is a city
  final String? cityName;

  /// IATA code of the city of the location; equal to IATAcode if the location
  /// is a city.
  final String? cityCode;

  /// Name of the country of the location
  final String? countryName;

  /// Code of the country of the location in ISO standard
  final String? countryCode;

  /// Code of the state of the location if any
  final String? stateCode;

  /// Code of the region of the location in ISO standard
  final String? regionCode;

  Address(
      {this.cityName,
      this.cityCode,
      this.countryName,
      this.countryCode,
      this.stateCode,
      this.regionCode});

  Address.fromJson(Map<String, dynamic> json)
      : cityName = json['cityName'],
        cityCode = json['cityCode'],
        countryCode = json['countryCode'],
        countryName = json['countryName'],
        stateCode = json['stateCode'],
        regionCode = json['regionCode'];
}
