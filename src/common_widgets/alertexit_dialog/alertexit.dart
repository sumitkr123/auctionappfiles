import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../public/utils/constants/refer_to_constants.dart';


// ignore: must_be_immutable
class CustomAlertDialogExit extends StatelessWidget {
  BuildContext context;
  CustomAlertDialogExit({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Image(
            image: AssetImage(tLogo),
            width: 60.0,
            height: 60.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "Kuizer?",
              style: GoogleFonts.graduate(
                fontSize: 30.0,
                color: tPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        height: 250.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Image(
                image: AssetImage(tSad),
                width: 140.0,
                height: 140.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text("Do you really want to Exit?"),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            fixedSize: const Size(100, 50),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("No"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            fixedSize: const Size(100, 50),
          ),
          onPressed: () {
            SystemNavigator.pop();
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
