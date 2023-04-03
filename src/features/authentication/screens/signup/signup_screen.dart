import 'package:auctiondemo/src/features/authentication/screens/signup/signup_widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/form/form_footer_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../../public/utils/constants/refer_to_constants.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: tWelcomeImage,
                  title: tSignupTitle,
                  subtitle: tSignupSubtitle,
                ),
                const SignupForm(),
                FormFooterWidget(
                  onPressed: (){Get.offNamed('/login');},
                  textspan_part1: tAlreadyHaveAc,
                  textspan_part2: tLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
