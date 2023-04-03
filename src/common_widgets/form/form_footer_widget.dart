import 'package:auctiondemo/public/utils/constants/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../decidescreen.dart';
import '../../../public/utils/constants/refer_to_constants.dart';
import '../../repository/authentication_repository/authentication_repository.dart';
import '../loading_dialog/loadingdialog.dart';

class FormFooterWidget extends StatefulWidget {
  const FormFooterWidget({
    Key? key,
    required this.textspan_part1,
    required this.textspan_part2,
    required this.onPressed,
  }) : super(key: key);

  final String textspan_part1, textspan_part2;
  final VoidCallback onPressed;

  @override
  State<FormFooterWidget> createState() => _FormFooterWidgetState();
}

class _FormFooterWidgetState extends State<FormFooterWidget> {
  bool _isLoading = false;

  void googlelogin() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthenticationRepository().googleLogin();

    if (res == "Success") {
      setState(() {
        _isLoading = false;
      });
      Get.offAll(const DecideScreen());
    } else {
      setState(() {
        _isLoading = false;
      });
      print(res);
      await snack('Issue :- ', res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormheight - 5,
        ),
        SizedBox(
          width: double.infinity,
          child: _isLoading
              ? const Loader()
              : OutlinedButton.icon(
                  onPressed: () {
                    googlelogin();
                  },
                  icon: const Image(
                    image: AssetImage(tGoogleLogo),
                    width: 40.0,
                    height: 20.0,
                  ),
                  label: const Text(
                    tSignInGoogle,
                    style: TextStyle(fontSize: 20, color: tPrimaryColor),
                  ),
                ),
        ),
        const SizedBox(
          height: tFormheight - 5.0,
        ),
        TextButton(
          onPressed: widget.onPressed,
          child: Text.rich(
            TextSpan(
              text: widget.textspan_part1,
              style: Theme.of(context).textTheme.bodyText2,
              children: [
                TextSpan(
                  text: widget.textspan_part2,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
