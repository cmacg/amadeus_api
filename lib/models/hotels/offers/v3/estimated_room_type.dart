/// Estimated room category, bed type and number of beds in the room. This
/// information has been parsed from the room description, and is thus only
/// provided for informational purposes.
class EstimatedRoomType {
  /// Category code
  final String? category;

  /// Number of beds in the room (1-9)
  final int? beds;

  /// Type of the bed
  final String? bedType;

  EstimatedRoomType({this.category, this.beds, this.bedType});

  EstimatedRoomType.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        beds = json['beds'],
        bedType = json['bedType'];
}
