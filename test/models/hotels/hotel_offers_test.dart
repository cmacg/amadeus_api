import 'package:amadeusapi/models/hotels/hotel_distance.dart';
import 'package:amadeusapi/models/hotels/hotel_offers.dart';
import 'package:amadeusapi/models/hotels/media.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deserialize response', () {
    Map<String, dynamic> json = {
      "data": [
        {
          "type": "hotel-offers",
          "hotel": {
            "type": "hotel",
            "hotelId": "WWPARVLP",
            "chainCode": "WW",
            "dupeId": "700018106",
            "name": "VILLA PANTHEON",
            "rating": "4",
            "cityCode": "PAR",
            "latitude": 48.84917,
            "longitude": 2.34615,
            "hotelDistance": {"distance": 0.6, "distanceUnit": "KM"},
            "address": {
              "lines": ["41, RUE DES ECOLES"],
              "postalCode": "75005",
              "cityName": "PARIS",
              "countryCode": "FR"
            },
            "contact": {"phone": "33-1-53109595", "fax": "33-1-53109596"},
            "description": {
              "lang": "en",
              "text":
                  "The Villa PanthÃ©on Paris is one of the Latin Quarter's top hotels. Paris' centre has a romantic charm, and the Saint Germain district on the left bank of the Seine is one of the most evocative areas of the capital. The district offers the cultural delights of Le Sorbonne, Notre-Dame, and Ile Saint-Louis.\r\r\rGuests to the Villa PanthÃ©on Paris can relax in the great traditions of the English club atmosphere where the copper glow of the bar mixes with the warm leather of the club lounges. The Villa PanthÃ©on Paris is part of the Worldhotels First Class Collection.\r\r\rThe intimate details of the Villa PanthÃ©on's 59 rooms and 2 suites form a relaxing haven for guests. Exotic wood floors, leather armchairs, and thick cloth drapes create a luxurious atmosphere. Modern amenities and room service breakfast and lunch are available.\r\r\rIf you are looking at the top hotels Paris' centre can offer, why not look at our rates and availability for the Villa PanthÃ©on Paris?"
            },
            "amenities": [
              "MEETING_ROOMS",
              "RESTAURANT",
              "DISABLED_FACILITIES",
              "ACC_ELEVATORS",
              "ACC_RM_WCHAIR",
              "ACC_WCHAIR",
              "BABY-SITTING",
              "KIDS_WELCOME",
              "ELEVATOR",
              "INT_HOTSPOTS",
              "WIFI",
              "LAUNDRY_SVC",
              "MASSAGE",
              "PETS_ALLOWED",
              "AIR_CONDITIONING",
              "HAIR_DRYER",
              "MINIBAR",
              "MOVIE_CHANNELS",
              "NONSMOKING_RMS",
              "PC_HOOKUP_INRM",
              "PHONE-DIR_DIAL",
              "ROOM_SERVICE",
              "TELEVISION",
              "FIRST_AID_STAF",
              "INT_ROOM_ENTRY",
              "EMERG_LIGHTING",
              "FIRE_DETECTORS",
              "EXTINGUISHERS",
              "FIRE_SAFETY",
              "SMOKE_DETECTOR",
              "SPRINKLERS",
              "VIDEO_SURVEIL",
              "FITNESS_CENTER"
            ],
            "media": [
              {
                "uri":
                    "http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/2A8259BD94CD45C1801F4220B696E3A9",
                "category": "EXTERIOR"
              }
            ]
          },
          "available": true,
          "offers": [
            {
              "id": "N3NY729XL6",
              "checkInDate": "2020-05-02",
              "checkOutDate": "2020-05-03",
              "rateCode": "PK3",
              "rateFamilyEstimated": {"code": "PKG", "type": "P"},
              "commission": {"percentage": "10.00"},
              "room": {
                "type": "A1K",
                "typeEstimated": {
                  "category": "DELUXE_ROOM",
                  "beds": 1,
                  "bedType": "KING"
                },
                "description": {
                  "lang": "EN",
                  "text":
                      "RATE TAX INCLUSIVE-PKG TAX INCLUSIVE \nDeluxe-mini bar-jacuzzi-marble tile-balcony-upgraded amenities-\nsitting area"
                }
              },
              "guests": {"adults": 1},
              "price": {
                "currency": "USD",
                "base": "120.00",
                "total": "130.00",
                "variations": {
                  "average": {"base": "120.00"},
                  "changes": [
                    {
                      "startDate": "2020-05-02",
                      "endDate": "2020-05-03",
                      "base": "120.00"
                    }
                  ]
                }
              },
              "policies": {
                "guarantee": {
                  "acceptedPayments": {
                    "creditCards": ["VI", "CA", "AX"],
                    "methods": ["CREDIT_CARD"]
                  }
                },
                "paymentType": "guarantee",
                "cancellation": {
                  "numberOfNights": 1,
                  "deadline": "2020-04-30T23:00:00+02:00"
                }
              }
            }
          ],
          "self":
              "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=WWPARVLP&adults=1&paymentPolicy=NONE&view=FULL"
        },
        {
          "type": "hotel-offers",
          "hotel": {
            "type": "hotel",
            "hotelId": "WVPARVIO",
            "chainCode": "WV",
            "dupeId": "700092014",
            "name": "HOTEL LOUVRE RIVOLI",
            "rating": "3",
            "cityCode": "PAR",
            "latitude": 48.85847,
            "longitude": 2.34645,
            "hotelDistance": {"distance": 0.5, "distanceUnit": "KM"},
            "address": {
              "lines": ["7, RUE JEAN-LANTIER"],
              "postalCode": "75001",
              "cityName": "PARIS",
              "countryCode": "FR"
            },
            "contact": {"fax": "33-140-280356", "phone": "33-142-334538"},
            "description": {
              "lang": "en",
              "text":
                  "Enterely renovated from march 2007 to january 2008, Hotel Louvre Rivoli has now 20 Superior rooms (totally remade in 2007) and 10 Classic rooms (remade in 2006). The hotel with its perfect situation invites you to a trip to history (based in the heart of Paris), art and culture (5 miutes walking distance from the Louvre, Notre Dame, Sainte Chapelle, Pompidou center, Shopping center). A large vaulted natural stone cellar, offers you a journey all over the years. \r\r\r\rA friendly and helpful staff promises you a warm hospitality. To relax a spacious lounge with private bar is at your disposal, and a carry luggage. A fitness room will be ready for april 2008.\r\r\r\rAll the 30 rooms have air conditionning, direct telephone, cable TV and satellite with CNN & BBC, safe box, mini bar, internet access, WI-FI technology, bathroom full equipped with hairdryer, bath tub or large shower, toilets, free news papers."
            },
            "amenities": [
              "DISABLED_FACILITIES",
              "ADAPT_RM_DOORS",
              "INT_HOTSPOTS",
              "NO_PORN_FILMS",
              "HAIR_DRYER",
              "MINIBAR",
              "NONSMOKING_RMS",
              "PHONE-DIR_DIAL",
              "TELEVISION",
              "WI-FI_IN_ROOM",
              "FIRE_SAFETY"
            ],
            "media": [
              {
                "uri":
                    "http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/6B4EC6DEAFF04FC8B5D89025BCCB0E35",
                "category": "LOBBY"
              }
            ]
          },
          "available": true,
          "offers": [
            {
              "id": "CA50JLAW03",
              "checkInDate": "2020-05-02",
              "checkOutDate": "2020-05-03",
              "rateCode": "TVL",
              "rateFamilyEstimated": {"code": "TVL", "type": "C"},
              "commission": {"amount": "0", "percentage": "0"},
              "room": {
                "type": "D1*",
                "typeEstimated": {
                  "category": "SUPERIOR_ROOM",
                  "beds": 1,
                  "bedType": "SINGLE"
                },
                "description": {
                  "lang": "EN",
                  "text":
                      "SPECIAL TRAVEL AGENT RATE\nSINGLE SUPERIOR LARGE BED FREE WIFI SAFETY BOX\nSPECIAL TRAVEL AGENT RATE 10 PCT OFF BAR"
                }
              },
              "guests": {"adults": 1},
              "price": {
                "currency": "EUR",
                "base": "147.35",
                "total": "149.00",
                "variations": {
                  "average": {"base": "147.35"},
                  "changes": [
                    {
                      "startDate": "2020-05-02",
                      "endDate": "2020-05-03",
                      "base": "147.35"
                    }
                  ]
                }
              },
              "policies": {
                "guarantee": {
                  "acceptedPayments": {
                    "creditCards": ["VI", "AX", "MC", "JC", "DC"],
                    "methods": ["CREDIT_CARD"]
                  }
                },
                "paymentType": "guarantee",
                "cancellation": {"deadline": "2020-04-30T16:00:00+02:00"}
              }
            }
          ],
          "self":
              "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=WVPARVIO&adults=1&paymentPolicy=NONE&view=FULL"
        },
        {
          "type": "hotel-offers",
          "hotel": {
            "type": "hotel",
            "hotelId": "HIPARC12",
            "chainCode": "HI",
            "dupeId": "700132326",
            "name": "HOLIDAY INN PARIS-NOTRE DAME123",
            "rating": "2",
            "cityCode": "PAR",
            "latitude": 48.85254,
            "longitude": 2.34198,
            "hotelDistance": {"distance": 0.3, "distanceUnit": "KM"},
            "address": {
              "lines": ["4 RUE DANTON"],
              "postalCode": "75006",
              "cityName": "PARIS",
              "countryCode": "FR"
            },
            "contact": {"phone": "+33 1 81690060", "fax": "+33 1 81690061"},
            "description": {
              "lang": "en",
              "text":
                  "This boutique style eco hotel is in the heart of Paris 5 minutes walk from Notre Dame Cathedral and a short stroll from the Louvre museum. Regular RER trains run to Paris Charles de Gaulle Airport and Paris Orly Airport in 30 minutes. It is a 5 minute walk to Saint Michel Notre Dame Metro station for links to company offices on Avenue de France and events at Paris Nord Villepinte Exhibition and Convention Centre. There are 3 air conditioned meeting rooms with wireless Internet which can accommodate up to 55 of your colleagues. You can round off your meeting with cocktails on the roof terrace with panoramic views of Paris. Internet is available 24 hours a day on the 2 computers in the Lobby and there is high speed Internet in all Guest rooms."
            },
            "amenities": [
              "24_HOUR_FRONT_DESK",
              "24_HOUR_ROOM_SERVICE",
              "ATM/CASH_MACHINE",
              "CONFERENCE_FACILITIES",
              "EXCHANGE_FAC",
              "EXPRESS_CHECK_IN",
              "EXPRESS_CHECK_OUT",
              "ACC_WCHAIR",
              "ACC_ELEVATORS",
              "ACC_RM_WCHAIR",
              "GARAGE_PARKING",
              "LAUNDRY_SVC",
              "RESTAURANT",
              "SAFE_DEP_BOX",
              "WIRELESS_CONNECTIVITY",
              "FEMA_FIRE_SAFETY_COMPLIANT",
              "PHOTOCOPIER",
              "PRINTER",
              "AUDIO-VIS_EQT",
              "BUSINESS_CENTER",
              "COMPUTER_RENTAL",
              "LCD/PROJECTOR",
              "CONFERENCE_SUITE",
              "CONVENTION_CTR",
              "MEETING_FACILITIES",
              "FIRE_SAFETY",
              "EMERG_LIGHTING",
              "FIRE_DETECTORS",
              "SPRINKLERS",
              "FIRST_AID_STAF",
              "SECURITY_GUARD",
              "VIDEO_SURVEIL",
              "EXTINGUISHERS",
              "FEMA_FIRE_SAFETY_COMPLIANT"
            ],
            "media": [
              {
                "uri":
                    "http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/39A9137DCEC149B59898A0598BE2C76A",
                "category": "EXTERIOR"
              }
            ]
          },
          "available": true,
          "offers": [
            {
              "id": "1C48CSDYWA",
              "checkInDate": "2020-05-02",
              "checkOutDate": "2020-05-03",
              "rateCode": "22A",
              "rateFamilyEstimated": {"code": "BAR", "type": "P"},
              "room": {
                "type": "*1Q",
                "typeEstimated": {
                  "category": "STANDARD_ROOM",
                  "beds": 1,
                  "bedType": "QUEEN"
                },
                "description": {
                  "lang": "EN",
                  "text":
                      "BEST FLEXIBLE RATE\n1 QUEEN BED LEISURE NONSMOKING RELAX IN A\nCONTEMPORARY DESIGNED ROOM THANKS TO OUR ON"
                }
              },
              "guests": {"adults": 1},
              "price": {
                "currency": "EUR",
                "base": "159.00",
                "total": "161.88",
                "variations": {
                  "average": {"base": "159.00"},
                  "changes": [
                    {
                      "startDate": "2020-05-02",
                      "endDate": "2020-05-03",
                      "base": "159.00"
                    }
                  ]
                }
              },
              "policies": {
                "guarantee": {
                  "acceptedPayments": {
                    "creditCards": ["AX", "VI", "CA"],
                    "methods": ["CREDIT_CARD"]
                  }
                },
                "paymentType": "guarantee",
                "cancellation": {
                  "numberOfNights": 1,
                  "deadline": "2020-05-02T16:00:00+02:00"
                }
              }
            }
          ],
          "self":
              "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=HIPARC12&adults=1&paymentPolicy=NONE&view=FULL"
        },
        {
          "type": "hotel-offers",
          "hotel": {
            "type": "hotel",
            "hotelId": "BWPAR196",
            "chainCode": "BW",
            "dupeId": "700045082",
            "name": "BEST WESTERN JARDIN DE CLUNY",
            "rating": "3",
            "cityCode": "PAR",
            "latitude": 48.84985000000001,
            "longitude": 2.34699,
            "hotelDistance": {"distance": 0.5, "distanceUnit": "KM"},
            "address": {
              "lines": ["9 RUE DE SOMMERARD"],
              "postalCode": "FR75005",
              "cityName": "PARIS",
              "countryCode": "FR"
            },
            "contact": {"fax": "33-1-40510336", "phone": "33-1-43542266"},
            "description": {
              "lang": "en",
              "text":
                  "The best western le jardin de cluny, in a very quiet street between notre-dame and sorbonne, offers access to refinement and comfort. A small garden and vaulted breakfast room will delight you. A pleasant team is waiting to give you a warm welcome."
            },
            "amenities": [
              "ICE_MACHINES",
              "BABY-SITTING",
              "KIDS_WELCOME",
              "ELEVATOR",
              "FREE_INTERNET",
              "WIFI",
              "LOUNGE",
              "AIR_CONDITIONING",
              "HAIR_DRYER",
              "MINIBAR",
              "NONSMOKING_RMS",
              "TELEVISION",
              "WI-FI_IN_ROOM",
              "FIRST_AID_STAF",
              "INT_ROOM_ENTRY",
              "EMERG_LIGHTING",
              "EXTINGUISHERS",
              "SAFE_DEP_BOX",
              "SMOKE_DETECTOR",
              "SPRINKLERS",
              "VIDEO_SURVEIL"
            ],
            "media": [
              {
                "uri":
                    "http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/9D2A5C177D244359AC1B67C85725D37D",
                "category": "EXTERIOR"
              }
            ]
          },
          "available": true,
          "offers": [
            {
              "id": "T7WGZH6YAQ",
              "checkInDate": "2020-05-02",
              "checkOutDate": "2020-05-03",
              "rateCode": "RAC",
              "rateFamilyEstimated": {"code": "BAR", "type": "P"},
              "commission": {"percentage": "10"},
              "room": {
                "type": "A1D",
                "typeEstimated": {
                  "category": "STANDARD_ROOM",
                  "beds": 1,
                  "bedType": "DOUBLE"
                },
                "description": {
                  "lang": "EN",
                  "text":
                      "FLEXIBLE RATE*BEST LEAST RESTRICTIVE RATE\n1 DOUBLE BED,NSMK,CLASSIC"
                }
              },
              "guests": {"adults": 1},
              "price": {
                "currency": "EUR",
                "base": "250.00",
                "total": "252.53",
                "variations": {
                  "average": {"base": "250.00"},
                  "changes": [
                    {
                      "startDate": "2020-05-02",
                      "endDate": "2020-05-03",
                      "base": "250.00"
                    }
                  ]
                }
              },
              "policies": {
                "paymentType": "guarantee",
                "cancellation": {"deadline": "2020-04-30T12:00:00+02:00"}
              }
            }
          ],
          "self":
              "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=BWPAR196&adults=1&paymentPolicy=NONE&view=FULL"
        }
      ],
      "meta": {
        "links": {
          "next":
              "https://test.api.amadeus.com/v2/shopping/hotel-offers?adults=1&bestRateOnly=true&cityCode=PAR&includeClosed=false&paymentPolicy=NONE&radius=5&radiusUnit=KM&sort=PRICE&view=FULL&page[offset]=EW24TAZ52BFP_100"
        }
      }
    };

    List<HotelOffers> offers = (json['data'] as List).map((i) => HotelOffers.fromJson(i)).toList();
    expect(offers, isNotNull);
    expect(offers.length, 4);
    expect(offers[0].type, 'hotel-offers');
    expect(offers[0].available, isTrue);
    expect(offers[0].self, isNotNull);
    expect(offers[0].hotel, isNotNull);
    expect(offers[0].hotel.type, 'hotel');
    expect(offers[0].hotel.id, 'WWPARVLP');
    expect(offers[0].hotel.chainCode, 'WW');
    expect(offers[0].hotel.dupeId, '700018106');
    expect(offers[0].hotel.name, 'VILLA PANTHEON');
    expect(offers[0].hotel.rating, 4.0);
    expect(offers[0].hotel.description, isNotNull);
    expect(offers[0].hotel.description.lang, 'en');
    expect(offers[0].hotel.description.text, isNotNull);
    expect(offers[0].hotel.cityCode, 'PAR');
    expect(offers[0].hotel.latitude, 48.84917);
    expect(offers[0].hotel.longitude, 2.34615);
    expect(offers[0].hotel.hotelDistance, isNotNull);
    expect(offers[0].hotel.hotelDistance.distance, 0.6);
    expect(offers[0].hotel.hotelDistance.distanceUnit, DistanceUnit.KM);
    expect(offers[0].hotel.address, isNotNull);
    expect(offers[0].hotel.address.lines, isNotNull);
    expect(offers[0].hotel.address.lines[0], '41, RUE DES ECOLES');
    expect(offers[0].hotel.address.postalCode, '75005');
    expect(offers[0].hotel.address.cityName, 'PARIS');
    expect(offers[0].hotel.address.countryCode, 'FR');
    expect(offers[0].hotel.contact, isNotNull);
    expect(offers[0].hotel.contact.phone, '33-1-53109595');
    expect(offers[0].hotel.contact.fax, '33-1-53109596');
    expect(offers[0].hotel.contact.email, isNull);
    expect(offers[0].hotel.amenities, isNotNull);
    expect(offers[0].hotel.amenities.length, 33);
    expect(offers[0].hotel.amenities[0], 'MEETING_ROOMS');
    expect(offers[0].hotel.media, isNotNull);
    expect(offers[0].hotel.media.length, 1);
    expect(offers[0].hotel.media[0].uri, 'http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/2A8259BD94CD45C1801F4220B696E3A9');
    expect(offers[0].hotel.media[0].category, MediaCategory.EXTERIOR);
    expect(offers[0].offers, isNotNull);
    expect(offers[0].offers.length, 1);
    expect(offers[0].offers[0].id, 'N3NY729XL6');

  });
}
