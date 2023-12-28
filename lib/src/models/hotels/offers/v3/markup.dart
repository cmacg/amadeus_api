/// Markup applied to provide a service or a product to the client. The markup
/// can be introduced by any stakeholder. Typical use case is to convey markup
/// information set by the travel agent or in case of merchant mode.
class Markup {
  /// Defines the monetary value with decimal position as a String.
  /// example: 10
  final String? amount;

  Markup({required this.amount});

  Markup.fromJson(Map<String, dynamic> json) : amount = json['amount'];
}
