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
  : checkIn = DateTime.parse(json['checkIn']),
    checkOut = DateTime.parse(json['checkOut']),
    checkInDescription = Description.fromJson(json['checkInDescription']),
    checkOutDescription = Description.fromJson(json['checkOutDescription']);

  Map<String, dynamic> toJson() => {
    'checkIn': (new DateFormat.Hms().format(checkIn)),
    'checkOut': (new DateFormat.Hms().format(checkOut)),
    'checkInDescription': checkInDescription.toJson(),
    'checkOutDescription': checkOutDescription.toJson(),
  };

}