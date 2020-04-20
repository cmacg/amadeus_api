class Contact {
  final String phone;
  final String fax;
  final String email;

  Contact({this.phone, this.email, this.fax});

  Contact.fromJson(Map<String, dynamic> json)
    : phone = json['phone'],
      email = json['email'],
      fax = json['fax'];

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'email': email,
    'fax': fax,
  };

}