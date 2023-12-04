/// Contact Details
class Contact {
  /// Phone Number in standard E.123(https://en.wikipedia.org/wiki/E.123)
  final String phone;

  /// Email address
  final String email;

  Contact({required this.phone, required this.email});

  Map<String, dynamic> toJson() => {'phone': this.phone, 'email': this.email};
}
