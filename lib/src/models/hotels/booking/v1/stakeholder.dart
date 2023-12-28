import 'contact.dart';

/// Guest Details
class Stakeholder {
  /// Item identifier.  ex. '1' for Guest 1
  final int? id;

  /// Guest name
  final StakeholderName name;

  /// Contact details
  final Contact contact;

  /// Hotel Chain Rewards Member Number. To receive your Rewards Points, access
  /// online check in, fast check out. An error is returned by the Chain if the
  /// number is invalid.
  final String? hotelRewardsMember;

  Stakeholder(
      {this.id,
      required this.name,
      required this.contact,
      this.hotelRewardsMember});

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': name.toJson(),
        'contact': contact.toJson(),
        'hotelRewardsMember': this.hotelRewardsMember
      };
}

/// Guest name
class StakeholderName {
  /// Title/gender of room guest
  final String? title;

  /// First name (and middle name) of room guest
  final String firstName;

  /// Last name of room guest
  final String lastName;

  StakeholderName(
      {this.title, required this.firstName, required this.lastName});

  Map<String, dynamic> toJson() => {
        'title': this.title,
        'firstName': this.firstName,
        'lastName': this.lastName
      };
}
