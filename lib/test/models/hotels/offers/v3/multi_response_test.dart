import 'package:test/test.dart';

import '../../../../../src/models/hotels/offers/v3/cancellation_policy.dart';
import '../../../../../src/models/hotels/offers/v3/hotel_offers.dart';
import '../../../../../src/models/hotels/offers/v3/multi_response.dart';
import '../../../../../src/models/hotels/offers/v3/policy_details.dart';

final Map<String, dynamic> json = {
  "data": [
    {
      "type": "hotel-offers",
      "hotel": {
        "type": "hotel",
        "hotelId": "MCLONGHM1",
        "chainCode": "MC",
        "dupeId": "700031300",
        "name": "JW Marriott Grosvenor House London",
        "cityCode": "LON",
        "latitude": 51.50988,
        "longitude": -0.15509
      },
      "available": true,
      "offers": [
        {
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
            "cancellation": {
              "description": {"text": "NON-REFUNDABLE RATE"},
              "type": "FULL_STAY"
            }
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/TSXOJ6LFQ2"
        }
      ],
      "self":
          "https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM&adults=1&checkInDate=2023-11-22&paymentPolicy=NONE&roomQuantity=1"
    },
    {
      "type": "hotel-offers",
      "hotel": {
        "type": "hotel",
        "hotelId": "MCLONGHM2",
        "chainCode": "MC",
        "dupeId": "700031322",
        "name": "JW Marriott Double House London",
        "cityCode": "LON",
        "latitude": 51.50988,
        "longitude": -0.15509
      },
      "available": true,
      "offers": [
        {
          "id": "TSXOJ6LFQ3",
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
            "base": "780.00",
            "total": "780.00",
            "variations": {
              "average": {"base": "780.00"},
              "changes": [
                {
                  "startDate": "2023-11-22",
                  "endDate": "2023-11-23",
                  "total": "780.00"
                }
              ]
            }
          },
          "policies": {
            "paymentType": "deposit",
            "cancellation": {
              "description": {"text": "NON-REFUNDABLE RATE"},
              "type": "FULL_STAY"
            }
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/TSXOJ6LFQ2"
        }
      ],
      "self":
          "https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM&adults=1&checkInDate=2023-11-22&paymentPolicy=NONE&roomQuantity=1"
    }
  ]
};

