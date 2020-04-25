import 'package:amadeusapi/models/hotels/commission.dart';
import 'package:amadeusapi/models/hotels/description.dart';
import 'package:amadeusapi/models/hotels/guests.dart';
import 'package:amadeusapi/models/hotels/policies.dart';
import 'package:amadeusapi/models/hotels/price.dart';
import 'package:amadeusapi/models/hotels/rate_family_estimated.dart';
import 'package:amadeusapi/models/hotels/room.dart';
import 'package:intl/intl.dart';

class Offer {
  final String type;
  final String id;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int roomQuantity;
  final String rateCode;
  final RateFamilyEstimated rateFamilyEstimated;
  final String category;
  final Description description;
  final Commission commission;
  final BoardType boardType;
  final Room room;
  final Guests guests;
  final Price price;
  final Policies policies;
  final String self;

  Offer(
      {this.type,
      this.id,
      this.checkInDate,
      this.checkOutDate,
      this.roomQuantity,
      this.rateCode,
      this.rateFamilyEstimated,
      this.category,
      this.description,
      this.commission,
      this.boardType,
      this.room,
      this.guests,
      this.price,
      this.policies,
      this.self});

  Offer.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        checkInDate = DateTime.parse(json['checkInDate']),
        checkOutDate = DateTime.parse(json['checkOutDate']),
        roomQuantity = json['roomQuantity'],
        rateCode = json['rateCode'],
        rateFamilyEstimated =
            RateFamilyEstimated.fromJson(json['rateFamilyEstimated']),
        category = json['category'],
        description = Description.fromJson(json['description']),
        commission = Commission.fromJson(json['commission']),
        boardType = _getBoardType(json['boardType']),
        room = Room.fromJson(json['room']),
        guests = Guests.fromJson(json['guests']),
        price = Price.fromJson(json['price']),
        policies = Policies.fromJson(json['policies']),
        self = json['self'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'checkInDate': (new DateFormat('yyyy-MM-dd')).format(checkInDate),
        'checkOutDate': (new DateFormat('yyyy-MM-dd')).format(checkOutDate),
        'rateCode': rateCode,
        'rateFamilyEstimated': rateFamilyEstimated.toJson(),
        'category': category,
        'description': description.toJson(),
        'commission': commission.toJson(),
        'boardType': boardType.toString(),
        'room': room.toJson(),
        'guests': guests.toJson(),
        'price': price.toJson(),
        'policies': policies.toJson(),
        'self': self
      };

  static BoardType _getBoardType(String type) {
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
