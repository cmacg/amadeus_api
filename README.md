# Amadeus Dart SDK

Dart package for interacting with the Amadeus Travel API. 

[Amadeus Developers Portal](https://developers.amadeus.com/)

## Introduction

This project is to provide a library for accessing the Amadeus self service travel APIs.  While the request and response structures of the Amadeus APIs are JSON, queries and responses are long and usually non-trivial.  

This project is inteded to help the developer by providing a simplified client and models for working with these APIs.  This project also intends to provide validation of data before requests are executed and after responses are returned to help the developer better manage the number of requests sent to the API, and easier error handling when necessary.

This project also intends to provide help for the developer through the inconsistencies found in the documentation, and the conventions that may not work with the dart language.

## Summary of Features
* Hotel
    * Hotel Search - Initial commit Dec 2023
    * Hotel Reservation - Initial commit Dec 2023
    * Hotel Ratings - **Coming Soon**
* Flight
    * Flight Inspiration Search - **Coming Soon**
    * Flight Low Fare Search - **Coming Soon**
    * Flight Cheapest Date Search - **Coming Soon**
    * Flight Offers Price - **Coming Soon**
    * Flight Offers Search - **Coming Soon**
    * Seat Maps - **Coming Soon**
    * Flight Order Management - **Coming Soon**
    * Flight Reservations - **Coming Soon**
    * Airport On-Time Performance - **Coming Soon**
    * Flight Check-in Links - **Coming Soon**
    * Airline Code Lookup - **Coming Soon**
* Destination
    * Popints of Interest **Coming Soon**


## Getting Started

### Amadeus Self Service APIs
Follow the documentation for getting started on [Amadeus for Developers](https://developers.amadeus.com/get-started/get-started-with-self-service-apis-335).  This will walk you through how to create a self-service account and the issuance of your API and API_SECRET keys.

**WARNING:** Never commit or share your API or API_SECRET keys.  This is a public, open-source project and committing these values will be visible to other people.  Any pull request containing these values will be rejected.  

### Environment Setup
After checking out the code from github, you will need to create a ./lib/credential.dart file.  This file will contain your unique API and API_SECRET keys.

`` 
    class Credentials {
        static const String API_KEY = 'YOUR API KEY GOES HERE';
        static const String API_SECRET = 'YOUR API SECRET GOES HERE';
    }
``        

## Client Usage and Examples

All clients should be initialize using your API and API_SECRET as defined in your Credentials class (see **Environment Setup** above).  Likewise, every client takes in an options ``test`` parameter.  By default, this value is set to ``false``. 

For examples on how to create and use the available clients, refer to the usage documents below:
* [Hotel Client Usage Guide](./docs/guides/hotels/HOTEL_CLIENT_GUIDE.md)
* Flight Client Usage Guide - TBD
* Destinations Client Usage Guide - TBD


## Contributing
[See CONTRIBUTING.md](./docs/CONTRIBUTING.md)

## Security
[See Security.md](./docs/SECURITY.md)


