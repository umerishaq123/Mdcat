

import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/config/routes/routes_name.dart';
import 'package:mdcat_kawiish/config/routes/slide_transition_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.userSplash:
      //   return SlideTransitionPage(page: const SplashScreen());


      default:
        // Handle undefined routes
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}