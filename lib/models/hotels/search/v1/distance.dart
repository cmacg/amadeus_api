/// Distance is designed to express a distance reprensentation with its value
/// unit and state unlimited or not.
class Distance {
  // Unit type.
  DistanceUnit? unit;
  double? value;
  String? displayValue;
  String? isUnlimited;

  Distance({
    this.unit,
    this.value,
    this.displayValue,
    this.isUnlimited,
  });

  Distance.fromJson(Map<String, dynamic> json) {
    unit = json['unit'] == null ? null : _getDistanceUnit(json['unit']);
    value = json['value'];
    displayValue = json['displayValue'];
    isUnlimited = json['isUnlimited'];
  }

  static DistanceUnit? _getDistanceUnit(String unit) {
    for (DistanceUnit distanceUnit in DistanceUnit.values) {
      if (distanceUnit.toString().endsWith(unit.toUpperCase())) {
        return distanceUnit;
      }
    }
    return null;
  }
}

enum DistanceUnit {
  NIGHT,
  PIXELS,
  KILOGRAMS,
  POUNDS,
  CENTIMETERS,
  INCHES,
  BITS_PER_PIXEL,
  KILOMETERS,
  KM,
  MILES,
  MI,
  BYTES,
  KILOBYTES
}
