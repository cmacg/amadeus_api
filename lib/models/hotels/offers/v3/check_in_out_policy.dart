import 'package:amadeusapi/models/hotels/offers/v3/qualified_free_text.dart';
import 'package:intl/intl.dart';

/// The check-in and check-out policies for the hotel.
class CheckInOutPolicy {
  /// Check-in From time limit in ISO-8601 format
  /// [http://www.w3.org/TR/xmlschema-2/#time]
  final String? checkIn;

  // TODO: Is there a better object I can parse these times into?

  /// Check-out Until time limit in ISO-8601 format
  /// [http://www.w3.org/TR/xmlschema-2/#time]
  final String? checkOut;

  /// Specific type to convey a list of string for specific information type
  /// ( via qualifier) in specific character set, or language
  final QualifiedFreeText? checkInDescription;

  /// Specific type to convey a list of string for specific information type
  /// ( via qualifier) in specific character set, or language
  final QualifiedFreeText? checkOutDescription;

  /// Date format Hms
  static final DateFormat dateFormat = new DateFormat.Hms();

  CheckInOutPolicy(
      {this.checkIn,
      this.checkOut,
      this.checkInDescription,
      this.checkOutDescription});

  CheckInOutPolicy.fromJson(Map<String, dynamic> json)
      : checkIn = json['checkIn'] == null ? null : json['checkIn'],
        checkOut = json['checkOut'] == null ? null : json['checkOut'],
        checkInDescription = json['checkInDescription'] == null
            ? null
            : QualifiedFreeText.fromJson(json['checkInDescription']),
        checkOutDescription = json['checkOutDescription'] == null
            ? null
            : QualifiedFreeText.fromJson(json['checkOutDescription']);
}
