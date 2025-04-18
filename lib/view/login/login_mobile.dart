import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginBloc.dart';
import 'package:mdcat_kawiish/view/login/widgets.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
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
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                                            print('Im iin mobile');

                      // showCloseConfirmationDialog(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Themecolor.grey,
                  ),
                  // forceMaterialTransparency: true,

                  title: const Text(
                    'Welcome',
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
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
                        Text('Password', style: context.textTheme.bodyLarge),
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
                        buildSelectRoleWidget(),
                        const GappedWidget(
                          topGap: 20,
                        ),
                        buildSignInButton(),
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
                ))));
  }

  @override
  void dispose() {
    super.dispose();
    _loginbloc.close();
    _emailController.dispose();
    _passwordController.dispose();
  }
}