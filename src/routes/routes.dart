import '../../decidescreen.dart';
import '../../src/features/authentication/screens/login/login_screen.dart';
import '../../src/features/authentication/screens/signup/signup_screen.dart';
import '../../src/features/authentication/screens/welcome/welcome.dart';

import '../features/core/screens/admin/dashboard.dart';
import '../common_widgets/user_bottom_nav/bottombar.dart';

import '../../splash_screen.dart';

var appRoutes = {
  //Auth routes :-
  '/': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
  '/decide': (context) => const DecideScreen(),
  '/welcome': (context) => const WelcomeScreen(),

  //Admin routes :-
  '/dashboard': (context) => const AdminDashboardFragment(),

  //User routes :-
  '/home': (context) => const BottomBar(),
};
