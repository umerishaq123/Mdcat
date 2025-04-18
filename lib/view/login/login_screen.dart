import 'package:mdcat_kawiish/view/login/login_desktop.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: LoginDesktop(), tablet: LoginDesktop(), desktop: LoginDesktop());
  }
}