void main() {
  print('starting the multi response test');

  final MultiResponse multiResponse = MultiResponse.fromJson(json);

  test('Testing MultiResponse fromJson', () {
    expect(multiResponse, isNotNull);
    expect(multiResponse.hotelOffers?.length, 2);
  });

  final HotelOffers hotelOffers1 = multiResponse.hotelOffers![0];
  final HotelOffers hotelOffers2 = multiResponse.hotelOffers![1];

  test('Testing Hotel Offers 1: hotel', () {
    expect(hotelOffers1.hotel?.hotelId, "MCLONGHM1");
    expect(hotelOffers1.hotel?.name, "JW Marriott Grosvenor House London");
    expect(hotelOffers1.hotel?.cityCode, "LON");
    expect(hotelOffers1.hotel?.latitude, 51.50988);
    expect(hotelOffers1.hotel?.longitude, -0.15509);
    expect(hotelOffers1.hotel?.chainCode, "MC");
    expect(hotelOffers1.hotel?.dupeId, "700031300");
  });

  test('Testing Hotel Offers 2: hotel', () {
    expect(hotelOffers2.hotel?.hotelId, "MCLONGHM2");
    expect(hotelOffers2.hotel?.name, "JW Marriott Double House London");
    expect(hotelOffers2.hotel?.cityCode, "LON");
    expect(hotelOffers2.hotel?.latitude, 51.50988);
    expect(hotelOffers2.hotel?.longitude, -0.15509);
    expect(hotelOffers2.hotel?.chainCode, "MC");
    expect(hotelOffers2.hotel?.dupeId, "700031322");
  });

  test('Testing Hotel Offers 1: offers', () {
    expect(hotelOffers1.offers?.length, 1);
    expect(hotelOffers1.offers?[0].id, "TSXOJ6LFQ2");
    expect(hotelOffers1.offers?[0].checkInDate, DateTime.parse("2023-11-22"));
    expect(hotelOffers1.offers?[0].checkOutDate, DateTime.parse("2023-11-23"));
    expect(hotelOffers1.offers?[0].rateCode, "V  ");
    expect(hotelOffers1.offers?[0].rateFamilyEstimated?.code, "PRO");
    expect(hotelOffers1.offers?[0].rateFamilyEstimated?.type, "P");
    expect(hotelOffers1.offers?[0].roomDetails.type, "ELE");
    expect(hotelOffers1.offers?[0].roomDetails.typeEstimated?.category,
        "EXECUTIVE_ROOM");
    expect(hotelOffers1.offers?[0].roomDetails.typeEstimated?.beds, 1);
    expect(
        hotelOffers1.offers?[0].roomDetails.typeEstimated?.bedType, "DOUBLE");
    expect(hotelOffers1.offers?[0].roomDetails.description?.text,
        "Prepay Non-refundable Non-changeable, prepay in full\nExecutive King Room, Executive Lounge Access,\n1 King, 35sqm/377sqft-40sqm/430sqft, Wireless");
    expect(hotelOffers1.offers?[0].roomDetails.description?.lang, "EN");
    expect(hotelOffers1.offers?[0].guests?.adults, 1);
    expect(hotelOffers1.offers?[0].hotelPrice.currency, "GBP");
    expect(hotelOffers1.offers?[0].hotelPrice.base, "716.00");
    expect(hotelOffers1.offers?[0].hotelPrice.total, "716.00");
    expect(
        hotelOffers1.offers?[0].hotelPrice.variations?.average?.base, "716.00");
    expect(
        hotelOffers1.offers?[0].hotelPrice.variations?.priceVariations?.length,
        1);
    expect(
        hotelOffers1
            .offers?[0].hotelPrice.variations?.priceVariations?[0].startDate,
        DateTime(2023, 11, 22));
    expect(
        hotelOffers1
            .offers?[0].hotelPrice.variations?.priceVariations?[0].endDate,
        DateTime(2023, 11, 23));
    expect(
        hotelOffers1
            .offers?[0].hotelPrice.variations?.priceVariations?[0].total,
        "716.00");
    expect(hotelOffers1.offers?[0].policyDetails?.paymentType.toString(),
        PaymentType.DEPOSIT.toString());
    expect(
        hotelOffers1.offers?[0].policyDetails?.cancellation?.description?.text,
        "NON-REFUNDABLE RATE");
    expect(hotelOffers1.offers?[0].policyDetails?.cancellation?.type.toString(),
        CancellationType.FULL_STAY.toString());
    expect(hotelOffers1.self,
        "https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM&adults=1&checkInDate=2023-11-22&paymentPolicy=NONE&roomQuantity=1");
    expect(hotelOffers1.available, true);
  });

  test('Testing Hotel Offers 2: offers', () {
    expect(hotelOffers2.offers?.length, 1);
    expect(hotelOffers2.offers?[0].id, "TSXOJ6LFQ3");
    expect(hotelOffers2.offers?[0].checkInDate, DateTime.parse("2023-11-22"));
    expect(hotelOffers2.offers?[0].checkOutDate, DateTime.parse("2023-11-23"));
    expect(hotelOffers2.offers?[0].rateCode, "V  ");
    expect(hotelOffers2.offers?[0].rateFamilyEstimated?.code, "PRO");
    expect(hotelOffers2.offers?[0].rateFamilyEstimated?.type, "P");
    expect(hotelOffers2.offers?[0].roomDetails.type, "ELE");
    expect(hotelOffers2.offers?[0].roomDetails.typeEstimated?.category,
        "EXECUTIVE_ROOM");
    expect(hotelOffers2.offers?[0].roomDetails.typeEstimated?.beds, 1);
    expect(
        hotelOffers2.offers?[0].roomDetails.typeEstimated?.bedType, "DOUBLE");
    expect(hotelOffers2.offers?[0].roomDetails.description?.text,
        "Prepay Non-refundable Non-changeable, prepay in full\nExecutive King Room, Executive Lounge Access,\n1 King, 35sqm/377sqft-40sqm/430sqft, Wireless");
    expect(hotelOffers2.offers?[0].roomDetails.description?.lang, "EN");
    expect(hotelOffers2.offers?[0].guests?.adults, 1);
    expect(hotelOffers2.offers?[0].hotelPrice.currency, "GBP");
    expect(hotelOffers2.offers?[0].hotelPrice.base, "780.00");
    expect(hotelOffers2.offers?[0].hotelPrice.total, "780.00");
    expect(
        hotelOffers2.offers?[0].hotelPrice.variations?.average?.base, "780.00");
    expect(
        hotelOffers2.offers?[0].hotelPrice.variations?.priceVariations?.length,
        1);
    expect(
        hotelOffers2
            .offers?[0].hotelPrice.variations?.priceVariations?[0].startDate,
        DateTime(2023, 11, 22));
    expect(
        hotelOffers2
            .offers?[0].hotelPrice.variations?.priceVariations?[0].endDate,
        DateTime(2023, 11, 23));
    expect(
        hotelOffers2
            .offers?[0].hotelPrice.variations?.priceVariations?[0].total,
        "780.00");
    expect(hotelOffers2.offers?[0].policyDetails?.paymentType.toString(),
        PaymentType.DEPOSIT.toString());
    expect(
        hotelOffers2.offers?[0].policyDetails?.cancellation?.description?.text,
        "NON-REFUNDABLE RATE");
    expect(hotelOffers2.offers?[0].policyDetails?.cancellation?.type.toString(),
        CancellationType.FULL_STAY.toString());
    expect(hotelOffers2.self,
        "https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM&adults=1&checkInDate=2023-11-22&paymentPolicy=NONE&roomQuantity=1");
    expect(hotelOffers2.available, true);
  });

  test('testing example response from the server', () {
    final MultiResponse response2 = MultiResponse.fromJson(json2);
    expect(response2, isNotNull);
    HotelOffers hotelOffers = response2.hotelOffers![0];
    expect(hotelOffers.hotel!.chainCode, 'MC');
    expect(hotelOffers.offers!.length, 42);
  });
}

