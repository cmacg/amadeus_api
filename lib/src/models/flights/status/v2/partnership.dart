import 'flight_designator.dart';

class Partnership {
  final FlightDesignator operatingFlight;

  Partnership({required this.operatingFlight});

  Partnership.fromJson(Map<String, dynamic> json)
      : operatingFlight = FlightDesignator.fromJson(json['operatingFlight']);
}
