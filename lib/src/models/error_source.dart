class ErrorSource {
  final String? parameter;
  final String? pointer;
  final String? example;

  ErrorSource({this.parameter, this.pointer, this.example});

  ErrorSource.fromJson(Map<String, dynamic> json)
      : parameter = json['parameter'],
        pointer = json['pointer'],
        example = json['example'];

  Map<String, dynamic> toJson() => {
        'parameter': parameter,
        'pointer': pointer,
        'example': example,
      };

  String toString() {
    return 'ErrorSource{parameter: $parameter, pointer: $pointer, example: $example}';
  }
}
