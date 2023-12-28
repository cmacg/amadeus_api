import 'qualified_free_text.dart';

/// The check-in and check-out policies for the hotel.
class CheckInOutPolicy {
  /// Check-in From time limit in ISO-8601 format
  /// [http://www.w3.org/TR/xmlschema-2/#time]
  final DateTime? checkIn;

  /// Check-out Until time limit in ISO-8601 format
  /// [http://www.w3.org/TR/xmlschema-2/#time]
  final DateTime? checkOut;

  /// Specific type to convey a list of string for specific information type
  /// ( via qualifier) in specific character set, or language
  final QualifiedFreeText? checkInDescription;

  /// Specific type to convey a list of string for specific information type
  /// ( via qualifier) in specific character set, or language
  final QualifiedFreeText? checkOutDescription;

  CheckInOutPolicy(
      {this.checkIn,
      this.checkOut,
      this.checkInDescription,
      this.checkOutDescription});

  CheckInOutPolicy.fromJson(Map<String, dynamic> json)
      : checkIn =
            json['checkIn'] == null ? null : DateTime.parse(json['checkIn']),
        checkOut =
            json['checkOut'] == null ? null : DateTime.parse(json['checkOut']),
        checkInDescription = json['checkInDescription'] == null
            ? null
            : QualifiedFreeText.fromJson(json['checkInDescription']),
        checkOutDescription = json['checkOutDescription'] == null
            ? null
            : QualifiedFreeText.fromJson(json['checkOutDescription']);
}
