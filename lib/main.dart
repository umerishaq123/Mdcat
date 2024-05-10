

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
