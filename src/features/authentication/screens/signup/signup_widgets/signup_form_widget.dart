import 'dart:typed_data';

import 'package:auctiondemo/public/utils/constants/snack.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../decidescreen.dart';
import '../../../../../common_widgets/loading_dialog/loadingdialog.dart';
import '../../../../../../public/utils/constants/refer_to_constants.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../../../public/utils/ImagePicking/pick_image.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailctl = TextEditingController();
  final TextEditingController passwordctl = TextEditingController();
  final TextEditingController usernamectl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailctl.dispose();
    passwordctl.dispose();
    usernamectl.dispose();
  }

  Uint8List? _image;
  bool _isPass = true;
  bool _isLoading = false;
  final _formkey = GlobalKey<FormState>();

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  void createUser() async {
    setState(() {
      _isLoading = true;
    });

    if (emailctl.text.isNotEmpty &&
        passwordctl.text.isNotEmpty &&
        usernamectl.text.isNotEmpty &&
        _image != null) {
      String res = await AuthenticationRepository().signupUserbyemailandpass(
        email: emailctl.text.trim(),
        password: passwordctl.text.trim(),
        uname: usernamectl.text.trim(),
        file: _image!,
      );
      if (res == "Success") {
        setState(() {
          _isLoading = false;
        });
        Get.offAllNamed('/decide');
      } else {
        setState(() {
          _isLoading = false;
        });
        await snack('Issue :-', res);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      await snack('Issue :-', 'Please fill all the details..!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormheight),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: usernamectl,
              decoration: const InputDecoration(
                labelText: tUserName,
                hintText: tEnterUserName,
                prefixIcon: Icon(Icons.person_outline_rounded),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormheight),
            TextFormField(
              controller: emailctl,
              decoration: const InputDecoration(
                labelText: tEmail,
                hintText: tEnterEmail,
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormheight),
            TextFormField(
              obscureText: _isPass,
              controller: passwordctl,
              decoration: InputDecoration(
                labelText: tPass,
                hintText: tEnterPass,
                prefixIcon: const Icon(Icons.fingerprint_outlined),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPass = !_isPass;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormheight + 10),
            const Text("Select your profile picture :-"),
            const SizedBox(
              height: tFormheight,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 180,
                      child: Center(
                        child: _image != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const Text(
                                "No image selected.",
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectImage();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text("SELECT"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: tFormheight + 10,
            ),
            SizedBox(
              width: double.infinity,
              child: _isLoading
                  ? const Loader()
                  : ElevatedButton(
                      onPressed: () {
                        createUser();
                      },
                      child: Text(
                        tSignup.toUpperCase(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
