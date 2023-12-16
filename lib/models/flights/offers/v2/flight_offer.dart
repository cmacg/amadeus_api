import 'package:amadeusapi/models/flights/offers/v2/itineraries.dart';
import 'package:amadeusapi/models/flights/offers/v2/price.dart';
import 'package:amadeusapi/models/flights/offers/v2/pricing_options.dart';
import 'package:amadeusapi/models/flights/offers/v2/traveler_pricing.dart';

class FlightOffer {
  /// the resource name
  final String type;

  /// Id of the flight offer
  final String id;

  /// Source of the flight offer
  final String? source;

  /// If true, inform that a ticketing will be required at booking step.
  final bool? instantTicketRequired;

  /// BOOK step ONLY - If true, allows to book a PNR without pricing. Only for
  /// the source "GDS"
  final bool? disablePricing;

  /// If true, upon completion of the booking, this pricing solution is expected
  /// to yield multiple records (a record contains booking information confirmed
  /// and stored, typically a Passenger Name Record (PNR), in the provider GDS
  /// or system)
  final bool? nonHomogeneous;

  /// If true, the flight offer can be combined with other oneWays flight-offers
  /// to complete the whole journey (one-Way combinable feature).
  final bool? oneWay;

  /// If true, a payment card is mandatory to book this flight offer
  final bool? paymentCardRequired;

  /// If booked on the same day as the search (with respect to timezone), this
  /// flight offer is guaranteed to be thereafter valid for ticketing until this
  /// date (included). Unspecified when it does not make sense for this flight
  /// offer (e.g. no control over ticketing once booked). YYYY-MM-DD format,
  /// e.g. 2019-06-07
  final String? lastTicketingDate;

  /// If booked on the same day as the search (with respect to timezone), this
  /// flight offer is guaranteed to be thereafter valid for ticketing until this
  /// date/time (included). Unspecified when it does not make sense for this
  /// flight offer (e.g. no control over ticketing once booked). Information
  /// only this attribute is not used in input of pricing request. Local date
  /// and time in YYYY-MM-ddThh:mm:ss format, e.g. 2017-02-10T20:40:00
  final DateTime? lastTicketingDateTime;

  /// Number of seats bookable in a single request. Can not be higher than 9.
  final int? numberOfBookableSeats;

  /// List of itineraries that make up this flight offer.
  final List<Itineraries>? itineraries;

  /// Price information
  final Price? price;

  /// Pricing options for this flight offer.
  final PricingOptions? pricingOptions;

  /// This option ensures that the system will only consider offers with these
  /// airlines as validating carrier.
  final List<String>? validatingAirlineCodes;

  /// Fare information for each traveler/segment
  final List<TravelerPricing>? travelerPricings;

  FlightOffer(
      {required this.type,
      required this.id,
      this.source,
      this.instantTicketRequired,
      this.disablePricing,
      this.nonHomogeneous,
      this.oneWay,
      this.paymentCardRequired,
      this.lastTicketingDate,
      this.lastTicketingDateTime,
      this.numberOfBookableSeats,
      this.itineraries,
      this.price,
      this.pricingOptions,
      this.validatingAirlineCodes,
      this.travelerPricings});

  FlightOffer.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        source = json['source'],
        instantTicketRequired = json['instantTicketRequired'],
        disablePricing = json['disablePricing'],
        nonHomogeneous = json['nonHomogeneous'],
        oneWay = json['oneWay'],
        paymentCardRequired = json['paymentCardRequired'],
        lastTicketingDate = json['lastTicketingDate'],
        lastTicketingDateTime = DateTime.parse(json['lastTicketingDateTime']),
        numberOfBookableSeats = json['numberOfBookableSeats'],
        itineraries = json['itineraries'] == null
            ? null
            : (json['itineraries'] as List)
                .map((i) => Itineraries.fromJson(i))
                .toList(),
        price = json['price'] == null ? null : Price.fromJson(json['price']),
        pricingOptions = json['pricingOptions'] == null
            ? null
            : PricingOptions.fromJson(json['pricingOptions']),
        validatingAirlineCodes =
            List<String>.from(json['validatingAirlineCodes'] as List),
        travelerPricings = json['travelerPricings'] == null
            ? null
            : (json['travelerPricings'] as List)
                .map((e) => TravelerPricing.fromJson(e))
                .toList();
}
