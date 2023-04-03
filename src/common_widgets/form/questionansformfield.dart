import 'package:flutter/material.dart';

class QuestionAnsFormField extends StatelessWidget {
  QuestionAnsFormField({
    Key? key,
    required this.controller,
    required this.hinttext,
  }) : super(key: key);

  final TextEditingController controller;
  String hinttext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 214, 214, 214),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 214, 214, 214),
          ),
        ),
        contentPadding: const EdgeInsets.all(6.0),
      ),
    );
  }
}
