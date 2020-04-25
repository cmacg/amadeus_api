import 'package:amadeusapi/models/hotels/description.dart';
import 'package:amadeusapi/models/hotels/type_estimated.dart';

class Room {

  final String type;
  final TypeEstimated typeEstimated;
  final Description description;

  Room(this.type, this.typeEstimated, this.description);

  Room.fromJson(Map<String, dynamic> json)
  : type = json['type'],
    typeEstimated = json['typeEstimated'] == null ? null : TypeEstimated.fromJson(json['typeEstimated']),
    description = json['description'] == null ? null : Description.fromJson(json['description']);

  Map<String, dynamic> toJson() => {
    'type': type,
    'typeEstimated': typeEstimated == null ? null : typeEstimated.toJson(),
    'description': description == null ? null : description.toJson(),
  };

}