final Map<String, dynamic> json2 = {
  "data": [
    {
      "type": "hotel-offers",
      "hotel": {
        "type": "hotel",
        "hotelId": "MCLONGHM",
        "chainCode": "MC",
        "dupeId": "700031300",
        "name": "JW Marriott Grosvenor House London",
        "cityCode": "LON",
        "latitude": 51.50988,
        "longitude": -0.15509
      },
      "available": true,
      "offers": [
        {
          "id": "8Y16U95HLJ",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "DELUXE_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Flexible Rate\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "705.00",
            "total": "740.25",
            "variations": {
              "average": {"base": "705.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "705.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "705.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/8Y16U95HLJ?lang=EN"
        },
        {
          "id": "JTY7YKI7SF",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "DELUXE_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Flexible Rate with Breakfast\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "725.00",
            "total": "761.25",
            "variations": {
              "average": {"base": "725.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "725.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "725.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/JTY7YKI7SF?lang=EN"
        },
        {
          "id": "H1CHGYXHD8",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate\nSuperior King Room, 1 King,\n23sqm/247sqft-35sqm/377sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "805.00",
            "total": "845.25",
            "variations": {
              "average": {"base": "805.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "805.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "805.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/H1CHGYXHD8?lang=EN"
        },
        {
          "id": "JMF7X6P3YO",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate with Breakfast\nSuperior King Room, 1 King,\n23sqm/247sqft-35sqm/377sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "825.00",
            "total": "866.25",
            "variations": {
              "average": {"base": "825.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "825.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "825.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/JMF7X6P3YO?lang=EN"
        },
        {
          "id": "QZW8TT1YLM",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 2,
              "bedType": "TWIN"
            },
            "description": {
              "text":
                  "Flexible Rate\nSuperior Twin Room, 2 Twins,\n23sqm/247sqft-35sqm/377sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "835.00",
            "total": "876.75",
            "variations": {
              "average": {"base": "835.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "835.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "835.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/QZW8TT1YLM?lang=EN"
        },
        {
          "id": "SWP5B0V70Y",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 2,
              "bedType": "TWIN"
            },
            "description": {
              "text":
                  "Flexible Rate with Breakfast\nSuperior Twin Room, 2 Twins,\n23sqm/247sqft-35sqm/377sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "855.00",
            "total": "897.75",
            "variations": {
              "average": {"base": "855.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "855.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "855.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/SWP5B0V70Y?lang=EN"
        },
        {
          "id": "KKRT8BYLEF",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "FAMILY_ROOM",
              "beds": 2,
              "bedType": "DOUBLE"
            },
            "description": {
              "text":
                  "Flexible Rate\nFamily Room, 2 Doubles,\n37sqm/398sqft-42sqm/452sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "955.00",
            "total": "1002.75",
            "variations": {
              "average": {"base": "955.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "955.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "955.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/KKRT8BYLEF?lang=EN"
        },
        {
          "id": "Q59T3A5Z21",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "FAMILY_ROOM",
              "beds": 2,
              "bedType": "DOUBLE"
            },
            "description": {
              "text":
                  "Flexible Rate with Breakfast\nFamily Room, 2 Doubles,\n37sqm/398sqft-42sqm/452sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "995.00",
            "total": "1044.75",
            "variations": {
              "average": {"base": "995.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "995.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "995.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/Q59T3A5Z21?lang=EN"
        },
        {
          "id": "GI0W65HCWJ",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "EXECUTIVE_ROOM",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate\nExecutive King Room, 1 King,\n35sqm/377sqft-40sqm/430sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1036.00",
            "total": "1087.80",
            "variations": {
              "average": {"base": "1036.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1036.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1036.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/GI0W65HCWJ?lang=EN"
        },
        {
          "id": "SX1P8L2NZU",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "DELUXE_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Flexible Rate\nDeluxe Queen Suite, 1 Queen(s),\n41sqm/441sqft-48sqm/516sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1175.00",
            "total": "1233.75",
            "variations": {
              "average": {"base": "1175.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1175.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1175.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/SX1P8L2NZU?lang=EN"
        },
        {
          "id": "WMISU3XQ9S",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate\nDeluxe King Suite, 1 King,\n45sqm/484sqft-50sqm/538sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1195.00",
            "total": "1254.75",
            "variations": {
              "average": {"base": "1195.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1195.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1195.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/WMISU3XQ9S?lang=EN"
        },
        {
          "id": "RVUKPK7TPL",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Flexible Rate\nSuperior Queen Suite, 1 Queen(s),\n41sqm/441sqft-48sqm/516sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1375.00",
            "total": "1443.75",
            "variations": {
              "average": {"base": "1375.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1375.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1375.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/RVUKPK7TPL?lang=EN"
        },
        {
          "id": "AN0RRO4W3D",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate\nSuperior King Suite, 1 King,\n48sqm/516sqft-50sqm/538sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1395.00",
            "total": "1464.75",
            "variations": {
              "average": {"base": "1395.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1395.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1395.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/AN0RRO4W3D?lang=EN"
        },
        {
          "id": "FDMGF4J3CJ",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "EXECUTIVE_SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate\nExecutive Suite, Executive Lounge Access, 1\nKing, 50sqm/538sqft-70sqm/753sqft,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1940.00",
            "total": "2037.00",
            "variations": {
              "average": {"base": "1940.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1940.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1940.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/FDMGF4J3CJ?lang=EN"
        },
        {
          "id": "LFIVWQGFTN",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate\nPark View Suite, Executive Lounge Access, 1\nKing, 67sqm/721sqft-80sqm/861sqft,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "2440.00",
            "total": "2562.00",
            "variations": {
              "average": {"base": "2440.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "2440.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "2440.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/LFIVWQGFTN?lang=EN"
        },
        {
          "id": "DULSPW8O8U",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "RAC",
          "rateFamilyEstimated": {"code": "BAR", "type": "P"},
          "room": {
            "type": "REG",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Flexible Rate\nPremium Park View Suite, Executive Lounge\nAccess, 1 King,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "2940.00",
            "total": "3087.00",
            "variations": {
              "average": {"base": "2940.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "2940.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "2940.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/DULSPW8O8U?lang=EN"
        },
        {
          "id": "VVBE20APSP",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "DELUXE_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "564.00",
            "total": "592.20",
            "variations": {
              "average": {"base": "564.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "564.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "564.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/VVBE20APSP?lang=EN"
        },
        {
          "id": "T82P8RK8FY",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nSuperior King Room, 1 King,\n23sqm/247sqft-35sqm/377sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "644.00",
            "total": "676.20",
            "variations": {
              "average": {"base": "644.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "644.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "644.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/T82P8RK8FY?lang=EN"
        },
        {
          "id": "AOWH0RRYEF",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 2,
              "bedType": "TWIN"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nSuperior Twin Room, 2 Twins,\n23sqm/247sqft-35sqm/377sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "668.00",
            "total": "701.40",
            "variations": {
              "average": {"base": "668.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "668.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "668.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/AOWH0RRYEF?lang=EN"
        },
        {
          "id": "POMM9RYBI7",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "FAMILY_ROOM",
              "beds": 2,
              "bedType": "DOUBLE"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nFamily Room, 2 Doubles,\n37sqm/398sqft-42sqm/452sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "764.00",
            "total": "802.20",
            "variations": {
              "average": {"base": "764.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "764.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "764.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/POMM9RYBI7?lang=EN"
        },
        {
          "id": "T958R5PU50",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "EXECUTIVE_ROOM",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nExecutive King Room, 1 King,\n35sqm/377sqft-40sqm/430sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "829.00",
            "total": "870.45",
            "variations": {
              "average": {"base": "829.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "829.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "829.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/T958R5PU50?lang=EN"
        },
        {
          "id": "TEHI8W87T8",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "DELUXE_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nDeluxe Queen Suite, 1 Queen(s),\n41sqm/441sqft-48sqm/516sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "940.00",
            "total": "987.00",
            "variations": {
              "average": {"base": "940.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "940.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "940.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/TEHI8W87T8?lang=EN"
        },
        {
          "id": "GXCL6QVXNN",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nDeluxe King Suite, 1 King,\n45sqm/484sqft-50sqm/538sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "956.00",
            "total": "1003.80",
            "variations": {
              "average": {"base": "956.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "956.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "956.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/GXCL6QVXNN?lang=EN"
        },
        {
          "id": "9K9R73I3ZU",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nSuperior Queen Suite, 1 Queen(s),\n41sqm/441sqft-48sqm/516sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1100.00",
            "total": "1155.00",
            "variations": {
              "average": {"base": "1100.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1100.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1100.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/9K9R73I3ZU?lang=EN"
        },
        {
          "id": "X3TK9IF4FW",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nSuperior King Suite, 1 King,\n48sqm/516sqft-50sqm/538sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1116.00",
            "total": "1171.80",
            "variations": {
              "average": {"base": "1116.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1116.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1116.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/X3TK9IF4FW?lang=EN"
        },
        {
          "id": "W5P71CZUOJ",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "EXECUTIVE_SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nExecutive Suite, Executive Lounge Access, 1\nKing, 50sqm/538sqft-70sqm/753sqft,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1552.00",
            "total": "1629.60",
            "variations": {
              "average": {"base": "1552.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1552.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1552.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/W5P71CZUOJ?lang=EN"
        },
        {
          "id": "HXFP01P8GO",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nPark View Suite, Executive Lounge Access, 1\nKing, 67sqm/721sqft-80sqm/861sqft,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1952.00",
            "total": "2049.60",
            "variations": {
              "average": {"base": "1952.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1952.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1952.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/HXFP01P8GO?lang=EN"
        },
        {
          "id": "TSH0QYSGRS",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nPremium Park View Suite, Executive Lounge\nAccess, 1 King,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "2352.00",
            "total": "2469.60",
            "variations": {
              "average": {"base": "2352.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "2352.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "2352.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/TSH0QYSGRS?lang=EN"
        },
        {
          "id": "ZWDRIPWN9X",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "S9R",
          "rateFamilyEstimated": {"code": "SRS", "type": "C"},
          "room": {
            "type": "XMI",
            "typeEstimated": {"category": "EXECUTIVE_SUITE"},
            "description": {
              "text":
                  "Marriott Senior Discount, 62 years and older valid ID required\nThe Royal Hyde Park and the Royal Mayfair\nsuites embody the prestigious location of",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "4916.00",
            "total": "5161.80",
            "variations": {
              "average": {"base": "4916.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "4916.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "4916.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/ZWDRIPWN9X?lang=EN"
        },
        {
          "id": "HAW2W66OK6",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "DELUXE_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nDeluxe Queen Suite, 1 Queen(s),\n41sqm/441sqft-48sqm/516sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1195.00",
            "total": "1254.75",
            "variations": {
              "average": {"base": "1195.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1195.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1195.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/HAW2W66OK6?lang=EN"
        },
        {
          "id": "V0TU0811TT",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nSuperior King Suite, 1 King,\n48sqm/516sqft-50sqm/538sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1415.00",
            "total": "1485.75",
            "variations": {
              "average": {"base": "1415.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1415.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1415.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/V0TU0811TT?lang=EN"
        },
        {
          "id": "HTHSMZ8M3E",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nDeluxe King Suite, 1 King,\n45sqm/484sqft-50sqm/538sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1215.00",
            "total": "1275.75",
            "variations": {
              "average": {"base": "1215.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1215.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1215.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/HTHSMZ8M3E?lang=EN"
        },
        {
          "id": "NKVSYF3SE3",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nSuperior Queen Suite, 1 Queen(s),\n41sqm/441sqft-48sqm/516sqft, Living/sitting",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1395.00",
            "total": "1464.75",
            "variations": {
              "average": {"base": "1395.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1395.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1395.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/NKVSYF3SE3?lang=EN"
        },
        {
          "id": "OLQQPIIAUO",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "EXECUTIVE_SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nExecutive Suite, Executive Lounge Access, 1\nKing, 50sqm/538sqft-70sqm/753sqft,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1960.00",
            "total": "2058.00",
            "variations": {
              "average": {"base": "1960.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1960.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1960.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/OLQQPIIAUO?lang=EN"
        },
        {
          "id": "EORY8HA9NZ",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nPark View Suite, Executive Lounge Access, 1\nKing, 67sqm/721sqft-80sqm/861sqft,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "2460.00",
            "total": "2583.00",
            "variations": {
              "average": {"base": "2460.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "2460.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "2460.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/EORY8HA9NZ?lang=EN"
        },
        {
          "id": "MV838V81I6",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nPremium Park View Suite, Executive Lounge\nAccess, 1 King,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "2960.00",
            "total": "3108.00",
            "variations": {
              "average": {"base": "2960.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "2960.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "2960.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/MV838V81I6?lang=EN"
        },
        {
          "id": "KRQRQX7FDE",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "B4K",
          "room": {
            "type": "YBK",
            "typeEstimated": {"category": "EXECUTIVE_SUITE"},
            "description": {
              "text":
                  "Stay for Breakfast rate, includes breakfast\nThe Royal Hyde Park and the Royal Mayfair\nsuites embody the prestigious location of",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "6165.00",
            "total": "6473.25",
            "variations": {
              "average": {"base": "6165.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "6165.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "6165.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/KRQRQX7FDE?lang=EN"
        },
        {
          "id": "N02VOGBUVK",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "MAJ",
          "room": {
            "type": "XXF",
            "typeEstimated": {
              "category": "FAMILY_ROOM",
              "beds": 2,
              "bedType": "DOUBLE"
            },
            "description": {
              "text":
                  "Kids Stay & Eat Free, includes kids meals, 12 and under\nFamily Room, 2 Doubles,\n37sqm/398sqft-42sqm/452sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1005.00",
            "total": "1055.25",
            "variations": {
              "average": {"base": "1005.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1005.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1005.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/N02VOGBUVK?lang=EN"
        },
        {
          "id": "1MJU3F9I84",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "MAJ",
          "room": {
            "type": "XXF",
            "typeEstimated": {
              "category": "SUPERIOR_ROOM",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Kids Stay & Eat Free, includes kids meals, 12 and under\nSuperior King Room, 1 King,\n23sqm/247sqft-35sqm/377sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "835.00",
            "total": "876.75",
            "variations": {
              "average": {"base": "835.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "835.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "835.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/1MJU3F9I84?lang=EN"
        },
        {
          "id": "Q3XBM1RD4O",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "MAJ",
          "room": {
            "type": "XXF",
            "typeEstimated": {
              "category": "EXECUTIVE_ROOM",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Kids Stay & Eat Free, includes kids meals, 12 and under\nExecutive King Room, 1 King,\n35sqm/377sqft-40sqm/430sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1056.00",
            "total": "1108.80",
            "variations": {
              "average": {"base": "1056.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1056.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1056.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/Q3XBM1RD4O?lang=EN"
        },
        {
          "id": "TQ85MS8W1A",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "MAJ",
          "room": {
            "type": "XXF",
            "typeEstimated": {
              "category": "SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Kids Stay & Eat Free, includes kids meals, 12 and under\nDeluxe King Suite, 1 King,\n45sqm/484sqft-50sqm/538sqft, Wireless",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1225.00",
            "total": "1286.25",
            "variations": {
              "average": {"base": "1225.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1225.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1225.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/TQ85MS8W1A?lang=EN"
        },
        {
          "id": "PFJH1F6RT5",
          "checkInDate": "2023-11-28",
          "checkOutDate": "2023-11-29",
          "rateCode": "MAJ",
          "room": {
            "type": "XXF",
            "typeEstimated": {
              "category": "EXECUTIVE_SUITE",
              "beds": 1,
              "bedType": "KING"
            },
            "description": {
              "text":
                  "Kids Stay & Eat Free, includes kids meals, 12 and under\nExecutive Suite, Executive Lounge Access, 1\nKing, 50sqm/538sqft-70sqm/753sqft,",
              "lang": "EN"
            }
          },
          "guests": {"adults": 1},
          "price": {
            "currency": "GBP",
            "base": "1960.00",
            "total": "2058.00",
            "variations": {
              "average": {"base": "1960.00"},
              "changes": [
                {
                  "startDate": "2023-11-28",
                  "endDate": "2023-11-29",
                  "base": "1960.00"
                }
              ]
            }
          },
          "policies": {
            "cancellations": [
              {"amount": "1960.00", "deadline": "2023-11-27T23:59:00+00:00"}
            ]
          },
          "self":
              "https://test.api.amadeus.com/v3/shopping/hotel-offers/PFJH1F6RT5?lang=EN"
        }
      ],
      "self":
          "https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM&adults=1&boardType=ROOM_ONLY&checkInDate=2023-11-28&checkOutDate=2023-11-29&countryOfResidence=US&lang=EN&paymentPolicy=NONE&roomQuantity=1"
    }
  ]
};
