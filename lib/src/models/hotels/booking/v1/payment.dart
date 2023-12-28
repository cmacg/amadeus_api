import 'credit_card.dart';

/// Form of payment (mandatory in case of acceptedPayments/methods)
class Payment {
  /// Id of the payment
  final int? paymentId;

  /// At the moment, only credit card payments are allowed through the API.
  final String method = 'creditCard';

  /// List of payment card details (mandatory in case of method creditCard)
  final List<CreditCard>? cards;

  Payment({this.paymentId, this.cards});

  Map<String, dynamic> toJson() => {
        'id': this.paymentId,
        'card': this.cards == null
            ? null
            : this.cards!.map((i) => i.toJson()).toList()
      };
}
