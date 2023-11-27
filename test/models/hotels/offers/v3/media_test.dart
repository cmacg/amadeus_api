import 'package:amadeusapi/models/hotels/offers/v3/media.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "uri":
        "https://www.iamexpat.nl/sites/default/files/sitefiles_2019-02/foto_6_subtropisch_bad.jpg",
    "category": "SWIMMING_POOL"
  };

  final Media media = Media.fromJson(json);

  test('Testing the Media.toJson and Media.fromJson method', () {
    expect(media.uri, json['uri']);
    expect(media.category, MediaCategory.SWIMMING_POOL);
  });
}
