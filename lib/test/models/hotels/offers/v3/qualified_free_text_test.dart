import 'package:test/test.dart';

import '../../../../../src/models/hotels/offers/v3/qualified_free_text.dart';

void main() {
  Map<String, dynamic> json = {
    'lang': 'en',
    'text': 'This is only a test',
  };

  final QualifiedFreeText description = QualifiedFreeText.fromJson(json);

  test('Tests the QualifiedFreeText.fromJson factory builder', () {
    expect(description.lang, 'en');
    expect(description.text, 'This is only a test');
  });

  test('Test that special characters are handled properly', () {
    Map<String, dynamic> specialCharacters = {
      'lang': 'es',
      'text': 'áÁéÉíÍñÑóÓúÚüÜ¿¡'
    };
    final QualifiedFreeText specialDescription =
        QualifiedFreeText.fromJson(specialCharacters);
    expect(specialDescription.lang, 'es');
    expect(specialDescription.text, 'áÁéÉíÍñÑóÓúÚüÜ¿¡');
  });
}
