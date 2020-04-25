import 'package:amadeusapi/models/hotels/media.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final Map<String, dynamic> json = {
    'uri': 'https://www.iamexpat.nl/sites/default/files/sitefiles_2019-02/foto_6_subtropisch_bad.jpg',
    'category': 'SWIMMING_POOL'
  };

  test('Testing the Media.toJson and Media.fromJson method', () {
    Media media = Media.fromJson(json);
    expect(media, isNotNull);
    expect(media.uri, json['uri']);
    expect(media.category, MediaCategory.SWIMMING_POOL);

    Map<String, dynamic> test = media.toJson();
    expect(test, isNotNull);
    expect(test['uri'], json['uri']);
    expect(test['category'], json['category']);

  });
}