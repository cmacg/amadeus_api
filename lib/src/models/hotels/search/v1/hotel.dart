import 'address.dart';
import '../../../distance.dart';
import '../../../geo_code.dart';

/// Hotel location information
class Hotel {
  /// Location sub-type (e.g. airport, port, rail-station, restaurant, atm...)
  final String? subtype;

  /// Hotel name
  final String? name;

  /// Olson format name (TZ) of the location time zone
  /// (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
  final String? timeZoneName;

  /// IATA location code
  final String? iataCode;

  /// Address information
  final Address? address;

  /// Geographic coordinates describing the position of any location on the
  /// surface of Earth
  final GeoCode? geoCode;

  /// Amadeus Property Code (8 chars)
  final String? hotelId;

  /// Brand (RT...) or Merchant (AD...) (Amadeus 2 chars Code)
  final String? chainCode;

  /// Distance is designed to express a distance reprensentation with its value
  /// unit and state unlimited or not.
  final Distance? distance;

  /// Last time the content was updated by a provider.
  final DateTime? lastUpdate;

  Hotel({
    this.subtype,
    this.name,
    this.timeZoneName,
    this.iataCode,
    this.address,
    this.geoCode,
    this.hotelId,
    this.chainCode,
    this.distance,
    this.lastUpdate,
  });

  Hotel.fromJson(Map<String, dynamic> json)
      : subtype = json['subtype'],
        name = json['name'],
        timeZoneName = json['timeZoneName'],
        iataCode = json['iataCode'],
        address =
            json['address'] == null ? null : Address.fromJson(json['address']),
        geoCode =
            json['geoCode'] == null ? null : GeoCode.fromJson(json['geoCode']),
        hotelId = json['hotelId'],
        chainCode = json['chainCode'],
        distance = json['distance'] == null
            ? null
            : Distance.fromJson(json['distance']),
        lastUpdate = json['lastUpdate'] == null
            ? null
            : DateTime.parse(json['lastUpdate']);
}
