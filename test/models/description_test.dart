import 'package:amadeusapi/models/description.dart' as desc;
import 'package:flutter_test/flutter_test.dart';

void main() {

  Map<String, dynamic> json = {
    'lang': 'en',
    'text': 'This is only a test',
  };

  final desc.Description description = desc.Description.fromJson(json);

  test('Tests the Description.fromJson factory builder', ()
  {
    expect(description.lang, 'en');
    expect(description.text, 'This is only a test');
  });

  test('Tests the Description.toJson method', ()
  {
    Map<String, dynamic> test = description.toJson();
    expect(test['lang'], 'en');
    expect(test['text'], 'This is only a test');
  });

  test('Test that special characters are handled properly', ()
  {
    Map<String, dynamic> specialCharacters = {
      'lang': 'es',
      'text': 'áÁéÉíÍñÑóÓúÚüÜ¿¡'
    };
    final desc.Description specialDescription = desc.Description.fromJson(specialCharacters);
    expect(specialDescription.lang, 'es');
    expect(specialDescription.text, 'áÁéÉíÍñÑóÓúÚüÜ¿¡');

    Map<String, dynamic> test = specialDescription.toJson();
    expect(test['lang'], 'es');
    expect(test['text'], 'áÁéÉíÍñÑóÓúÚüÜ¿¡');
  });

}