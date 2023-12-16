import 'package:amadeusapi/models/flights/offers/v2/chargeable_checked_bags.dart';
import 'package:amadeusapi/models/flights/offers/v2/chargeable_seat.dart';

class AdditionalServiceRequest {
  final ChargeableCheckedBags? chargeableCheckedBags;
  final ChargeableSeat? chargeableSeat;
  final List<OtherService>? otherServices;

  AdditionalServiceRequest(
      {this.chargeableCheckedBags, this.chargeableSeat, this.otherServices});

  AdditionalServiceRequest.fromJson(Map<String, dynamic> json)
      : chargeableCheckedBags = json['chargeableCheckedBags'] == null
            ? null
            : ChargeableCheckedBags.fromJson(json['chargeableCheckedBags']),
        chargeableSeat = json['chargeableSeat'] == null
            ? null
            : ChargeableSeat.fromJson(json['chargeableSeat']),
        otherServices =
            _getOtherServices(json['otherServices'] as List<String>);

  static List<OtherService> _getOtherServices(List<String> services) {
    List<OtherService> otherServices = [];
    for (String service in services) {
      for (OtherService otherService in OtherService.values) {
        if (otherService.toString().endsWith(service)) {
          otherServices.add(otherService);
        }
      }
    }
    return otherServices;
  }
}

enum OtherService { PRIORITY_BOARDING, AIRPORT_CHECKIN }
