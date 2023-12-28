/// An object containing references to the source of the error
class IssueSource {
  /// A JSON Pointer [RFC6901] to the associated entity in the request document
  final String? pointer;

  /// A string indicating which URI query parameter caused the issue
  final String? parameter;

  /// A string indicating an example of the right value
  final String? example;

  IssueSource({this.pointer, this.parameter, this.example});

  IssueSource.fromJson(Map<String, dynamic> json)
      : pointer = json['pointer'],
        parameter = json['parameter'],
        example = json['example'];
}
