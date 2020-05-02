import 'package:amadeusapi/models/hotels/description.dart';
import 'package:intl/intl.dart';

class CheckInOut {

  final DateTime checkIn;
  final DateTime checkOut;
  final Description checkInDescription;
  final Description checkOutDescription;

  CheckInOut(this.checkIn, this.checkOut, this.checkInDescription,
      this.checkOutDescription);

  CheckInOut.fromJson(Map<String, dynamic> json)
  : checkIn = json['checkIn'] == null ? null : DateTime.parse(json['checkIn']),
    checkOut = json['checkOut'] == null ? null : DateTime.parse(json['checkOut']),
    checkInDescription = json['checkInDescription'] == null ? null : Description.fromJson(json['checkInDescription']),
    checkOutDescription = json['checkOutDescription'] == null ? null : Description.fromJson(json['checkOutDescription']);

  Map<String, dynamic> toJson() => {
    'checkIn': checkIn == null ? null : (new DateFormat.Hms().format(checkIn)),
    'checkOut': checkOut == null ? null : (new DateFormat.Hms().format(checkOut)),
    'checkInDescription': checkInDescription == null ? null : checkInDescription.toJson(),
    'checkOutDescription': checkOutDescription == null ? null : checkOutDescription.toJson(),
  };

}