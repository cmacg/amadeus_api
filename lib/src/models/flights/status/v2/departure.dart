import 'gate.dart';
import 'terminal.dart';
import 'timing.dart';

class Departure {
  /// The code of the terminal
  final Terminal? terminal;

  /// The main gate number
  final Gate? gate;

  /// The list of timings
  final List<Timing>? timings;

  Departure({this.terminal, this.gate, this.timings});

  Departure.fromJson(Map<String, dynamic> json)
      : terminal = json['terminal'] == null
            ? null
            : Terminal.fromJson(json['terminal']),
        gate = json['gate'] == null ? null : Gate.fromJson(json['gate']),
        timings = json['timings'] == null
            ? null
            : (json['timings'] as List).map((e) => Timing.fromJson(e)).toList();
}
