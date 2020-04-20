import 'package:amadeusapi/models/accepted_payments.dart';
import 'package:amadeusapi/models/description.dart';
import 'package:intl/intl.dart';

class HoldTime {

  final DateTime deadline;

  HoldTime({this.deadline});

  HoldTime.fromJson(Map<String, dynamic> json)
    : deadline = DateTime.parse(json['deadline']);

  Map<String, dynamic> toJson() => {
    'deadline': (new DateFormat("yyyy.MM.dd'T'HH:mm:ss")).format(deadline),
  };

}