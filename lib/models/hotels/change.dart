import 'package:intl/intl.dart';

class Change {
  final DateTime startDate;
  final DateTime endDate;
  final String base;
  final String total;

  Change(this.startDate, this.endDate, this.base, this.total);

  Change.fromJson(Map<String, dynamic> json)
  : startDate = DateTime.parse(json['startDate']),
    endDate = DateTime.parse(json['endDate']),
    base = json['base'],
    total = json['total'];

  Map<String, dynamic> toJson() => {
    'startDate': (new DateFormat('yyyy-MM-dd').format(startDate)),
    'endDate': (new DateFormat('yyyy-MM-dd').format(endDate)),
    'base': base,
    'total': total,
  };

}