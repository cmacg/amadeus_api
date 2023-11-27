import 'package:amadeusapi/models/hotels/offers/v3/estimated_room_type.dart';
import 'package:amadeusapi/models/hotels/offers/v3/qualified_free_text.dart';

class RoomDetails {
  /// Room type code, 3 character identifier of the room.  The first character
  /// identifies the room type category.  The second numeric character
  /// identifies the number of beds.  The third character identifies the bed
  /// type.  There is a special case where ROH is returned, this value stands
  /// for Run Of House.
  final String? type;

  /// Estimated room category, bed type and number of beds in the room. This
  /// information has been parsed from the room description, and is thus only
  /// provided for informational purposes.
  final EstimatedRoomType? typeEstimated;

  /// Localized description of the room type.
  final QualifiedFreeText? description;

  RoomDetails({this.type, this.typeEstimated, this.description});

  RoomDetails.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        typeEstimated = json['typeEstimated'] == null
            ? null
            : EstimatedRoomType.fromJson(json['typeEstimated']),
        description = json['description'] == null
            ? null
            : QualifiedFreeText.fromJson(json['description']);
}
