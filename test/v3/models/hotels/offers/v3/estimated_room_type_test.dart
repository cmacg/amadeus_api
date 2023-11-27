import 'package:amadeusapi/models/hotels/offers/v3/estimated_room_type.dart';
import 'package:test/test.dart';

main() {
  final Map<String, dynamic> json = {
    "beds": 1,
    "bedType": "DOUBLE",
    "category": "STANDARD"
  };

  final EstimatedRoomType estimatedRoomType = EstimatedRoomType.fromJson(json);

  test('Testing EstimatedRoomType.fromJson', () {
    expect(estimatedRoomType.beds, 1);
    expect(estimatedRoomType.bedType, 'DOUBLE');
    expect(estimatedRoomType.category, 'STANDARD');
  });
}
