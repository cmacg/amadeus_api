class Travelers {
  /// Approximate score for ranking purposes calculated based on number of
  /// travelers in the location.
  final int? score;

  Travelers({this.score});

  Travelers.fromJson(Map<String, dynamic> json) : score = json['score'];
}
