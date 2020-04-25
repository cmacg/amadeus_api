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
      deadline = DateTime.parse(json['deadline']),
      description = Description.fromJson(json['description']),
      acceptedPayments = AcceptedPayments.fromJson(json['acceptedPayments']);

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'deadline': (new DateFormat("yyyy.MM.dd'T'HH:mm:ss")).format(deadline),
    'description': description.toJson(),
    'acceptedPayments': acceptedPayments.toJson(),
  };

}