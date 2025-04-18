import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/header.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/my_files.dart';

class AcademyHomeDesktop extends StatefulWidget {
  const AcademyHomeDesktop({super.key});

  @override
  AcademyHomeDesktopState createState() => AcademyHomeDesktopState();
}

class AcademyHomeDesktopState extends State<AcademyHomeDesktop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: <Widget>[Header(), GappedWidget(), FileInfoCardGridView()],
      ),
    );
  }
}

bool isDarkMode(BuildContext context) {
  ThemeData theme = Theme.of(context);
  return theme.brightness == Brightness.dark;
}
