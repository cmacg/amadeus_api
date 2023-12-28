import 'address.dart';

/// Details of the hotel.
class Hotel {
  final String type = 'hotel';

  /// The unique identifier of the hotel. Amadeus Property Code (8 chars).
  /// example: ADPAR001
  /// pattern: ^[A-Z0-9]{8}$
  final String hotelId;

  /// Brand (RT...) or Merchant (AD...) (Amadeus 2 chars Code).
  /// example: AD
  /// pattern: ^[A-Z]{2}$
  final String? chainCode;

  /// Brand (RT...) (Amadeus 2 chars Code). Small Properties distributed by
  /// Merchants may not have a Brand.
  ///
  /// Example - AD (Value Hotels) is the Provider/Merchant, and RT (Accor) is
  /// the Brand of the Property
  final String? brandCode;

  /// Unique Property identifier of the physical hotel.  One physical hotel can
  /// be represented by different Providers, each one having its own hotelID.
  /// This attribute allows a client application to group together hotels that
  /// are actually the same.
  final String? dupeId;

  /// Hotel Name.
  /// example: Hotel de Paris
  final String name;

  /// Address of the hotel.
  final Address? address;

  /// Warning: The IATA city code associated to the hotel (not necessary the
  /// real Hotel City)
  final String cityCode;

  /// Latitude of the hotel.
  final double? latitude;

  /// Longitude of the hotel.
  final double? longitude;

  Hotel({
    required this.hotelId,
    this.chainCode,
    this.brandCode,
    this.dupeId,
    required this.name,
    required this.address,
    required this.cityCode,
    this.latitude,
    this.longitude,
  });

  Hotel.fromJson(Map<String, dynamic> json)
      : hotelId = json['hotelId'],
        chainCode = json['chainCode'],
        brandCode = json['brandCode'],
        dupeId = json['dupeId'],
        name = json['name'],
        address = (json['address']) == null
            ? null
            : Address.fromJson(json['address']),
        cityCode = json['cityCode'],
        latitude = json['latitude']?.toDouble(),
        longitude = json['longitude']?.toDouble();
}
