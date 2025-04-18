import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/header.dart';
import 'package:mdcat_kawiish/view/teacher_screens/my_subject/teacher_dashboard_desktop/teacher_dashboard_desktop.dart';
import 'package:mdcat_kawiish/view/teacher_screens/my_subject/teacher_dashboard_desktop/teacher_dashboard_sidebar.dart';
import 'package:mdcat_kawiish/view/teacher_screens/my_subject/teacher_dashboard_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      // key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: Themecolor.grey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: Sidebar(),
              ),
            Expanded(
              flex: 4,
              child: TeacherDashboardDesktop(),
            ),
          ],
        ),
      ),
    );

    /// Main Body Part
  }
}
