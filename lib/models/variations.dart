import 'package:amadeusapi/models/average.dart';
import 'package:amadeusapi/models/changes.dart';

class Variations {
  final Average average;
  final Changes changes;

  Variations({this.average, this.changes});

  Variations.fromJson(Map<String, dynamic> json)
  : average = Average.fromJson(json['average']),
    changes = Changes.fromJson(json['changes']);

  Map<String, dynamic> toJson() => {
    'average': average.toJson(),
    'changes': changes.toJson(),
  };

}