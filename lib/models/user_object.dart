import 'package:equatable/equatable.dart';

class UserObject extends Equatable {
  const UserObject({this.firstName, this.middleName, this.lastName, this.address, this.contacts, required this.uid});

  final String? uid;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? address;
  final String? contacts;

  factory UserObject.fromJson(Map<String, dynamic> json) {
    return UserObject(
      uid: json['uid'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      contacts: json['contacts'] as String,
    );
  }

  Map<String, dynamic> toFirestore() => {
        if (uid != null) 'uid': uid,
        if (firstName != null) "name": firstName,
        if (middleName != null) "name": middleName,
        if (lastName != null) "name": lastName,
        if (address != null) "address": address,
        if (contacts != null) "contacts": contacts,
      };

  @override
  List<Object?> get props => [uid, firstName, middleName, lastName, address, contacts];
}
