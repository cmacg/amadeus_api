/// The estimated rate code family of the offer. Grouping various rate plan
/// codes that belongs to the same family and indicates the type of the rate
class RateFamily {
  /// The estimated rate family (PRO,FAM,GOV)
  final String? code;

  /// The type of the rate (public=P, negotiated=N, conditional=C)
  final String? type;

  RateFamily({this.code, this.type});

  RateFamily.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        type = json['type'];
}
