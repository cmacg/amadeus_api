
class Description {
  final String lang;
  final String text;

  Description({this.lang, this.text});

  Description.fromJson(Map<String, dynamic> json)
  : lang = json['lang'],
  text = json['text'];

  Map<String, dynamic> toJson() => {
    'lang': lang,
    'text': text,
  };
}