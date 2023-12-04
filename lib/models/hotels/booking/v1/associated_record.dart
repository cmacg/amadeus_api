/// Associated record
class AssociatedRecord {
  /// Amadeus GDS record
  final String reference;

  /// GDS: Associated Amadeus GDS Flight Booking PNR Record
  final String originSystemCode;

  AssociatedRecord({required this.reference, required this.originSystemCode});

  AssociatedRecord.fromJson(Map<String, dynamic> json)
      : reference = json['reference'],
        originSystemCode = json['originSystemCode'];
}
