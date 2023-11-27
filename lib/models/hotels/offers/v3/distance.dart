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
    unit = json['unit'] != null ? DistanceUnit.values[json['unit']] : null;
    value = json['value'];
    displayValue = json['displayValue'];
    isUnlimited = json['isUnlimited'];
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
  MILES,
  BYTES,
  KILOBYTES
}
