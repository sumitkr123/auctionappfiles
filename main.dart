import 'package:firebase_auth/firebase_auth.dart';

import 'src/bindings/intial_binding.dart';
import 'src/providers/user_provider.dart';
import 'src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'public/utils/constants/refer_to_constants.dart';
import 'splash_screen.dart';
import 'public/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBFFJy-EXnWjhHaFCEaxNqonKhUCqpj1CU",
        authDomain: "auction-demo-e1405.firebaseapp.com",
        projectId: "auction-demo-e1405",
        storageBucket: "auction-demo-e1405.appspot.com",
        messagingSenderId: "816457567870",
        appId: "1:816457567870:web:5dca5c6e3baa2d2c08522f",
        measurementId: "G-G9CYZNCD53",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    InitialBinding();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(), 
        )
      ],
      child: RefreshConfiguration(
        child: GetMaterialApp(
          title: tAppName,
          debugShowCheckedModeBanner: false,
          theme: TAppTheme.lightTheme,
          themeMode: ThemeMode.system,
          defaultTransition: Transition.noTransition,
          routes: appRoutes,
        ),
      ),
    );
  }
}
