import 'package:mdcat_kawiish/bloc/loginscreen/loginBloc.dart';
import 'package:mdcat_kawiish/bloc/theme/theme_bloc.dart';
import 'package:mdcat_kawiish/bloc/theme/theme_event.dart';
import 'package:mdcat_kawiish/bloc/theme/theme_state.dart';
import 'package:mdcat_kawiish/config/routes/routes.dart';
import 'package:mdcat_kawiish/config/routes/routes_name.dart';
import 'package:mdcat_kawiish/config/theme/theme.dart';
import 'package:mdcat_kawiish/view/login/login_mobile.dart';

import 'all_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // create: (BuildContext context) => CounterBloc(),
        BlocProvider(create: (_) => ThemeBloc()),
        // BlocProvider(create: (_)=>loginBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                state.isDarkOrLight ? AppTheme.lightTheme : AppTheme.darkTheme,
            darkTheme: AppTheme.darkTheme,
            title: 'Flutter Demo',

            // home: const MyWidget(),
            initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
