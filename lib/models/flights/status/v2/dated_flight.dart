import 'package:amadeusapi/models/flights/status/v2/segment.dart';
import 'package:amadeusapi/models/flights/status/v2/flight_designator.dart';
import 'package:amadeusapi/models/flights/status/v2/flight_point.dart';
import 'package:amadeusapi/models/flights/status/v2/leg.dart';

class DatedFlight {
  final String type;
  final DateTime? scheduledDepartureDate;
  final FlightDesignator? flightDesignator;
  final List<FlightPoint>? flightPoints;
  final List<Segment>? segments;
  final List<Leg>? legs;

  DatedFlight(
      {required this.type,
      this.scheduledDepartureDate,
      this.flightDesignator,
      this.flightPoints,
      this.segments,
      this.legs});

  DatedFlight.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        scheduledDepartureDate = json['scheduledDepartureDate'] == null
            ? null
            : DateTime.parse(json['scheduledDepartureDate']),
        flightDesignator = json['flightDesignator'] == null
            ? null
            : FlightDesignator.fromJson(json['flightDesignator']),
        flightPoints = json['flightPoints'] == null
            ? null
            : (json['flightPoints'] as List)
                .map((e) => FlightPoint.fromJson(e))
                .toList(),
        segments = json['segments'] == null
            ? null
            : (json['segments'] as List)
                .map((e) => Segment.fromJson(e))
                .toList(),
        legs = json['legs'] == null
            ? null
            : (json['legs'] as List).map((e) => Leg.fromJson(e)).toList();
}
