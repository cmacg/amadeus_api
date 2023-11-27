import 'package:amadeusapi/models/hotels/offers/v3/cancellation_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/check_in_out_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/deposit_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/guarantee_policy.dart';
import 'package:amadeusapi/models/hotels/offers/v3/hold_policy.dart';

/// Booking Rules
class PolicyDetails {
  /// The payment type. Guarantee means Pay at Check Out. Check the methods in
  /// guarantee or deposit or prepay.
  final PaymentType? paymentType;

  /// The guarantee policy information applicable to the offer. It includes
  /// accepted payments.
  final GuaranteePolicy? guarantee;

  /// The deposit/prepay policy information applicable to the offer. It includes
  /// accepted payments, deadline and the amount due.
  final DepositPolicy? deposit;

  /// The deposit/prepay policy information applicable to the offer. It includes
  /// accepted payments, deadline and the amount due.
  final DepositPolicy? prepay;

  /// The hold policy.
  final HoldPolicy? holdTime;

  // TODO: Figure out how to handle this correctly.  The example only has a
  // TODO: single cancellation policy, but the API docs say it can be a list. While
  // TODO: the model documentation describes it as a list.
  final CancellationPolicy? cancellation;

  /// List of cancellation policies.
  final List<CancellationPolicy>? cancellations;

  /// Check in and check out policies.
  final CheckInOutPolicy? checkInOut;

  PolicyDetails(
      {this.paymentType,
      this.guarantee,
      this.deposit,
      this.prepay,
      this.holdTime,
      this.cancellation,
      this.cancellations,
      this.checkInOut});

  PolicyDetails.fromJson(Map<String, dynamic> json)
      : paymentType = json['paymentType'] == null
            ? null
            : _getPaymentType(json['paymentType']),
        guarantee = json['guarantee'] == null
            ? null
            : GuaranteePolicy.fromJson(json['guarantee']),
        deposit = json['depost'] == null
            ? null
            : DepositPolicy.fromJson(json['deposit']),
        prepay = json['prepay'] == null
            ? null
            : DepositPolicy.fromJson(json['prepay']),
        holdTime = json['holdTime'] == null
            ? null
            : HoldPolicy.fromJson(json['holdTime']),
        cancellation = json['cancellation'] == null
            ? null
            : CancellationPolicy.fromJson(json['cancellation']),
        cancellations = json['cancellations'] == null
            ? null
            : (json['cancellations'] as List)
                .map((i) => CancellationPolicy.fromJson(i))
                .toList(),
        checkInOut = json['checkInOut'] == null
            ? null
            : CheckInOutPolicy.fromJson(json['checkInOut']);

  static PaymentType? _getPaymentType(String type) {
    for (PaymentType paymentType in PaymentType.values) {
      if (paymentType.toString().endsWith(type.toUpperCase())) {
        return paymentType;
      }
    }
    return null;
  }
}

enum PaymentType { GUARANTEE, DEPOSIT, PREPAY, HOLDTIME }
