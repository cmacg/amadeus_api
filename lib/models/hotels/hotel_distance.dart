class HotelDistance {

  final double distance;
  final DistanceUnit distanceUnit;

  HotelDistance(this.distance, this.distanceUnit);

  HotelDistance.fromJson(Map<String, dynamic> json)
  : distance = json['distance'],
  distanceUnit = json['distanceUnit'] == null ? null : _getDistanceUnit(json['distanceUnit']);

  Map<String, dynamic> toJson() => {
    'distance': distance,
    'distanceUnit': distanceUnit == null ? null : distanceUnit.toString().split('.').last,
  };


  static DistanceUnit _getDistanceUnit(String unit) {
    for(DistanceUnit distanceUnit in DistanceUnit.values) {
      if(distanceUnit.toString().endsWith(unit)) {
        return distanceUnit;
      }
    }
    return null;
  }
}

enum DistanceUnit{ KM, MILE }