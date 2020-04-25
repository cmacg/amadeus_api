class HotelDistance {

  final double distance;
  final DistanceUnit distanceUnit;

  HotelDistance(this.distance, this.distanceUnit);

  HotelDistance.fromJson(Map<String, dynamic> json)
  : distance = json['distance'].toDouble(),
  distanceUnit = _getDistanceUnit(json['distance']);

  Map<String, dynamic> toJson() => {
    'distance': distance,
    'distanceUnit': distanceUnit.toString(),
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