import 'package:amadeusapi/models/flights/locations/v1/travelers.dart';

class Analytics {
  final Travelers? travelers;

  Analytics({this.travelers});

  Analytics.fromJson(Map<String, dynamic> json)
      : travelers = json['travelers'] == null
            ? null
            : Travelers.fromJson(json['travelers']);
}
