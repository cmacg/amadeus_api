import 'package:intl/intl.dart';

import 'commission.dart';
import 'guests.dart';
import 'hotel_price.dart';
import 'policy_details.dart';
import 'qualified_free_text.dart';
import 'rate_family.dart';
import 'room_details.dart';

/// The hotel offer.
class HotelOffer {
  final String? type;

  /// Unique identifier of this offer. Might be valid for a temporary period only.
  /// example: TSXOJ6LFQ2
  /// minLength: 2
  /// maxLength: 100
  /// pattern: ^[A-Z0-9]*$
  final String id;

  /// Check-in date of the stay (hotel local date). Format YYYY-MM-DD. The
  /// lowest accepted value is today date (no dates in the past).
  final DateTime? checkInDate;

  /// check-out date of the stay (hotel local date). Format YYYY-MM-DD.  The
  /// lowest accepted value is checkInDate+1.
  final DateTime? checkOutDate;

  /// Number of rooms (1-9)
  final int roomQuantity;

  /// Special Rate - Provider Response Code (3 chars).
  /// example: RAC
  /// minLength: 3
  /// maxLength: 3
  /// pattern: ^[A-Z0-9*]{3}$
  final String rateCode;

  /// The estimated rate code family of the offer. Grouping various rate plan
  /// codes that belongs to the same family and indicates the type of the rate.
  final RateFamily? rateFamilyEstimated;

  /// Special Rate Category
  /// Examples:ASSOCIATION, FAMILY_PLAN
  final String? category;

  /// Specific type to convey a list of string for specific information type
  /// (via qualifier) in specific character set, or language.
  final QualifiedFreeText? description;

  /// Commission paid to the travel seller.
  final Commission? commission;

  /// The included Breakfast/Meals.
  final BoardType? boardType;

  /// Room type code, 3 character identifier of the room.  The first character
  /// identifies the room type category.  The second numeric character identifies
  /// the number of beds.  The third character identifies the bed type.
  ///
  /// There is a special case where ROH is returned, this value stands for Run Of House.
  final RoomDetails roomDetails;

  /// Number of adult guests and the ages of any child guests.
  final Guests? guests;

  /// Price information for this offer.
  final HotelPrice hotelPrice;

  /// Booking rules.
  final PolicyDetails? policyDetails;

  /// A self link to the object. Use this to refresh the Offer price.
  final String? self;

  static final DateFormat dateFormat = new DateFormat('yyyy-MM-dd');

  HotelOffer(
      {this.type,
      required this.id,
      this.checkInDate,
      this.checkOutDate,
      this.roomQuantity = 1,
      required this.rateCode,
      this.rateFamilyEstimated,
      this.category,
      this.description,
      this.commission,
      this.boardType = BoardType.ROOM_ONLY,
      required this.roomDetails,
      this.guests,
      required this.hotelPrice,
      this.policyDetails,
      this.self});

  HotelOffer.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        checkInDate = json['checkInDate'] == null
            ? null
            : DateTime.parse(json['checkInDate']),
        checkOutDate = json['checkOutDate'] == null
            ? null
            : DateTime.parse(json['checkOutDate']),
        roomQuantity = json['roomQuantity'] == null ? 1 : json['roomQuantity'],
        rateCode = json['rateCode'],
        rateFamilyEstimated = json['rateFamilyEstimated'] == null
            ? null
            : RateFamily.fromJson(json['rateFamilyEstimated']),
        category = json['category'],
        description = json['description'] == null
            ? null
            : QualifiedFreeText.fromJson(json['description']),
        commission = json['commission'] == null
            ? null
            : Commission.fromJson(json['commission']),
        boardType =
            json['boardType'] == null ? null : _getBoardType(json['boardType']),
        roomDetails = RoomDetails.fromJson(json['room']),
        guests =
            json['guests'] == null ? null : Guests.fromJson(json['guests']),
        hotelPrice = HotelPrice.fromJson(json['price']),
        policyDetails = json['policies'] == null
            ? null
            : PolicyDetails.fromJson(json['policies']),
        self = json['self'];

  static BoardType? _getBoardType(String type) {
    for (BoardType boardType in BoardType.values) {
      if (boardType.toString().endsWith(type)) {
        return boardType;
      }
    }
    return null;
  }
}

enum BoardType {
  ROOM_ONLY,
  BREAKFAST,
  HALF_BOARD,
  FULL_BOARD,
  ALL_INCLUSIVE,
  BUFFET_BREAKFAST,
  CARIBBEAN_BREAKFAST,
  CONTINENTAL_BREAKFAST,
  ENGLISH_BREAKFAST,
  FULL_BREAKFAST,
  DINNER_BED_AND_BREAKFAST,
  LUNCH,
  DINNER,
  FAMILY_PLAN,
  AS_BROCHURED,
  SELF_CATERING,
  BERMUDA,
  AMERICAN,
  FAMILY_AMERICAN,
  MODIFIED
}
