import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserDataModel {
  final String email;
  final String username;
  final String uid;
  final String role;
  final String profilepicurl;

  const UserDataModel({
    required this.email,
    required this.username,
    required this.uid,
    required this.role,
    required this.profilepicurl,
  });

  Map<String, dynamic> tojson() => {
        'email': email,
        'username': username,
        'uid': uid,
        'role': role,
        'profilepicurl': profilepicurl,
      };

  static UserDataModel fromsnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return UserDataModel(
      email: snap['email'],
      username: snap['username'],
      uid: snap['uid'],
      role: snap['role'],
      profilepicurl: snap['profilepicurl'],
    );
  }
}

var newname = ''.obs;
