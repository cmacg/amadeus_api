import 'package:amadeusapi/models/hotels/offers/v3/payment_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/qualified_free_text.dart';

/// The guarantee policy information applicable to the offer. It includes
/// accepted payments.
class GuaranteePolicy {
  /// Specific type to convey a list of string for specific information type
  /// (via qualifier) in specific character set, or language.
  final QualifiedFreeText? description;

  /// Accepted Payment Methods and Card Types. Several Payment Methods and Card
  /// Types may be available.
  final PaymentPolicy? acceptedPayments;

  GuaranteePolicy({this.description, this.acceptedPayments});

  GuaranteePolicy.fromJson(Map<String, dynamic> json)
      : description = json['description'] == null
            ? null
            : QualifiedFreeText.fromJson(json['description']),
        acceptedPayments = json['acceptedPayments'] == null
            ? null
            : PaymentPolicy.fromJson(json['acceptedPayments']);
}
