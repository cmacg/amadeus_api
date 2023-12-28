/// Details of stops for direct or change of gauge flights
class FlightStop {
  /// ATA airline codes.  example: JFK
  final String? iataCode;

  /// Stop duration in ISO8601 PnYnMnDTnHnMnS format, e.g. PT2H10M
  final String? duration;

  /// Arrival at the stop in ISO8601 YYYY-MM-ddThh:mm:ss format,
  /// e.g. 2017-02-10T20:40:00
  final DateTime? arrivalAt;

  /// Departure from the stop in ISO8601 YYYY-MM-ddThh:mm:ss format,
  /// e.g. 2017-02-10T20:40:00
  final DateTime? departureAt;

  FlightStop({this.iataCode, this.duration, this.arrivalAt, this.departureAt});

  FlightStop.fromJson(Map<String, dynamic> json)
      : iataCode = json['iataCode'],
        duration = json['duration'],
        arrivalAt = DateTime.parse(json['arrivalAt']),
        departureAt = DateTime.parse(json['departureAt']);
}
