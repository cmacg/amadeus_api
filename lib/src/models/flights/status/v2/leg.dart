import 'aircraft_equipment.dart';

/// The list of legs of the datedFlight.
/// definition of leg: operation of the aircraft between a departure station
/// and the next arrival station (between take off and landing)
class Leg {
  /// 3-letter IATA code of the departure airport. e.g. LHR
  final String? boardPointIataCode;

  /// 3-letter IATA code of the arrival airport. e.g. BKK
  final String? offPointIataCode;

  /// The type of aircraft that will operate the leg
  final AircraftEquipment? aircraftEquipment;

  /// Duration of the leg following standard ISO 8601
  /// example: PT14H50M
  final String? scheduledLegDuration;

  Leg(
      {this.boardPointIataCode,
      this.offPointIataCode,
      this.aircraftEquipment,
      this.scheduledLegDuration});

  Leg.fromJson(Map<String, dynamic> json)
      : boardPointIataCode = json['boardPointIataCode'],
        offPointIataCode = json['offPointIataCode'],
        aircraftEquipment = json['aircraftEquipment'] == null
            ? null
            : AircraftEquipment.fromJson(json['aircraftEquipment']),
        scheduledLegDuration = json['scheduledLegDuration'];
}
