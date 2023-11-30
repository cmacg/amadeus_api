import 'package:amadeusapi/models/hotels/search/v1/hotel.dart';
import 'package:amadeusapi/models/hotels/search/v1/meta.dart';

/// The response that is returned by executing a hotel search.  (Either by
/// hotel name, city code or geo code)
class HotelsSearchResponse {
  /// List of hotel location information.  The hotels that matched the search
  /// criteria.
  final List<Hotel>? hotels;

  /// Meta information about the returned object(s) in "data".
  final Meta? meta;

  HotelsSearchResponse({this.hotels, this.meta});

  HotelsSearchResponse.fromJson(Map<String, dynamic> json)
      : hotels = json['data'] == null
            ? null
            : (json['data'] as List).map((i) => Hotel.fromJson(i)).toList(),
        meta = Meta.fromJson(json['meta']);
}
