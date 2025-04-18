import 'package:mdcat_kawiish/bloc/common/login_bloc/loginEvent.dart';
import '../../all_imports.dart';

class SelectRoleWidget extends StatelessWidget {
  const SelectRoleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;

    return BlocBuilder<LoginBloc, LoginState>(
        // buildWhen: (previous,current)=>previous.selectrole !=current.selectrole,
        builder: (BuildContext context, state) {
      // Ensure the value is from the items list
      String? dropdownValue = state.selectrole.isNotEmpty &&
              listOfRolesConstant.contains(state.selectrole[0])
          ? state.selectrole[0]
          : null;

      return CustomDropdown(
        items: listOfRolesConstant,
        value: dropdownValue,
        onChanged: (newValue) {
          if (newValue != null) {
            context.read<LoginBloc>().add(SelectRole(roles: newValue));
          }
        },
        hintText: 'Enter your roles',
      );
    });
  }
}

class LoginWidget extends StatelessWidget {
  var formKey;
  var emailFocusNode;
  var passwordFocusNode;
  LoginWidget(
      {required this.formKey,
      super.key,
      required this.emailFocusNode,
      required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obscureText = ValueNotifier(true);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text('Hi,Welcome Back!',
                  style: context.textTheme.headlineMedium)),
          const GappedWidget(),
          Center(
              child: Text('please fill up your information to continue',
                  style: context.textTheme.bodyLarge)),
          const GappedWidget(),
          Text(
            'Email',
            style: context.textTheme.bodyLarge,
          ),
          const GappedWidget(),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter email';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            focusNode: emailFocusNode,
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, emailFocusNode, passwordFocusNode);
            },
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          const GappedWidget(
            topGap: 15,
          ),
          Text('Password', style: context.textTheme.bodyLarge),
          const GappedWidget(),
          ValueListenableBuilder(
            valueListenable: obscureText,
            builder: (BuildContext context, value, Widget? child) {
              return TextFormField(
                obscureText: obscureText.value,
                onChanged: (value) {
                  context
                      .read<LoginBloc>()
                      .add(PasswordChanged(password: value));
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter password';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIcon: InkWell(
                    onTap: () {
                      obscureText.value = !obscureText.value;
                    },
                    child: Icon(
                        obscureText.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        color: Themecolor.black),
                  ),
                ),
              );
            },
          ),
          const GappedWidget(
            bottomGap: 20,
          ),
          Text('Role', style: context.textTheme.bodyLarge),
          const GappedWidget(),
          const SelectRoleWidget(),
          const GappedWidget(
            topGap: 20,
          ),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.loginStatus == LoadingStatus.error) {
                Utils.snackBar(state.message, context);
                context.read<LoginBloc>().add((GotError()));
              }

              if (state.loginStatus == LoadingStatus.success) {
                Utils.snackBar(state.message, context);
              }
              if (state.loginStatus == LoadingStatus.success) {
                if (state.selectrole == 'Teacher') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.teacherDashboard, (route) => false);
                } else if (state.selectrole == 'Student') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.studentDashboard, (route) => false);
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.academyDashboard, (route) => false);
                }
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
                // buildWhen: (current, previous) =>
                //     current.loginStatus != previous.loginStatus,
                builder: (context, state) {
              return Center(
                child: state.loginStatus == LoadingStatus.loading
                    ? const LoadingWidget()
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (state.selectrole == 'Student') {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginApiForStudent());
                            } else if (state.selectrole == 'Teacher') {
                              context
                                  .read<LoginBloc>()
                                  .add((LoginApiForTeacher()));
                            } else {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginApiForAcadmy());
                            }
                          }
                        },
                        child: const Text('Login')),
              );
            }),
          ),
          const GappedWidget(
            bottomGap: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Forgot Password..?', style: context.textTheme.bodyLarge),
            ],
          )
        ],
      ),
    );
  }
}
