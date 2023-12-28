// Encapsulates the URI of a media item along with optional metadata.
class Media {
  /// The URI of the media.
  final String uri;

  /// The descriptive category of the media.
  final MediaCategory? category;

  Media({required this.uri, this.category});

  Media.fromJson(Map<String, dynamic> json)
      : uri = json['uri'],
        category = (json['category'] == null)
            ? null
            : _getMediaCategory(json['category']);

  static MediaCategory? _getMediaCategory(String category) {
    for (MediaCategory mediaCategory in MediaCategory.values) {
      if (mediaCategory.toString().endsWith(category)) {
        return mediaCategory;
      }
    }
    return null;
  }
}

enum MediaCategory {
  EXTERIOR,
  LOBBY,
  SWIMMING_POOL,
  RESTAURANT,
  FITNESS_CENTER,
  ROOM,
  SUITE,
  MEETING_ROOMS,
  BALLROOM,
  GOLF,
  BEACH,
  SPA,
  BAR,
  RECREATIONAL,
  LOGO,
  BASICS,
  MAP,
  PROMOTIONAL,
  HOT_NEWS,
  MISCELLANEOUS,
  ROOM_AMENITY,
  PROPERTY_AMENITY,
  BUSINESS_CENTER
}
