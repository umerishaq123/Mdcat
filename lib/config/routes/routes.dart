

import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/config/routes/routes_name.dart';
import 'package:mdcat_kawiish/config/routes/slide_transition_page.dart';
import 'package:mdcat_kawiish/view/login/login_mobile.dart';
import 'package:mdcat_kawiish/view/login/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.userSplash:
      //   return SlideTransitionPage(page: const SplashScreen());
      case RoutesName.splashScreen:
      return SlideTransitionPage(page: SplashScreen());
      case RoutesName.loginScreen:
      return SlideTransitionPage(page: const LoginMobile());


      default:
        // Handle undefined routes
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}