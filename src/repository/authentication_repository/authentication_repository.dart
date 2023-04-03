import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:auctiondemo/src/models/usermodel.dart';
import 'package:auctiondemo/src/repository/authentication_repository/exceptions/login_email_pass_failure.dart';
import 'package:auctiondemo/src/repository/authentication_repository/exceptions/signup_email_pass_failure.dart';
import 'package:auctiondemo/src/repository/database_repository/databasemanager.dart';

import '../../../public/utils/constants/snack.dart';
import '../../providers/user_provider.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserProvider? provider;

  Future<String> signupUserbyemailandpass({
    required String email,
    required String password,
    required String uname,
    required Uint8List file,
  }) async {
    String res = "Some error occurred..";
    UserCredential? result;

    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          uname.isNotEmpty &&
          file.isNotEmpty) {
        result = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        res = "Please fill all the details.";
      }
    } on FirebaseAuthException catch (e) {
      final res = SignUpWithEmailPasswordFailure.code(e.code);
      return res.message;
    } catch (_) {}

    try {
      if (result != null) {
        User? user = result.user;

        String photourl = await DatabaseManager().uploadImage(file);

        UserDataModel userrecord = UserDataModel(
          email: email,
          username: uname,
          uid: user!.uid,
          profilepicurl: photourl,
          role: email == 'akash231842@gmail.com' ? 'admin' : 'user',
        );
        await _firestore
            .collection('usersprofile')
            .doc(user!.uid)
            .set(
          userrecord.tojson(),
        );

        await user!.sendEmailVerification();

        await snack('Msg. :-', 'Verfication link has been sent to :- $email');

        await user.reload();
        await _auth.signOut();

        res = "Success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginuserbyemailandpass({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    UserCredential? result;

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        res = "Please fill all the details.";
      }
    } on FirebaseAuthException catch (e) {
      final res = LoginWithEmailPasswordFailure.code(e.code);
      return res.message;
    } catch (_) {}

    try {
      if (result != null) {
        User? user = _auth.currentUser;
        if (!user!.emailVerified) {
          await _auth.signOut();
          res = 'Email is not verified..!';
        } else if (user.emailVerified) {
          res = "Success";
        }
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> googleLogin() async {
    String res = "Some error occurred";
    final GoogleSignInAccount? googleuser;
    try {
      if (kIsWeb) {
        googleuser = await GoogleSignIn(
          clientId:
              "816457567870-ivf5fdutamfblssb6k7vr08ccr7af6a6.apps.googleusercontent.com",
        ).signIn();
      } else {
        googleuser = await GoogleSignIn().signIn();
      }

      if (googleuser == null) {
        res = "Not succeed..";
      } else {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleuser.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        final cred = await _auth.signInWithCredential(authCredential);

        UserDataModel userrecord = UserDataModel(
          email: googleuser.email,
          username: googleuser.displayName!,
          uid: cred.user!.uid,
          profilepicurl: googleuser.photoUrl!,
          role: googleuser.email == 'akash231842@gmail.com' ? 'admin' : 'user',
        );

        await _firestore
            .collection('usersprofile')
            .doc(_auth.currentUser!.uid)
            .set(
              userrecord.tojson(),
            );
        res = "Success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future logout() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }
}
