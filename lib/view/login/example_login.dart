import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/core/utilis/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier _obscurePAsswordText = ValueNotifier(true);

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
   

    return PopScope(
      canPop: true, // Initially allow pop (can be changed based on conditions)
      onPopInvoked: (didPop) async {
        // if (didPop) {
        //   // User swiped back
        //   final shouldExit = await showCloseConfirmationDialog(context);
        //   if (shouldExit ?? false) {
        //     exit(0); // Exit the app
        //   }
        // }
      },

      child: Scaffold(
        backgroundColor: Themecolor.primary,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
             Utils.snackBar('sucessfully', context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Themecolor.flushbar,
          ),
          forceMaterialTransparency: true,
          // backgroundColor: AppConstants.kcprimaryColor,

          elevation: 0.0,
          title:
              Text('', style: AppConstantsTextStyle.kTextStyleLargreBoldWhite),
          centerTitle: true,
        ),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 5.5,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: AppConstantsWidgetStyle.kgradientScreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Image.asset(
                      AppConstantsIconPath.SplashScreenPath,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: BoxDecoration(
                color: AppConstantsColor.kcgreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(46.0),
                  topRight: Radius.circular(46.0),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  dismissKeyboard(context);
                },
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //Title
                          LoginPageTitleWidget(),

                          //User Name

                          UserNameTextFormFiledWidget(
                            controller: _emailController,
                          ),

                          //Password
                          EnterPasswordWidget(
                            obscurePAsswordText: _obscurePAsswordText,
                            userPasswordController: _passwordController,
                          ),
                          //Role
                          RoleDropdownWidget(),
                          // Login Button

                          Builder(builder: (context) {
                            return Consumer<AuthProvider>(
                              builder: (BuildContext context,
                                  AuthProvider value, Widget? child) {
                                return value.isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : SignInButtonWidget(
                                        ftn: () {
                                          if (_emailController.text.isEmpty) {
                                            showFlushbar(
                                                'Please enter Email', context);
                                          } else if (_passwordController
                                              .text.isEmpty) {
                                            showFlushbar(
                                                'Please enter password',
                                                context);
                                          } else if (roleProvider ==
                                              'Select Role') {
                                            showFlushbar(
                                                'Please select your role.',
                                                context);
                                          } else {
                                            authProvider.Login(
                                                email: _emailController.text
                                                    .trim(),
                                                password: _passwordController
                                                    .text
                                                    .trim(),
                                                role: roleProvider,
                                                context: context);
                                          }
                                        },
                                      );
                              },
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
  }
}