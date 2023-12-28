class FlightDesignator {
  /// 2 to 3-character IATA code of the carrier. e.g. 6X
  final String? carrierCode;

  /// 1 to 4-digit number of the flight e.g. 4537
  final int? flightNumber;

  /// 1-letter operational suffix of the flight e.g. A
  final String? operationalSuffix;

  FlightDesignator(
      {this.carrierCode, this.flightNumber, this.operationalSuffix});

  FlightDesignator.fromJson(Map<String, dynamic> json)
      : carrierCode = json['carrierCode'],
        flightNumber = json['flightNumber'],
        operationalSuffix = json['operationalSuffix'];
}
