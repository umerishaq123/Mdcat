import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginBloc.dart';
import 'package:mdcat_kawiish/view/login/widgets.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier obscurePAsswordText = ValueNotifier(true);
  late LoginBloc _loginbloc;
  @override
  void initState() {
    super.initState();
    _loginbloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop:
            true, // Initially allow pop (can be changed based on conditions)
        onPopInvoked: (didPop) async {
          // if (didPop) {
          //   // User swiped back
          //   final shouldExit = await showCloseConfirmationDialog(context);
          //   if (shouldExit ?? false) {
          //     exit(0); // Exit the app
          //   }
          // }
        },
        child: BlocProvider(
            create: (_) => _loginbloc,
            child: Scaffold(
                // backgroundColor: AppConstantsColor.kcprimaryColor,
                
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height,
                          child: Icon(Icons.abc,color:Colors.red ,),
                        )),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text('Hi,Welcome Back!',
                                      style: context.textTheme.headlineMedium)),
                              const GappedWidget(),
                              Center(
                                  child: Text(
                                      'please fill up your information to continue',
                                      style: context.textTheme.bodyLarge)),
                              const GappedWidget(),
                              Text(
                                'Email',
                                style: context.textTheme.bodyLarge,
                              ),
                              const GappedWidget(),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'enter your email',
                                ),
                              ),
                              const GappedWidget(
                                topGap: 15,
                              ),
                              Text('Password',
                                  style: context.textTheme.bodyLarge),
                              const GappedWidget(),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter your password'),
                              ),
                              const GappedWidget(
                                bottomGap: 20,
                              ),
                              Text('Role', style: context.textTheme.bodyLarge),
                              const GappedWidget(),
                             const buildSelectRoleWidget(),
                              const GappedWidget(
                                topGap: 20,
                              ),
                          const    buildSignInButton(),
                              const GappedWidget(
                                bottomGap: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Forgot Password..?',
                                      style: context.textTheme.bodyLarge),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
