import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../public/utils/constants/snack.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../../public/utils/constants/refer_to_constants.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordMailScreen> createState() =>
      _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  final emailcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: tDefaultSize * 3,
                ),
                const FormHeaderWidget(
                  image: tWelcomeImage,
                  title: tForgetPassword,
                  subtitle: tForgetMailSubtitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  imageHeight: 0.25,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: tFormheight,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          labelText: tEmail,
                          hintText: tEnterEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: tDefaultSize,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (emailcontroller.text.trim().isNotEmpty) {
                              try {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                  email: emailcontroller.text.trim(),
                                );
                                await snack('Msg :-', 'Go check your email..!');
                                Get.offNamed('/login');
                              } catch (e) {
                                await snack('Issue :-', e.toString());
                              }
                            } else {
                              await snack('Issue :-', 'Please enter your email..!');
                            }
                          },
                          child: const Text(
                            tNext,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
