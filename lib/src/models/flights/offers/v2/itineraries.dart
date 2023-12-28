import 'segment.dart';

class Itineraries {
  /// duration in ISO8601 PnYnMnDTnHnMnS format, e.g. PT2H10M for a duration of
  /// 2h10m
  final String? duration;

  /// The segments of the trip that make up this itinerary.
  final List<Segment> segments;

  Itineraries({this.duration, required this.segments});

  Itineraries.fromJson(Map<String, dynamic> json)
      : duration = json['duration'],
        segments =
            (json['segments'] as List).map((e) => Segment.fromJson(e)).toList();
}
