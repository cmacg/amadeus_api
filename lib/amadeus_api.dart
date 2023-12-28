library amadeusapi;

// Client exports
export 'src/clients/flights/amadeus_flights_client.dart'
    show AmadeusFlightsClient;
export 'src/clients/hotels/amadeus_hotels_client.dart' show AmadeusHotelsClient;

// Error handling exports
export 'src/client_exception.dart' show AmadeusClientHttpException;
export 'src/models/errors.dart' show Errors;
export 'src/models/error.dart' show Error;

// Hotel exports
export 'src/models/hotels/booking/v1/hotel_booked_response.dart'
    show HotelBookedResponse;
export 'src/models/hotels/booking/v1/hotel_booking_query.dart'
    show HotelBookingQuery;
export 'src/models/hotels/search/v1/hotels_search_response.dart'
    show HotelsSearchResponse;
export 'src/models/hotels/offers/v3/hotel_offers.dart' show HotelOffers;
export 'src/models/hotels/offers/v3/hotel_offer.dart' show HotelOffer;

// Flight exports
export 'src/models/flights/locations/v1/location.dart' show Location;
export 'src/models/flights/offers/v2/flight_offer.dart' show FlightOffer;
export 'src/models/flights/status/v2/flight_status.dart' show FlightStatus;
