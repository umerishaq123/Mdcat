import 'package:mdcat_kawiish/bloc/loginscreen/loginBloc.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginEvent.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginState.dart';

import '../../all_imports.dart';

class buildSignInButton extends StatelessWidget {
  const buildSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              Utils.dismissKeyboard(context);
            },
            child: const Text('Login')));
  }
}

class buildSelectRoleWidget extends StatelessWidget {
  const buildSelectRoleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previous) => current != previous,
      builder: (BuildContext context, state) {
        return Container(
          height: height * 0.07,
          decoration: BoxDecoration(
            border: Border.all(color: Themecolor.grey),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              style: const TextStyle(color: Themecolor.grey),
              borderRadius: BorderRadius.circular(16),
              isExpanded: true,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              value: state.selectrole.isNotEmpty ? state.selectrole[0] : null,
              hint: const Text('Select Role'),
              onChanged: (newValue) {
                context.read<LoginBloc>().add(SelectRole(roles: [newValue!]));
              },
              items:
                  <String>['Academy', 'Teacher', 'Student'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
