import 'package:amadeusapi/models/hotels/room.dart';
import 'package:flutter_test/flutter_test.dart';

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

    Room room = Room.fromJson(json);
    expect(room.type, 'ABC');
    expect(room.typeEstimated, isNotNull);
    expect(room.typeEstimated.category, 'category');
    expect(room.typeEstimated.beds, 34);
    expect(room.typeEstimated.bedType, 'queen');
    expect(room.description, isNotNull);
    expect(room.description.lang, 'en');
    expect(room.description.text, 'This is only a test');

    Map<String, dynamic> test = room.toJson();
    expect(test['type'], 'ABC');
    expect(test['typeEstimated']['category'], 'category');
    expect(test['typeEstimated']['beds'], 34);
    expect(test['typeEstimated']['bedType'], 'queen');
    expect(test['description']['lang'], 'en');
    expect(test['description']['text'], 'This is only a test');
  });
}