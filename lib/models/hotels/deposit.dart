import 'package:amadeusapi/models/hotels/accepted_payments.dart';
import 'package:amadeusapi/models/hotels/description.dart';
import 'package:intl/intl.dart';

class Deposit {

  final String amount;
  final DateTime deadline;
  final Description description;
  final AcceptedPayments acceptedPayments;

  Deposit(this.amount, this.deadline, this.description, this.acceptedPayments);

  Deposit.fromJson(Map<String, dynamic> json)
    : amount = json['amount'],
      deadline = json['deadline'] == null ? null : DateTime.parse(json['deadline']),
      description = json['description'] == null ? null : Description.fromJson(json['description']),
      acceptedPayments = json['acceptedPayments'] == null ? null : AcceptedPayments.fromJson(json['acceptedPayments']);

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'deadline': deadline == null ? null : (new DateFormat("yyyy.MM.dd'T'HH:mm:ss")).format(deadline),
    'description': description == null ? null : description.toJson(),
    'acceptedPayments': acceptedPayments == null ? null : acceptedPayments.toJson(),
  };

}