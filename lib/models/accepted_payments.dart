class AcceptedPayments {
  final List<String> creditCards;
  final List<PaymentMethod> methods;

  AcceptedPayments(this.creditCards, this.methods);

  AcceptedPayments.fromJson(Map<String, dynamic> json)
      : creditCards = json['creditCards'],
        methods = _getPaymentMethods(json['methods'] as List<String>);

  Map<String, dynamic> toJson() => {
        'creditCards': creditCards,
        'methods': _getStringPaymentMethods(methods),
      };

  static List<String> _getStringPaymentMethods(List<PaymentMethod> methods) {
    List<String> paymentMethods = new List<String>();
    for (PaymentMethod method in methods) {
      paymentMethods.add(method.toString());
    }
    return paymentMethods;
  }

  static List<PaymentMethod> _getPaymentMethods(List<String> methods) {
    List<PaymentMethod> paymentMethods = new List<PaymentMethod>();
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
  TRAVEL_AGENT_ID,
  CORPORATE_ID,
  HOTEL_GUEST_ID,
  CHECK,
  MISC_CHARGE_ORDER,
  ADVANCE_DEPOSIT,
  COMPANY_ADDRESS
}
