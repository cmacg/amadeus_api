class Warning {
  final int code;
  final String title;
  final String? detail;

  Warning({required this.code, required this.title, this.detail});

  Warning.fromJson(Map<String, dynamic> json)
      : this.code = json['code'],
        this.title = json['title'],
        this.detail = json['detail'];
}
