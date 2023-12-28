/// Payment card details (mandatory in case of method creditCard)
class CreditCard {
  /// Credit card vendor code.  Note: use CA for MasterCArd instead of
  /// MC/IK/EC/MD/XS)
  final String vendorCode;

  /// Credit card number
  final String cardNumber;

  /// Expiration date of the card in the pattern YYYY-MM
  final String expiryDate;

  CreditCard(
      {required this.vendorCode,
      required this.cardNumber,
      required this.expiryDate});

  Map<String, dynamic> toJson() => {
        'vendorCode': vendorCode,
        'cardNumber': cardNumber,
        'expiryDate': expiryDate
      };
}
