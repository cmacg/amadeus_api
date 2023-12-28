import 'associated_record.dart';

/// Booking details
class HotelBooking {
  /// Response type: hotel-booking
  final String type;

  /// The booking id
  final String id;

  /// GDS Confirmation Number. If you call the Provider, this Reference may be
  /// asked for.
  final String providerConfirmationId;

  /// Associated booking records.
  final List<AssociatedRecord>? associatedRecords;

  /// URI to retrieve booking details
  final String? self;

  HotelBooking(
      {required this.type,
      required this.id,
      required this.providerConfirmationId,
      this.associatedRecords,
      this.self});

  HotelBooking.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        providerConfirmationId = json['providerConfirmationId'],
        associatedRecords = json['associatedRecords'] == null
            ? null
            : (json['associatedRecords'] as List)
                .map((i) => AssociatedRecord.fromJson(i))
                .toList(),
        self = json['self'];
}
