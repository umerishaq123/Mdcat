

import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/config/routes/routes_name.dart';
import 'package:mdcat_kawiish/config/routes/slide_transition_page.dart';
import 'package:mdcat_kawiish/view/login/Accadmy_create_student_teacher.dart';
import 'package:mdcat_kawiish/view/login/login_screen.dart';
import 'package:mdcat_kawiish/view/login/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.userSplash:
      //   return SlideTransitionPage(page: const SplashScreen());
      case RoutesName.splashScreen:
      return SlideTransitionPage(page:const SplashScreen());
      case RoutesName.loginScreen:
      return SlideTransitionPage(page: const LoginScreen());
      case RoutesName.createStudentTeacher:
      return SlideTransitionPage(page:   CreateStudentTeacher());


      default:
        // Handle undefined routes
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}