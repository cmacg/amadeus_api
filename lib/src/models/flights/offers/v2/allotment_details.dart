class AllotmentDetails {
  /// The tour name agreed for this specific allotment.
  final String? tourName;

  /// The tour reference agreed for this specific allotment.
  final String? tourReference;

  AllotmentDetails({this.tourName, this.tourReference});

  AllotmentDetails.fromJson(Map<String, dynamic> json)
      : tourName = json['tourName'],
        tourReference = json['tourReference'];
}
