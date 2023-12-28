import 'delay.dart';

class Timing {
  /// The qualifier of the timing. e.g. STD (stands for Schedule Time Departure
  final String? qualifier;

  /// example: 06:00:00
  final DateTime? value;

  /// Delays that might be recorded on a timing
  final List<Delay>? delays;

  Timing({this.qualifier, this.value, this.delays});

  Timing.fromJson(Map<String, dynamic> json)
      : qualifier = json['qualifier'],
        value = json['value'] == null ? null : DateTime.parse(json['value']),
        delays = json['delays'] == null
            ? null
            : (json['delays'] as List).map((e) => Delay.fromJson(e)).toList();
}
