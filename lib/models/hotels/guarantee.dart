import 'package:amadeusapi/models/hotels/accepted_payments.dart';
import 'package:amadeusapi/models/hotels/description.dart';

class Guarantee {

  final Description description;
  final AcceptedPayments acceptedPayments;

  Guarantee(this.description, this.acceptedPayments);

  Guarantee.fromJson(Map<String, dynamic> json)
  : description = json['description'] == null ? null : Description.fromJson(json['description']),
  acceptedPayments = json['acceptedPayments'] == null ? null : AcceptedPayments.fromJson(json['acceptedPayments']);

  Map<String, dynamic> toJson() => {
    'description': description == null ? null : description.toJson(),
    'acceptedPayments': acceptedPayments == null ? null : acceptedPayments.toJson(),
  };
}