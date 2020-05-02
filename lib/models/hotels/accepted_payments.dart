class AcceptedPayments {
  final List<dynamic> creditCards;
  final List<PaymentMethod> methods;

  AcceptedPayments(this.creditCards, this.methods);

  AcceptedPayments.fromJson(Map<String, dynamic> json)
      : creditCards = json['creditCards'] == null ? null : json['creditCards'],
        methods = json['methods'] == null ? null : _getPaymentMethods(json['methods'] as List<dynamic>);

  Map<String, dynamic> toJson() => {
        'creditCards': creditCards,
        'methods': methods == null ? null : _getStringPaymentMethods(methods),
      };

  static List<String> _getStringPaymentMethods(List<PaymentMethod> methods) {
    List<String> paymentMethods = new List<String>();
    for (PaymentMethod method in methods) {
      paymentMethods.add(method.toString().split('.').last);
    }
    return paymentMethods;
  }

  static List<PaymentMethod> _getPaymentMethods(List<dynamic> methods) {
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
