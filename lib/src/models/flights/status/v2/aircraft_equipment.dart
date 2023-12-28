/// Information related to the aircraft
class AircraftEquipment {
  /// The type of aircraft that will operate the leg.
  /// example: 733
  final String? aircraftType;

  AircraftEquipment({this.aircraftType});

  AircraftEquipment.fromJson(Map<String, dynamic> json)
      : aircraftType = json['aircraftType'];
}
