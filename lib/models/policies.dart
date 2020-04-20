import 'package:amadeusapi/models/cancellation.dart';
import 'package:amadeusapi/models/check_in_out.dart';
import 'package:amadeusapi/models/deposit.dart';
import 'package:amadeusapi/models/guarantee.dart';
import 'package:amadeusapi/models/hold_time.dart';

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
      guarantee = Guarantee.fromJson(json['guarantee']),
      deposit = Deposit.fromJson(json['deposit']),
      prepay = Deposit.fromJson(json['prepay']),
      holdTime = HoldTime.fromJson(json['holdTime']),
      cancellation = Cancellation.fromJson(json['cancellation']),
      checkInOut = CheckInOut.fromJson(json['checkInOut']);

  Map<String, dynamic> toJson() => {
    'paymentType': paymentType,
    'guarantee': guarantee.toJson(),
    'deposit': deposit.toJson(),
    'prepay': prepay.toJson(),
    'holdTime': holdTime.toJson(),
    'cancellation': cancellation.toJson(),
    'checkInOut': checkInOut.toJson(),
  };

}