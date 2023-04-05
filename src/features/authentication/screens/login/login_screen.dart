import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/form/form_footer_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../../public/utils/constants/refer_to_constants.dart';
import '../login/login_widgets/login_form_widget.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: tWelcomeImage,
                  title: tLoginTitle,
                  subtitle: tLoginSubTitle,
                ),
                const LoginForm(),
                FormFooterWidget(
                  onPressed: (){Get.offNamed('/signup');},
                  textspan_part1: tDontHaveAc,
                  textspan_part2: tSignup,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
