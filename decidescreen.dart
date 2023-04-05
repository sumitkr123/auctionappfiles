import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auctiondemo/src/common_widgets/loading_dialog/loadingdialog.dart';
import 'package:auctiondemo/src/features/authentication/screens/welcome/welcome.dart';
import 'package:auctiondemo/entrypoint.dart';

class DecideScreen extends StatelessWidget {
  const DecideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Loader(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          return const EntryPoint();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}
