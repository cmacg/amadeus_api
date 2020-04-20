class Average {
  final String base;
  final String total;

  Average({this.base, this.total});

  Average.fromJson(Map<String,dynamic> json)
  : base = json['base'],
    total = json['total'];

  Map<String, dynamic> toJson() => {
    'base': base,
    'total': total,
  };
}