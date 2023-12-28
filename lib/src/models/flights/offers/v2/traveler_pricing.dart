import 'fare_details_by_segment.dart';
import 'price.dart';

class TravelerPricing {
  /// Id of the traveler
  final String travelerId;

  /// Option specifying a group of fares, which may be valid under certain
  /// conditons.  Can be used to specify special fare discount for a passenger.
  final FareOption fareOption;

  /// The traveler type.
  final TravelerType travelerType;

  /// If the TravelerType is HELD_INFANT, this value corresponds to the adult
  /// traveler's id who will share the seat with the infant.
  final String? associatedAdultId;

  /// The price for the traveler.
  final Price? price;

  /// Details of the different segments of the flight offer
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  TravelerPricing(
      {required this.travelerId,
      required this.fareOption,
      required this.travelerType,
      this.associatedAdultId,
      this.price,
      required this.fareDetailsBySegment});

  TravelerPricing.fromJson(Map<String, dynamic> json)
      : travelerId = json['travelerId'],
        fareOption = _getFareOption(json['fareOption']),
        travelerType = _getTravelerType(json['travelerType']),
        associatedAdultId = json['associatedAdultId'],
        price = json['price'] == null ? null : Price.fromJson(json['price']),
        fareDetailsBySegment = json['fareDetailsBySegment'] == null
            ? null
            : (json['fareDetailsBySegment'] as List)
                .map((e) => FareDetailsBySegment.fromJson(e))
                .toList();

  static _getFareOption(String option) {
    for (FareOption fareOption in FareOption.values) {
      if (fareOption.toString().endsWith(option)) {
        return fareOption;
      }
    }
    return null;
  }

  static _getTravelerType(String type) {
    for (TravelerType travelerType in TravelerType.values) {
      if (travelerType.toString().endsWith(type)) {
        return travelerType;
      }
    }
    return null;
  }
}

/// Option specifying a group of fares, which may be valid under certain
/// conditons.  Can be used to specify special fare discount for a passenger.
enum FareOption {
  STANDARD,
  INCLUSIVE_TOUR,
  SPANISH_MELILLA_RESIDENT,
  SPANISH_CEUTA_RESIDENT,
  SPANISH_CANARY_RESIDENT,
  SPANISH_BALEARIC_RESIDENT,
  AIR_FRANCE_METROPOLITAN_DISCOUNT_PASS,
  AIR_FRANCE_DOM_DISCOUNT_PASS,
  AIR_FRANCE_COMBINED_DISCOUNT_PASS,
  AIR_FRANCE_FAMILY,
  ADULT_WITH_COMPANION,
  COMPANION
}

/// The traveler type.
/// Age restrictions :
/// CHILD < 12y
/// HELD_INFANT < 2y
/// SEATED_INFANT < 2y
/// SENIOR >=60y
enum TravelerType {
  ADULT,
  CHILD,
  SENIOR,
  YOUNG,
  HELD_INFANT,
  SEATED_INFANT,
  STUDENT
}
