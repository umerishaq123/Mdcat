import 'package:mdcat_kawiish/view/acadmey/dashboard/academy_dashboard_mobile.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/academy_dashboard_desktop.dart';

class AcademyDashboard extends StatefulWidget {
  const AcademyDashboard({super.key});

  @override
  State<AcademyDashboard> createState() => _AcademyDashboardState();
}

class _AcademyDashboardState extends State<AcademyDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: AcademyDashboardMobile(),
        tablet: AcademyDashboardMobile(),
        desktop: AcademyDashboardDesktop());
  }
}
