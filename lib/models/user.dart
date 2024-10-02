import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String firstName;
  final String lastName;
  final String address;
  final String phoneNumber;
  final String profileImg;

  User({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.profileImg,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      firstName: doc['firstName'],
      lastName: doc['lastName'],
      address: doc['address'],
      phoneNumber: doc['phoneNumber'],
      profileImg: doc['profileImg'],
    );
  }
}
