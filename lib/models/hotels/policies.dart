import 'package:amadeusapi/models/hotels/cancellation.dart';
import 'package:amadeusapi/models/hotels/check_in_out.dart';
import 'package:amadeusapi/models/hotels/deposit.dart';
import 'package:amadeusapi/models/hotels/guarantee.dart';
import 'package:amadeusapi/models/hotels/hold_time.dart';

class Policies {
  final String paymentType;
  final Guarantee guarantee;
  final Deposit deposit;
  final Deposit prepay;
  final HoldTime holdTime;
  final Cancellation cancellation;
  final CheckInOut checkInOut;

  Policies({this.paymentType, this.guarantee, this.deposit, this.prepay,
      this.holdTime, this.cancellation, this.checkInOut});

  Policies.fromJson(Map<String, dynamic> json)
    : paymentType = json['paymentType'],
      guarantee = json['guarantee'] == null ? null : Guarantee.fromJson(json['guarantee']),
      deposit = json['depost'] == null ? null : Deposit.fromJson(json['deposit']),
      prepay = json['prepay'] == null ? null : Deposit.fromJson(json['prepay']),
      holdTime = json['holdTime'] == null ? null : HoldTime.fromJson(json['holdTime']),
      cancellation = json['cancellation'] == null ? null : Cancellation.fromJson(json['cancellation']),
      checkInOut = json['checkInOut'] == null ? null : CheckInOut.fromJson(json['checkInOut']);

  Map<String, dynamic> toJson() => {
    'paymentType': paymentType,
    'guarantee': guarantee == null ? null : guarantee.toJson(),
    'deposit': deposit == null ? null : deposit.toJson(),
    'prepay': prepay == null ? null : prepay.toJson(),
    'holdTime': holdTime == null ? null : holdTime.toJson(),
    'cancellation': cancellation == null ? null : cancellation.toJson(),
    'checkInOut': checkInOut == null ? null : checkInOut.toJson(),
  };

}