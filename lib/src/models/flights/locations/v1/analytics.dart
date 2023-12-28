import 'travelers.dart';

class Analytics {
  final Travelers? travelers;

  Analytics({this.travelers});

  Analytics.fromJson(Map<String, dynamic> json)
      : travelers = json['travelers'] == null
            ? null
            : Travelers.fromJson(json['travelers']);
}
