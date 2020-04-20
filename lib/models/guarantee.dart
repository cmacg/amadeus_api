import 'package:amadeusapi/models/accepted_payments.dart';
import 'package:amadeusapi/models/description.dart';

class Guarantee {

  final Description description;
  final AcceptedPayments acceptedPayments;

  Guarantee(this.description, this.acceptedPayments);

  Guarantee.fromJson(Map<String, dynamic> json)
  : description = Description.fromJson(json['description']),
  acceptedPayments = AcceptedPayments.fromJson(json['acceptedPayments']);

  Map<String, dynamic> toJson() => {
    'description': description.toJson(),
    'acceptedPayments': acceptedPayments.toJson(),
  };
}