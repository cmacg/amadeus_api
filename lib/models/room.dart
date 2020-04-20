import 'package:amadeusapi/models/description.dart';
import 'package:amadeusapi/models/type_estimated.dart';

class Room {

  final String type;
  final TypeEstimated typeEstimated;
  final Description description;

  Room(this.type, this.typeEstimated, this.description);

  Room.fromJson(Map<String, dynamic> json)
  : type = json['type'],
    typeEstimated = TypeEstimated.fromJson(json['typeEstimated']),
    description = Description.fromJson(json['description']);

  Map<String, dynamic> toJson() => {
    'type': type,
    'typeEstimated': typeEstimated.toJson(),
    'descriptions': description.toJson(),
  };

}