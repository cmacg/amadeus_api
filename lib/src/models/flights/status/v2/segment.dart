import 'partnership.dart';

class Segment {
  final String? boardPointIataCode;
  final String? offPointIataCode;
  final String? scheduledSegmentDuration;
  final Partnership? partnership;

  Segment(
      {this.boardPointIataCode,
      this.offPointIataCode,
      this.scheduledSegmentDuration,
      this.partnership});

  Segment.fromJson(Map<String, dynamic> json)
      : boardPointIataCode = json['boardPointIataCode'],
        offPointIataCode = json['offPointIataCode'],
        scheduledSegmentDuration = json['scheduledSegmentDuration'],
        partnership = json['partnership'] == null
            ? null
            : Partnership.fromJson(json['partnership']);
}
