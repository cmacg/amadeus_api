import 'package:amadeusapi/models/hotels/offers/v3/payment_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/qualified_free_text.dart';

/// The deposit/prepay policy information applicable to the offer. It includes
/// accepted payments, deadline and the amount due.
class DepositPolicy {
  /// Amount of the deposit/prepay due.
  /// pattern: ^\\d+(\\.\\d+)?$
  final String? amount;

  /// The date and time of the deadline in ISO 8601[https://www.w3.org/TR/NOTE-datetime].
  /// Example: 2010-08-14T13:00:00
  /// Please note that this value is expressed in the hotels local time zone.
  final DateTime? deadline;

  /// Specific type to convey a list of string for specific information type
  /// (via qualifier) in specific character set, or language.
  final QualifiedFreeText? description;

  /// Accepted Payment Methods and Card Types. Several Payment Methods and Card
  /// Types may be available.
  final PaymentPolicy? acceptedPayments;

  DepositPolicy(
      {this.amount, this.deadline, this.description, this.acceptedPayments});

  DepositPolicy.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        deadline =
            json['deadline'] == null ? null : DateTime.parse(json['deadline']),
        description = json['description'] == null
            ? null
            : QualifiedFreeText.fromJson(json['description']),
        acceptedPayments = json['acceptedPayments'] == null
            ? null
            : PaymentPolicy.fromJson(json['acceptedPayments']);
}
