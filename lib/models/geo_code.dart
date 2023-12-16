/// Geographic coordinates describing the position of any location on the surface of Earth
class GeoCode {
  /// Latitude of the position expressed in decimal degrees (WSG 84), e.g.
  /// 6.244203. A positive value denotes northern hemisphere or the equator, and
  /// a negative value denotes southern hemisphere. The number of digits to
  /// represent the precision of the coordinate.
  final double? latitude;

  /// Longitude of the position expressed in decimal degrees (WSG 84), e.g.
  /// -75.581211. A positive value denotes east longitude or the prime meridian,
  /// and a negative value denotes west longitude. The number of digits to
  /// represent the precision of the coordinate.
  final double? longitude;

  GeoCode({
    required this.latitude,
    required this.longitude,
  });

  factory GeoCode.fromJson(Map<String, dynamic> json) {
    return GeoCode(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
