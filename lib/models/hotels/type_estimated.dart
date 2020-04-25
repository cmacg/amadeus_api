class TypeEstimated {

  final String category;
  final int beds;
  final String bedType;

  TypeEstimated({this.category, this.beds, this.bedType});

  TypeEstimated.fromJson(Map<String, dynamic> json)
  : category = json['category'],
    beds = json['beds'].toInt(),
    bedType = json['bedType'];

  Map<String, dynamic> toJson() => {
    'category': category,
    'beds': beds.toInt(),
    'bedType': bedType,
  };
}