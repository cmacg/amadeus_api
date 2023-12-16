import 'package:amadeusapi/models/flights/offers/v2/fare_details_by_segment.dart';
import 'package:amadeusapi/models/flights/offers/v2/travel_class.dart';

class CO2Emission {
  /// Weight of Co2 emitted for the concerned segment
  final int? weight;

  /// Code to qualify unit as pounds or kilos
  final String? weightUnit;

  /// Quality of service offered in the cabin where the seat is located in this
  /// flight. Economy, premium economy, business or first class
  final TravelClass? cabin;

  CO2Emission({this.weight, this.weightUnit, this.cabin});

  CO2Emission.fromJson(Map<String, dynamic> json)
      : weight = json['weight'],
        weightUnit = json['weightUnit'],
        cabin = json['cabin'] == null
            ? null
            : FareDetailsBySegment.getTravelClass(json['cabin']);
}
