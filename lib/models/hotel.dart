import 'package:amadeusapi/models/address.dart';
import 'package:amadeusapi/models/contact.dart';
import 'package:amadeusapi/models/description.dart';
import 'package:amadeusapi/models/hotel_distance.dart';
import 'package:amadeusapi/models/media.dart';
import 'package:amadeusapi/models/offer.dart';

class Hotel {
  final String type;
  final String id;
  final String chainCode;
  final String brandCode;
  final String dupeId;
  final String name;
  final double rating;
  final Description description;
  final String cityCode;
  final double latitude;
  final double longitude;
  final HotelDistance hotelDistance;
  final Address address;
  final Contact contact;
  final List<String> amenities;
  final List<Media> media;
  final List<Offer> offers;

  Hotel(
      this.type,
      this.id,
      this.chainCode,
      this.brandCode,
      this.dupeId,
      this.name,
      this.rating,
      this.description,
      this.cityCode,
      this.latitude,
      this.longitude,
      this.hotelDistance,
      this.address,
      this.contact,
      this.amenities,
      this.media,
      this.offers);

  Hotel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        chainCode = json['chainCode'],
        brandCode = json['brandCode'],
        dupeId = json['dupeId'],
        name = json['name'],
        rating = json['rating'],
        description = json['description'] == null
            ? null
            : Description.fromJson(json['description']),
        cityCode = json['cityCode'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        hotelDistance = json['hotelDistance'] == null
            ? null
            : HotelDistance.fromJson(json['hotelDistance']),
        address =
            json['address'] == null ? null : Address.fromJson(json['address']),
        contact =
            json['contact'] == null ? null : Contact.fromJson(json['contact']),
        amenities = json['amenities'] as List<String>,
        media = json['media'] == null
            ? null
            : (json['media'] as List).map((i) => Media.fromJson(i)),
        offers = json['offers'] == null
            ? null
            : (json['offers'] as List).map((i) => Offer.fromJson(i));

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'chainCode': chainCode,
        'brandCode': brandCode,
        'dupeId': dupeId,
        'name': name,
        'rating': rating,
        'description': description == null ? null : description.toJson(),
        'cityCode': cityCode,
        'latitude': latitude,
        'longitude': longitude,
        'hotelDistance': hotelDistance == null ? null : hotelDistance.toJson(),
        'address': address == null ? null : address.toJson(),
        'contact': contact == null ? null : contact.toJson(),
        'amenities': amenities,
        'media': media == null ? null : media.map((i) => i.toJson()),
        'offers': offers == null ? null : offers.map((i) => i.toJson()),
      };
}
