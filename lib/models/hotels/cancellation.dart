import 'package:amadeusapi/models/hotels/description.dart';

class Cancellation {
  final CancellationType type;
  final String amount;
  final int numberOfNights;
  final String percent;
  final DateTime deadline;
  final Description description;

  Cancellation(
      {this.type,
      this.amount,
      this.numberOfNights,
      this.percent,
      this.deadline,
      this.description});

  Cancellation.fromJson(Map<String, dynamic> json)
      : type = _getCancellationType(json['type']),
        amount = json['amount'],
        numberOfNights = json['numberOfNights'],
        percent = json['percent'],
        deadline = json['deadline'],
        description = Description.fromJson(json['description']);

  Map<String, dynamic> toJson() => {
        'type': type.toString(),
        'amount': amount,
        'numberOfNights': numberOfNights,
        'precent': percent,
        'deadline': deadline,
        'description': description.toJson(),
      };

  static CancellationType _getCancellationType(String type) {
    for (CancellationType cancellationType in CancellationType.values) {
      if (cancellationType.toString().endsWith(type)) {
        return cancellationType;
      }
    }
    return null;
  }

}

enum CancellationType {
  Flat,
  FlatPerNight,
  Nights,
  StayPercent,
  FirstNight,
  LastNight,
  FirstAndLastNight,
  FullStay
}
