import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginBloc.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginEvent.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginState.dart';

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
  ValueNotifier _obscurePAsswordText = ValueNotifier(true);
  late loginBloc _loginbloc;
  @override
  void initState() {
    super.initState();
    _loginbloc = loginBloc();
  }

  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                        BlocBuilder<loginBloc, LoginState>(
                            builder: (context, state) {
                          return TextFormField(
                            onChanged: (value) {
                              context
                                  .read<loginBloc>()
                                  .add(Emailchange(email: value));
                            },
                            decoration: const InputDecoration(
                              hintText: 'enter your email',
                            ),
                          );
                        }),
                        const GappedWidget(
                          topGap: 15,
                        ),
                        Text('Password', style: context.textTheme.bodyLarge),
                        const GappedWidget(),
                        BlocBuilder<loginBloc, LoginState>(
                            buildWhen: (current, previous) =>
                                current.email != previous.email,
                            builder: (BuildContext context, state) {
                              return TextFormField(
                                onChanged: (newValue) {
                                  context
                                      .read<loginBloc>()
                                      .add(Emailchange(email: newValue));
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter your password'),
                              );
                            }),
                        const GappedWidget(
                          bottomGap: 20,
                        ),
                        Text('Role', style: context.textTheme.bodyLarge),
                        const GappedWidget(),
                        BlocBuilder<loginBloc, LoginState>(
                          buildWhen: (current, previous) => false,
                          builder: (BuildContext context, state) {
                            return Container(
                              height: height * 0.07,
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Themecolor.grey),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  style: TextStyle(color: Themecolor.grey),
                                  borderRadius: BorderRadius.circular(16),
                                  isExpanded: true,
                                  value: state.selectrole.isNotEmpty
                                      ? state.selectrole[0]
                                      : null,
                                  hint: Text('Select Role'),
                                  onChanged: (newValue) {
                                    context
                                        .read<loginBloc>()
                                        .add(selectrole(roles: [newValue!]));
                                  },
                                  items: <String>[
                                    'Academy',
                                    'Teacher',
                                    'Student'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        // SizedBox(height: 20),
                        // Text('Selected Role: $_selectedRole'),
                        const GappedWidget(
                          topGap: 20,
                        ),
                        Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  Utils.dismissKeyboard(context);
                                },
                                child: const Text('Login'))),
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
