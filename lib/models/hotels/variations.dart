import 'package:amadeusapi/models/hotels/average.dart';
import 'package:amadeusapi/models/hotels/change.dart';

class Variations {
  final Average average;
  final List<Change> changes;

  Variations({this.average, this.changes});

  Variations.fromJson(Map<String, dynamic> json)
      : average =
            json['average'] == null ? null : Average.fromJson(json['average']),
        changes = json['changes'] == null
            ? null
            : List<Change>.from(
                json["changes"].map((x) => Change.fromJson(x)));

  Map<String, dynamic> toJson() => {
        'average': average == null ? null : average.toJson(),
        'changes': changes == null
            ? null
            : List<dynamic>.from(changes.map((x) => x.toJson())),
      };
}
