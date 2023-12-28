class Terminal {
  final String code;

  Terminal({required this.code});

  Terminal.fromJson(Map<String, dynamic> json) : code = json['code'];
}
