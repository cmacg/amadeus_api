
class RateFamilyEstimated {

  final String code;
  final String type;

  RateFamilyEstimated({this.code, this.type});

  RateFamilyEstimated.fromJson(Map<String, dynamic> json)
  : code = json['code'],
    type = json['type'];

  Map<String, dynamic> toJson() => {
    'code': code,
    'type': type,
  };
}