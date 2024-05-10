import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/core/responsive/responsive.dart';
import 'package:mdcat_kawiish/view/login/login_desktop.dart';
import 'package:mdcat_kawiish/view/login/login_mobile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: LoginMobile(), tablet: LoginMobile(), desktop: LoginDesktop());
  }
}
