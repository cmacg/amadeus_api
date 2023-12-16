import 'package:amadeusapi/models/distance.dart';
import 'package:amadeusapi/models/flights/locations/v1/address.dart';
import 'package:amadeusapi/models/flights/locations/v1/analytics.dart';
import 'package:amadeusapi/models/flights/locations/v1/links.dart';
import 'package:amadeusapi/models/geo_code.dart';

class Location {
  /// The of this resource
  final String? id;

  /// HREF reference of this location
  final Links? self;

  /// The [type].  Usually always location
  final String? type;

  final LocationSubType? subType;

  /// Short name of the location.
  final String? name;

  /// Detailed name of the location. For a city location it contains city name
  /// and country code. For an airport location it contains city name; country
  /// code and airport full name
  final String? detailedName;

  /// timezone offset of the location at the date of the API call (including
  /// daylight saving time)
  final String? timeZoneOffset;

  /// IATA code of the location.
  final String? iataCode;

  /// The longitude and latitude of this location
  final GeoCode? geoCode;

  /// Address of the location.
  final Address? address;

  /// Great-circle distance between two locations. This distance thus do not
  /// take into account traffic conditions; international boundaries; mountains;
  /// water; or other elements that might make the a nearby location hard to
  /// reach.
  final Distance? distance;

  /// Analytics of travelers.
  final Analytics? analytics;

  /// Category of the location
  final String? category;

  /// List of tags related to the location
  final List<String>? tags;

  /// The rank is the position compared to other locations based on how famous
  /// a location is. 1 being the highest.
  final String? rank;

  Location(
      {this.id,
      this.self,
      this.type,
      this.subType,
      this.name,
      this.detailedName,
      this.timeZoneOffset,
      this.iataCode,
      this.geoCode,
      this.address,
      this.distance,
      this.analytics,
      this.category,
      this.tags,
      this.rank});

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        self = json['self'] == null ? null : Links.fromJson(json['self']),
        type = json['type'],
        subType = json['subType'] == null
            ? null
            : _getLocationSubType(json['subType']),
        name = json['name'],
        detailedName = json['detailedName'],
        timeZoneOffset = json['timeZoneOffset'],
        iataCode = json['iataCode'],
        geoCode =
            json['geoCode'] == null ? null : GeoCode.fromJson(json['geoCode']),
        address =
            json['address'] == null ? null : Address.fromJson(json['address']),
        distance = json['distance'] == null
            ? null
            : Distance.fromJson(json['distance']),
        analytics = json['analytics'] == null
            ? null
            : Analytics.fromJson(json['analytics']),
        category = json['category'],
        tags = json['tags'],
        rank = json['rank'];

  static LocationSubType? _getLocationSubType(String subType) {
    for (LocationSubType locationSubType in LocationSubType.values) {
      if (locationSubType.toString().endsWith(subType)) {
        return locationSubType;
      }
    }
    return null;
  }
}

enum LocationSubType { AIRPORT, CITY, POINT_OF_INTEREST, DISTRICT }
