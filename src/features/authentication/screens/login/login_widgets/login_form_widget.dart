import 'package:auctiondemo/public/utils/constants/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../decidescreen.dart';
import '../../../../../common_widgets/loading_dialog/loadingdialog.dart';
import '../../../../../../public/utils/constants/refer_to_constants.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../forget_password/forget_password_mail/forget_password_mail.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailctl = TextEditingController();
  final TextEditingController passwordctl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailctl.dispose();
    passwordctl.dispose();
  }

  final _key = GlobalKey<FormState>();
  bool isPass = true;
  bool _isLoading = false;

  void loginuser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthenticationRepository().loginuserbyemailandpass(
      email: emailctl.text.trim(),
      password: passwordctl.text.trim(),
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        key: _key,
        padding: const EdgeInsets.symmetric(vertical: tFormheight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailctl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEnterEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormheight),
            TextFormField(
              obscureText: isPass,
              controller: passwordctl,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint_outlined),
                  labelText: tPass,
                  hintText: tEnterPass,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPass = !isPass;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye_sharp),
                  )),
            ),
            const SizedBox(
              height: tFormheight - 10,
            ),

            //Forget Password Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(() => const ForgetPasswordMailScreen());
                },
                child: const Text(
                  tForget,
                  style: TextStyle(color: tPrimaryColor),
                ),
              ),
            ),

            //Login button
            SizedBox(
              width: double.infinity,
              child: _isLoading
                  ? const Loader()
                  : ElevatedButton(
                      onPressed: () {
                        loginuser();
                      },
                      child: Text(
                        tLogin.toUpperCase(),
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
