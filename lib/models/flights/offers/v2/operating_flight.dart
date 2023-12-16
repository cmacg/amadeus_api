/// Information about the operating flight
class OperatingFlight {
  /// The airline / carrier code. example: DL
  final String? carrierCode;

  OperatingFlight({this.carrierCode});

  OperatingFlight.fromJson(Map<String, dynamic> json)
      : carrierCode = json['carrierCode'];
}
