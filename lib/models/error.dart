import 'package:amadeusapi/models/error_source.dart';

class Error {
  final int? status;
  final int? code;
  final String? title;
  final String? detail;
  final ErrorSource? source;
  final String? documentation;

  Error(
      {this.status,
      this.code,
      this.title,
      this.detail,
      this.source,
      this.documentation});

  Error.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        code = json['code'],
        title = json['title'],
        detail = json['detail'],
        source = (json['source'] == null)
            ? null
            : ErrorSource.fromJson(json['source']),
        documentation = json['documentation'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'title': title,
        'detail': detail,
        'source': (source == null) ? null : source!.toJson(),
        'documentation': documentation,
      };

  String toString() {
    return 'Error{status: $status, code: $code, title: $title, detail: $detail, ' +
        'source: $source, documentation: $documentation}';
  }
}
