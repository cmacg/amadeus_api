import 'package:amadeusapi/models/flights/offers/v2/issue_source.dart';

class Issue {
  final int? status;
  final int? code;
  final String? title;
  final String? detail;
  final IssueSource? source;

  Issue({this.status, this.code, this.title, this.detail, this.source});

  Issue.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        code = json['code'],
        title = json['title'],
        detail = json['detail'],
        source = json['source'] == null
            ? null
            : IssueSource.fromJson(json['source']);
}
