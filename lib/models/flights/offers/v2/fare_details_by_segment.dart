import 'package:amadeusapi/models/flights/offers/v2/additional_service_request.dart';
import 'package:amadeusapi/models/flights/offers/v2/allotment_details.dart';
import 'package:amadeusapi/models/flights/offers/v2/baggage_allowance.dart';
import 'package:amadeusapi/models/flights/offers/v2/travel_class.dart';

/// Fare details for a segment of travel
class FareDetailsBySegment {
  /// Id of the segment.
  final String segmentId;

  /// Quality of service offered in the cabin where the seat is located in this
  /// flight. Economy, premium economy, business or first class.
  final TravelClass? cabin;

  /// Fare basis specifying the rules of a fare. Usually, though not always, is
  /// composed of the booking class code followed by a set of letters and digits
  /// representing other characteristics of the ticket, such as refundability,
  /// minimum stay requirements, discounts or special promotional elements.
  final String? fareBasis;

  /// The name of the Fare Family corresponding to the fares. Only for the GDS
  /// provider and if the airline has fare families filled.
  final String? brandedFare;

  /// The code of the booking class, a.k.a. class of service or
  /// Reservations/Booking Designator (RBD).
  final String? bookingClass;

  /// True if the corresponding booking class is in an allotment.
  final bool? isAllotment;

  /// Details of the allotment tour.
  final AllotmentDetails? allotmentDetails;

  /// slice and Dice indicator, such as Local Availability, Sub OnD(Origin and
  /// Destination) 1 Availability and Sub OnD 2 Availability
  final SliceDiceIndicator? sliceDiceIndicator;

  /// Baggage allowance weight and quantity limits for this segment.
  final BaggageAllowance? includedCheckedBags;

  /// Additional services available for this segment.
  final AdditionalServiceRequest? additionalServices;

  FareDetailsBySegment(
      {required this.segmentId,
      this.cabin,
      this.fareBasis,
      this.brandedFare,
      this.bookingClass,
      this.isAllotment,
      this.allotmentDetails,
      this.sliceDiceIndicator,
      this.includedCheckedBags,
      this.additionalServices});

  FareDetailsBySegment.fromJson(Map<String, dynamic> json)
      : segmentId = json['segmentId'],
        cabin = json['cabin'] == null ? null : getTravelClass(json['cabin']),
        fareBasis = json['fareBasis'],
        brandedFare = json['brandedFare'],
        bookingClass = json['bookingClass'],
        isAllotment = json['isAllotment'],
        allotmentDetails = json['allotmentDetails'] == null
            ? null
            : AllotmentDetails.fromJson(json['allotmentDetails']),
        sliceDiceIndicator = json['sliceDiceIndicator'] == null
            ? null
            : _getSliceDiceIndicator(json['sliceDiceIndicator']),
        includedCheckedBags = json['includedCheckedBags'] == null
            ? null
            : BaggageAllowance.fromJson(json['includedCheckedBags']),
        additionalServices = json['additionalServices'] == null
            ? null
            : AdditionalServiceRequest.fromJson(json['additionalServices']);

  static TravelClass? getTravelClass(String trvlClass) {
    for (TravelClass travelClass in TravelClass.values) {
      if (travelClass.toString().endsWith(trvlClass)) {
        return travelClass;
      }
    }
    return null;
  }

  static SliceDiceIndicator? _getSliceDiceIndicator(String slice) {
    for (SliceDiceIndicator sliceDiceIndicator in SliceDiceIndicator.values) {
      if (sliceDiceIndicator.toString().endsWith(slice)) {
        return sliceDiceIndicator;
      }
    }
    return null;
  }
}

enum SliceDiceIndicator {
  LOCAL_AVAILABILITY,
  SUB_OD_AVAILABILITY_1,
  SUB_OD_AVAILABILITY_2
}
