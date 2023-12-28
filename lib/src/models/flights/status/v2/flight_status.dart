import 'dated_flight.dart';

class FlightStatus {
  final List<DatedFlight> datedFlights;

  FlightStatus({required this.datedFlights});

  FlightStatus.fromJson(Map<String, dynamic> json)
      : datedFlights =
            (json['data'] as List).map((e) => DatedFlight.fromJson(e)).toList();
}
