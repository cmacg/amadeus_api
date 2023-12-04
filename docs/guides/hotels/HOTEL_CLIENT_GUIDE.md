# Hotel Client Usage Guide
This guide will direct you on how to create your hotel client and execute a hotel search, review offers from the hotel and book a room.  

The first step is the creation of the ``AmadeusHotelsClient``.

``
    final AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);
``

## Hotel Search

### Hotel Search by City Code

``
    try {
        HotelsSearchResponse citySearchResponse =
            await hotelClient.searchHotelsByCityCode(
                cityCode: 'PAR', 
                radius: 5, 
                radiusUnit: DistanceUnit.KILOMETERS);
    } on AmadeusClientHttpException catch (e) {
        print('Exception occurred when trying to call search hotels: $e');
        // handle the exception/errors
    }
``

### Hotel Search by Geo Code

## Hotel Offers

## Hotel Booking

## Other References

For more implementation details on executing a hotels search, finding offers and booking rooms see the [amadeus_hotels_client_test.dart](./test/clients/hotels/amadeus_hotels_client_test.dart) unit test.  

For futher API information, the [Amadeus for Developers: Hotels Self-Service](https://developers.amadeus.com/self-service/category/hotels) page documents the conventions of the APIs and underlying API documentation.  