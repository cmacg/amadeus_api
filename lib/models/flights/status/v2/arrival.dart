import 'package:amadeusapi/models/flights/status/v2/get.dart';
import 'package:amadeusapi/models/flights/status/v2/terminal.dart';
import 'package:amadeusapi/models/flights/status/v2/timing.dart';

class Arrival {
  /// The code of the terminal
  final Terminal? terminal;

  /// The main gate number
  final Gate? gate;

  /// The list of timings
  final List<Timing>? timings;

  Arrival({this.terminal, this.gate, this.timings});

  Arrival.fromJson(Map<String, dynamic> json)
      : terminal = json['terminal'] == null
            ? null
            : Terminal.fromJson(json['terminal']),
        gate = json['gate'] == null ? null : Gate.fromJson(json['gate']),
        timings = json['timings'] == null
            ? null
            : (json['timings'] as List).map((e) => Timing.fromJson(e)).toList();
}
