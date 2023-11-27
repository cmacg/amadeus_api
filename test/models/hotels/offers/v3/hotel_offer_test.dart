import 'package:amadeusapi/models/hotels/offers/v3/hotel_offer.dart';
import 'package:test/test.dart';

void main() {
  final Map<String, dynamic> json = {
    "id": "TSXOJ6LFQ2",
    "checkInDate": "2023-11-22",
    "checkOutDate": "2023-11-23",
    "rateCode": "V  ",
    "rateFamilyEstimated": {"code": "PRO", "type": "P"},
    "room": {
      "type": "ELE",
      "typeEstimated": {
        "category": "EXECUTIVE_ROOM",
        "beds": 1,
        "bedType": "DOUBLE"
      },
      "description": {
        "text":
            "Prepay Non-refundable Non-changeable, prepay in full\nExecutive King Room, Executive Lounge Access,\n1 King, 35sqm/377sqft-40sqm/430sqft, Wireless",
        "lang": "EN"
      }
    },
    "guests": {"adults": 1},
    "price": {
      "currency": "GBP",
      "base": "716.00",
      "total": "716.00",
      "variations": {
        "average": {"base": "716.00"},
        "changes": [
          {
            "startDate": "2023-11-22",
            "endDate": "2023-11-23",
            "total": "716.00"
          }
        ]
      }
    },
    "policies": {
      "paymentType": "deposit",
      "cancellations": [
        {
          "description": {"text": "NON-REFUNDABLE RATE"},
          "type": "FULL_STAY"
        }
      ],
    },
    "self": "https://test.api.amadeus.com/v3/shopping/hotel-offers/TSXOJ6LFQ2"
  };

  final HotelOffer hotelOffer = HotelOffer.fromJson(json);

  test('HotelOffer.fromJson', () {
    expect(hotelOffer.id, "TSXOJ6LFQ2");
    expect(hotelOffer.checkInDate, DateTime.parse("2023-11-22"));
    expect(hotelOffer.checkOutDate, DateTime.parse("2023-11-23"));
    expect(hotelOffer.rateCode, "V  ");
  });
}
