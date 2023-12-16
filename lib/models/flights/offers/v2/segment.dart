import 'package:amadeusapi/models/flights/offers/v2/aircraft_equipment.dart';
import 'package:amadeusapi/models/flights/offers/v2/co2_emission.dart';
import 'package:amadeusapi/models/flights/offers/v2/flight_end_point.dart';
import 'package:amadeusapi/models/flights/offers/v2/flight_stop.dart';
import 'package:amadeusapi/models/flights/offers/v2/operating_flight.dart';

class Segment {
  final String? id;
  final int? numberOfStops;
  final bool? blacklistedInEu;
  final List<CO2Emission>? co2Emissions;
  final FlightEndPoint? departure;
  final FlightEndPoint? arrival;
  final String? carrierCode;
  final String? number;
  final AircraftEquipment? aircraft;
  final OperatingFlight? operating;
  final String? duration;
  final List<FlightStop>? stops;

  Segment(
      {this.id,
      this.numberOfStops,
      this.blacklistedInEu,
      this.co2Emissions,
      this.departure,
      this.arrival,
      this.carrierCode,
      this.number,
      this.aircraft,
      this.operating,
      this.duration,
      this.stops});

  Segment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        numberOfStops = json['numberOfStops'],
        blacklistedInEu = json['blacklistedInEu'],
        co2Emissions = json['co2Emissions'] == null
            ? null
            : (json['co2Emissions'] as List)
                .map((e) => CO2Emission.fromJson(e))
                .toList(),
        departure = json['departure'] == null
            ? null
            : FlightEndPoint.fromJson(json['departure']),
        arrival = json['arrival'] == null
            ? null
            : FlightEndPoint.fromJson(json['arrival']),
        carrierCode = json['carrierCode'],
        number = json['number'],
        aircraft = json['aircraft'] == null
            ? null
            : AircraftEquipment.fromJson(json['aircraft']),
        operating = json['operating'] == null
            ? null
            : OperatingFlight.fromJson(json['operating']),
        duration = json['duration'],
        stops = json['stops'] == null
            ? null
            : (json['stops'] as List)
                .map((e) => FlightStop.fromJson(e))
                .toList();
}
