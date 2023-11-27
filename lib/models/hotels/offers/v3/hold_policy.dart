/// The hold policy.
class HoldPolicy {
  /// The date and time of the deadline in ISO 8601[https://www.w3.org/TR/NOTE-datetime].
  /// Example: 2010-08-14T13:00:00
  /// Please note that this value is expressed in the hotels local time zone
  final DateTime deadline;

  HoldPolicy({required this.deadline});

  HoldPolicy.fromJson(Map<String, dynamic> json)
      : deadline = DateTime.parse(json['deadline']);
}
