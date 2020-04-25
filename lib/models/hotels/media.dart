class Media {
  final String uri;
  final MediaCategory category;

  Media({this.uri, this.category});

  Media.fromJson(Map<String, dynamic> json)
      : uri = json['uri'],
        category = _getMediaCategory(json['category']);

  Map<String, dynamic> toJson() => {
        'uri': uri,
        'category': category.toString().split('.').last,
      };

  static MediaCategory _getMediaCategory(String category) {
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
