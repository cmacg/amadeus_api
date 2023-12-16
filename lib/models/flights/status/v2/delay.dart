/// A delay that might be recorded on a timing
class Delay {
  /// The delay recorded for the timing following ISO 8601.
  /// example: PT25M
  final String duration;
  Delay({required this.duration});

  Delay.fromJson(Map<String, dynamic> json) : duration = json['duration'];
}
