/// Information related to the aircraft
class AircraftEquipment {
  /// IATA aircraft code (http://www.flugzeuginfo.net/table_accodes_iata_en.php)
  final String? code;

  AircraftEquipment({this.code});

  AircraftEquipment.fromJson(Map<String, dynamic> json) : code = json['code'];
}
