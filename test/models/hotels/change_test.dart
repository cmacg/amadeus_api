import 'package:amadeusapi/models/hotels/change.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final Map<String, dynamic> json = {
    'startDate': '2020-12-02',
    'endDate': '1980-04-11',
    'base': '1010.78',
    'total': '1116.69',
  };

  test('Testing the Changes fromJson method', () {
    final Change changes = Change.fromJson(json);
    DateTime start = new DateTime(2020, 12, 02);
    DateTime end = new DateTime(1980, 04, 11);
    expect(changes.startDate, start);
    expect(changes.endDate, end);
    expect(changes.base, '1010.78');
    expect(changes.total, '1116.69');
  });

  test('Testing the Changes toJson method', () {
    final Change change = Change.fromJson(json);
    Map<String, dynamic> test = change.toJson();
    expect(test['startDate'], '2020-12-02');
    expect(test['endDate'], '1980-04-11');
    expect(test['base'], '1010.78');
    expect(test['total'], '1116.69');
  });
}