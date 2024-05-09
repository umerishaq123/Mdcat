import 'package:mdcat_kawiish/config/theme/theme_light.dart';

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
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: MaterialApp(
        theme: Themelight.lightTheme,
        darkTheme: Themelight.darkTheme,
        title: 'Flutter Demo',
        // home: const CounterScreen(),
      ),
    );
  }
}
