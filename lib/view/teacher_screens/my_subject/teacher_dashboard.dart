import 'package:mdcat_kawiish/view/acadmey/dashboard/academy_dashboard_desktop.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/academy_dashboard_mobile.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/view/teacher_screens/my_subject/teacher_dashboard_desktop/homepage.dart';

import 'package:mdcat_kawiish/view/teacher_screens/my_subject/teacher_dashboard_desktop/teacher_dashboard_sidebar.dart';
import 'package:mdcat_kawiish/view/teacher_screens/my_subject/teacher_dashboard_mobile.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: TeacherDashboardMobile(),
        tablet: TeacherDashboardMobile(),
        desktop:HomePage());
  }
}
