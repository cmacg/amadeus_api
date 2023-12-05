# Hotel Client Usage Guide
This guide will direct you on how to create your hotel client and execute a hotel search, review offers from the hotel and book a room.  

The first step is the creation of the ``AmadeusHotelsClient``.

```dart
    final AmadeusHotelsClient hotelClient = AmadeusHotelsClient(
      apiKey: Credentials.API_KEY,
      apiSecret: Credentials.API_SECRET,
      test: true);
```

## Hotel Search

### Hotel Search by City Code

```dart
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
```

### Hotel Search by Geo Code

```dart
    try {
        HotelsSearchResponse geoCodeSearchResponse =
            await hotelClient.searchHotelsByGeoCode(
                latitude: 37.791552,
                longitude: -122.4320108,
                radius: 5,
                radiusUnit: DistanceUnit.KILOMETERS);   
    } on AmadeusClientHttpException catch (e) {
        print('Exception occurred when trying to call search hotels: $e');
        // handle the exception/errors
    }
```

## Hotel Offers

This library uses the thrid version (v3) of the Amadeus hotel offers API.  v2 has been deprecated and v3 is the most current version as of writing this documentation.

### Get multiple offers from multiple hotels
```dart
    var ids = ['MCLONGHM', 'MCMARCOI'];
    DateTime now = DateTime.now();
    try {
        MultiResponse multiResponse = await hotelClient.getMultiHotelOffers(
            hotelIds: ids,
            checkInDate: DateTime(now.year, now.month, now.day + 1),
            checkOutDate: DateTime(now.year, now.month, now.day + 2),
            countryOfResidence: 'US',
            adults: 1,
            includeClosed: false,
            bestRateOnly: false);
  } on AmadeusClientHttpException catch (e) {
    print('Exception occurred when trying to call getMultiHotelOffers: $e');
    // handle the exception/errors
  }
```

## Hotel Booking

## Other References

For more implementation details on executing a hotels search, finding offers and booking rooms see the [amadeus_hotels_client_test.dart](./test/clients/hotels/hotels_client_test.dart) unit test.  

For futher API information, the [Amadeus for Developers: Hotels Self-Service](https://developers.amadeus.com/self-service/category/hotels) page documents the conventions of the APIs and underlying API documentation.  