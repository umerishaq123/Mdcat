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
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            theme:
                state.isDarkOrLight ? AppTheme.lightTheme : AppTheme.darkTheme,
            darkTheme: AppTheme.darkTheme,
            title: 'Flutter Demo',

            // home: const MyWidget(),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Example'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(IsDarkOrLightMode());
              },
              child: Text('Toggle Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
