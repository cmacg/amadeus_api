class TypeEstimated {

  final String category;
  final int beds;
  final String bedType;

  TypeEstimated({this.category, this.beds, this.bedType});

  TypeEstimated.fromJson(Map<String, dynamic> json)
  : category = json['category'],
    beds = json['beds'] == null ? null : json['beds'].toInt(),
    bedType = json['bedType'];

  Map<String, dynamic> toJson() => {
    'category': category,
    'beds': beds == null ? null : beds.toInt(),
    'bedType': bedType,
  };
}