import 'package:intl/intl.dart';

class HoldTime {

  final DateTime deadline;

  HoldTime({this.deadline});

  HoldTime.fromJson(Map<String, dynamic> json)
    : deadline = json['deadline'] == null ? null : DateTime.parse(json['deadline']);

  Map<String, dynamic> toJson() => {
    'deadline': deadline == null ? null : (new DateFormat("yyyy.MM.dd'T'HH:mm:ss")).format(deadline),
  };

}