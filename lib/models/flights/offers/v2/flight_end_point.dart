/// Departure or arrival information
class FlightEndPoint {
  /// IATA airline code
  final String? iataCode;

  /// Terminal name or number
  final String? terminal;

  /// Local date and time in ISO8601 YYYY-MM-ddThh:mm:ss format,
  /// e.g. 2017-02-10T20:40:00
  final DateTime? at;

  FlightEndPoint({this.iataCode, this.terminal, this.at});

  FlightEndPoint.fromJson(Map<String, dynamic> json)
      : iataCode = json['iataCode'],
        terminal = json['terminal'],
        at = json['at'] == null ? null : DateTime.parse(json['at']);
}
