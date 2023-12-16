import 'package:amadeusapi/models/flights/status/v2/dated_flight.dart';
import 'package:amadeusapi/models/flights/status/v2/flight_designator.dart';
import 'package:amadeusapi/models/flights/status/v2/flight_point.dart';
import 'package:amadeusapi/models/flights/status/v2/flight_status.dart';
import 'package:test/test.dart';

void main() async {
  final Map<String, dynamic> json = {
    "meta": {
      "count": 1,
      "links": {
        "self":
            "https://test.api.amadeus.com/v2/schedule/flights?carrierCode=TP&flightNumber=487&scheduledDepartureDate=2023-08-01"
      }
    },
    "data": [
      {
        "type": "DatedFlight",
        "scheduledDepartureDate": "2023-08-01",
        "flightDesignator": {"carrierCode": "TP", "flightNumber": 487},
        "flightPoints": [
          {
            "iataCode": "NCE",
            "departure": {
              "timings": [
                {"qualifier": "STD", "value": "2023-08-01T18:10+02:00"}
              ]
            }
          },
          {
            "iataCode": "LIS",
            "arrival": {
              "timings": [
                {"qualifier": "STA", "value": "2023-08-01T19:45+01:00"}
              ]
            }
          }
        ],
        "segments": [
          {
            "boardPointIataCode": "NCE",
            "offPointIataCode": "LIS",
            "scheduledSegmentDuration": "PT2H35M",
            "partnership": {
              "operatingFlight": {"carrierCode": "A3", "flightNumber": 1748}
            }
          }
        ],
        "legs": [
          {
            "boardPointIataCode": "NCE",
            "offPointIataCode": "LIS",
            "aircraftEquipment": {"aircraftType": "E90"},
            "scheduledLegDuration": "PT2H35M"
          }
        ]
      }
    ]
  };

  FlightStatus flightStatus = FlightStatus.fromJson(json);

  test('Testing the FlightStatus.fromJson', () {
    expect(flightStatus.datedFlights.length, isNotEmpty);
    DatedFlight datedFlight = flightStatus.datedFlights[0];
    expect(datedFlight.type, 'DatedFlight');

    FlightDesignator flightDesignator = datedFlight.flightDesignator!;
    expect(flightDesignator.carrierCode!, 'TP');
    expect(flightDesignator.flightNumber!, 487);
    expect(flightDesignator.operationalSuffix, isNull);

    FlightPoint flightPoint1 = datedFlight.flightPoints![0];
    expect(flightPoint1.iataCode, 'NCE');
    expect(flightPoint1.departure!, isNotNull);

    FlightPoint flightPoint2 = datedFlight.flightPoints![1];
    expect(flightPoint2.iataCode, 'LIS');
    expect(flightPoint2.arrival!, isNotNull);
  });
}
