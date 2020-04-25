import 'package:amadeusapi/models/hotels/type_estimated.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test the fromJson and toJson method', () {
    Map<String, dynamic> json = {
      'category': 'category',
      'beds': 34,
      'bedType': 'queen',
    };

    TypeEstimated typeEstimated = TypeEstimated.fromJson(json);
    expect(typeEstimated.category, 'category');
    expect(typeEstimated.beds, 34);
    expect(typeEstimated.bedType, 'queen');

    Map<String, dynamic> test = typeEstimated.toJson();
    expect(test['category'], 'category');
    expect(test['beds'], 34);
    expect(test['bedType'], 'queen');
  });
}