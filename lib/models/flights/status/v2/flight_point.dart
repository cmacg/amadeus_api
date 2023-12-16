import 'package:amadeusapi/models/flights/status/v2/arrival.dart';
import 'package:amadeusapi/models/flights/status/v2/departure.dart';

class FlightPoint {
  /// 3-letter IATA code of the airport. e.g. CDG
  final String? iataCode;

  /// Flight depature point details
  final Departure? departure;

  /// Flight arrival point details
  final Arrival? arrival;

  FlightPoint({this.iataCode, this.departure, this.arrival});

  FlightPoint.fromJson(Map<String, dynamic> json)
      : iataCode = json['iataCode'],
        departure = json['departure'] == null
            ? null
            : Departure.fromJson(json['departure']),
        arrival =
            json['arrival'] == null ? null : Arrival.fromJson(json['arrival']);
}
