import 'package:test/test.dart';
import '../../../../../src/models/hotels/offers/v3/room_details.dart';

void main() {
  test('Testing the Room.toJson and fromJson methods', () {
    Map<String, dynamic> json = {
      'type': 'ABC',
      'typeEstimated': {
        'category': 'category',
        'beds': 34,
        'bedType': 'queen',
      },
      'description': {
        'lang': 'en',
        'text': 'This is only a test',
      }
    };

    RoomDetails room = RoomDetails.fromJson(json);
    expect(room.type, 'ABC');
    expect(room.typeEstimated, isNotNull);
    expect(room.typeEstimated!.category, 'category');
    expect(room.typeEstimated!.beds, 34);
    expect(room.typeEstimated!.bedType, 'queen');
    expect(room.description, isNotNull);
    expect(room.description!.lang, 'en');
    expect(room.description!.text, 'This is only a test');
  });
}
