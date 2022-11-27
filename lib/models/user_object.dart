import 'package:equatable/equatable.dart';

class UserObject extends Equatable {
  const UserObject({
    this.firstName,
    this.middleName,
    this.lastName,
    this.address,
    this.contacts,
    required this.uid,
    this.role,
    this.displayImage,
    this.pets,
    this.createdAt,
    this.email,
  });

  final String? uid;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? address;
  final String? contacts;
  final String? role;
  final String? displayImage;
  final int? pets;
  final String? createdAt;
  final String? email;

  factory UserObject.fromJson(Map<String, dynamic> json) {
    return UserObject(
        uid: json['uid'] as String?,
        firstName: json['firstName'] as String?,
        middleName: json['middleName'] as String?,
        lastName: json['lastName'] as String?,
        address: json['address'] as String?,
        contacts: json['contacts'] as String?,
        role: json['role'] as String?,
        displayImage: json['displayImage'] as String?,
        pets: json['pets'] as int?,
        email: json['email'] as String?,
        createdAt: json['createdAt'] as String?);
  }

  Map<String, dynamic> toFirestore() => {
        if (uid != null) 'uid': uid,
        if (firstName != null) "firstName": firstName,
        if (middleName != null) "middleName": middleName,
        if (lastName != null) "lastName": lastName,
        if (address != null) "address": address,
        if (contacts != null) "contacts": contacts,
        if (role != null) "role": role,
        if (displayImage != null) "displayImage": displayImage,
        if (pets != null) "pets": pets,
        if (createdAt != null) "createdAt": createdAt,
        if (email != null) "email": email
      };

  @override
  List<Object?> get props => [
        uid,
        firstName,
        middleName,
        lastName,
        address,
        contacts,
        role,
        displayImage,
        pets,
        createdAt,
        email
      ];
}
