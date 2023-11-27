import 'package:amadeusapi/models/hotels/offers/v3/qualified_free_text.dart';

class CancellationPolicy {
  /// FULL_STAY: the Penalty amount equals the total price.
  final CancellationType? type;

  /// Amount of the cancellation fee. pattern: ^\\d+(\\.\\d+)?$
  final String? amount;

  /// Number of nights due as fee in case of cancellation.
  final int? numberOfNights;

  /// Percentage of the total stay amount to be paid in case of cancellation.
  /// Value is between 0 and 100.
  final String? percentage;

  /// Represents the deadline after which the penalty applies. DateTime is in
  /// ISO 8601 [https://www.w3.org/TR/NOTE-datetime].
  ///
  /// Example: 2010-08-14T12:00:00+01:00
  /// Example: 2010-08-14T12:00:00Z
  /// Example: 2010-08-14T12:00:00-01:00
  ///
  /// The value is expressed in the hotel local time zone, with the added time
  /// zone difference. So you can compute the deadline in UTC(GMT) if desired.
  final DateTime? deadline;

  /// DateTime is in ISO 8601. Example: 2010-08-14T12:00:00+01:00
  final QualifiedFreeText? description;

  CancellationPolicy(
      {this.type,
      this.amount,
      this.numberOfNights,
      this.percentage,
      this.deadline,
      this.description});

  CancellationPolicy.fromJson(Map<String, dynamic> json)
      : type = json['type'] == null ? null : _getCancellationType(json['type']),
        amount = json['amount'],
        numberOfNights = json['numberOfNights'],
        percentage = json['percentage'],
        deadline =
            json['deadline'] == null ? null : DateTime.parse(json['deadline']),
        description = json['description'] == null
            ? null
            : QualifiedFreeText.fromJson(json['description']);

  static CancellationType? _getCancellationType(String type) {
    for (CancellationType cancellationType in CancellationType.values) {
      if (cancellationType.toString().endsWith(type)) {
        return cancellationType;
      }
    }
    return null;
  }
}

enum CancellationType {
  FULL_STAY,
}
