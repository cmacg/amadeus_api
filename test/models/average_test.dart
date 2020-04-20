import 'package:amadeusapi/models/average.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> json = {
    'base': '1030.14',
    'total': '2134.22',
  };

  final Average average = Average.fromJson(json);

  test('Tests the Average.fromJson factory builder', ()
  {
    expect(average.base, '1030.14');
    expect(average.total, '2134.22');
  });

  test('Tests the Average.toJson method', ()
  {
    Map<String, dynamic> test = average.toJson();
    expect(test['base'], '1030.14');
    expect(test['total'], '2134.22');
  });

}