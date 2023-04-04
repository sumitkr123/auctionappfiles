import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import 'package:auctiondemo/src/models/usermodel.dart';

class DatabaseManager extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<UserDataModel> getuserdetails() async {
    User? currentuser = _auth.currentUser;

    DocumentSnapshot snapshot =
        await _firestore.collection('usersprofile').doc(currentuser!.uid).get();

    return UserDataModel.fromsnap(snapshot);
  }

  Future<String> uploadImage(Uint8List file) async {
    Reference ref = _storage
        .ref()
        .child('profile_pics')
        .child('${_auth.currentUser!.email}_${_auth.currentUser!.uid}.png');
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String imgurl = await snap.ref.getDownloadURL();
    return imgurl;
  }

  // Future<String> uploadQuizImage(Uint8List file, String? imageName) async {
  //   Reference ref = _storage
  //       .ref()
  //       .child('quiz_images')
  //       .child('${imageName!.toLowerCase()}_${_auth.currentUser!.email}.png');
  //   UploadTask uploadTask = ref.putData(file);

  //   TaskSnapshot snap = await uploadTask;
  //   String imgurl = await snap.ref.getDownloadURL();
  //   return imgurl;
  // }

  // Future<void> getallcreatedkuizer() async {
  //   final snapshot = await quizPaperFR.get();
  //   final details = snapshot.docs
  //       .map(
  //         (quizzes) => QuizPaperModel.fromSnapshot(quizzes),
  //       )
  //       .toList();

  //   for (var temp in details) {
  //     if (temp.creator == FirebaseAuth.instance.currentUser!.displayName) {
  //       finaldetails.addAll([temp]);
  //     }
  //   }
  // }
}
