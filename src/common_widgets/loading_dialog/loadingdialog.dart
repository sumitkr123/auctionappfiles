import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.all(5.0),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(),
              CircularProgressIndicator(),
              Spacer(),
              Text("Please wait a moment..!"),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
