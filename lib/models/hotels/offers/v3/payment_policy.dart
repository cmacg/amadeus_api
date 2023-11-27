/// Accepted Payment Methods and Card Types. Several Payment Methods and Card Types may be available.
class PaymentPolicy {
  /// Accepted Payment Card Types for the method CREDIT_CARD
  final List<String>? creditCards;

  /// Accepted Payment Methods
  final List<PaymentMethod>? methods;

  PaymentPolicy(this.creditCards, this.methods);

  PaymentPolicy.fromJson(Map<String, dynamic> json)
      : creditCards = json['creditCards'] == null ? null : json['creditCards'],
        methods = json['methods'] == null
            ? null
            : _getPaymentMethods(json['methods'] as List<dynamic>);

  static List<PaymentMethod>? _getPaymentMethods(List<dynamic> methods) {
    List<PaymentMethod> paymentMethods = [];
    for (String method in methods) {
      for (PaymentMethod paymentMethod in PaymentMethod.values) {
        if (paymentMethod.toString().endsWith(method)) {
          paymentMethods.add(paymentMethod);
        }
      }
    }
    return paymentMethods;
  }
}

enum PaymentMethod {
  CREDIT_CARD,
  AGENCY_ACCOUNT,
  TRAVEL_AGENT_ID,
  CORPORATE_ID,
  HOTEL_GUEST_ID,
  CHECK,
  MISC_CHARGE_ORDER,
  ADVANCE_DEPOSIT,
  COMPANY_ADDRESS,
  VCC_BILLBACK,
  VCC_B2B_WALLET,
  DEFERED_PAYMENT,
  TRAVEL_AGENT_IMMEDIATE
}
