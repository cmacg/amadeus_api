/// Specific type to convey a list of string for specific information type (via
/// qualifier) in specific character set, or language.
class QualifiedFreeText {
  /// Free text.
  /// example: A description of the room
  final String? text;

  /// RFC 5646 language code.  ISO 639-1 language code.
  /// example: fr-FR
  final String? lang;

  QualifiedFreeText({this.text, this.lang});

  QualifiedFreeText.fromJson(Map<String, dynamic> json)
      : lang = json['lang'],
        text = json['text'];

  Map<String, dynamic> toJson() => {
        'lang': lang,
        'text': text,
      };
}
