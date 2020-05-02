import 'package:amadeusapi/models/hotels/hotel_distance.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing the HotelDistance.toJson and fromJson methods', () {
    Map<String,dynamic> json = {"distance":0.5,"distanceUnit":"KM"};

    HotelDistance distance = HotelDistance.fromJson(json);
    expect(distance.distance, 0.5);
    expect(distance.distanceUnit, DistanceUnit.KM);

    Map<String, dynamic> test = distance.toJson();
    expect(test['distance'], 0.5);
    expect(DistanceUnit.KM.toString().endsWith(test['distanceUnit']), isTrue);
  });
}