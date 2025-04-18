import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/config/theme/theme.dart';
import 'package:mdcat_kawiish/view/acadmey/students/list_of_created_student_tabbar.dart';
import 'package:mdcat_kawiish/view/acadmey/subjects/list_of_created_subjects.dart';
import 'package:mdcat_kawiish/view/acadmey/teachers/list_of_created_teacher_tabbar.dart';
import 'package:mdcat_kawiish/view/theme_setting.dart';
import 'package:sidebarx/sidebarx.dart';
import 'academy_home_desktop.dart';

class AcademyDashboardDesktop extends StatefulWidget {
  const AcademyDashboardDesktop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AcademyDashboardDesktopState createState() => _AcademyDashboardDesktopState();
}

class _AcademyDashboardDesktopState extends State<AcademyDashboardDesktop> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        return Scaffold(
            key: _key,
            drawer: SideBarXExample(
              controller: _controller,
            ),
            body: Row(
              children: [
                SideBarXExample(controller: _controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        case 0:
                          _key.currentState?.closeDrawer();
                          return AcademyHomeDesktop();
                        case 1:
                          _key.currentState?.closeDrawer();
                          return ListOfCreatedTeacherTabbar();
                        case 2:
                          _key.currentState?.closeDrawer();
                          return ListOfCreatedStudentTabbar();

                        case 3:
                          _key.currentState?.closeDrawer();
                          return ListOfCreatedSubjects();
                        default:
                          return ThemeSettingScreen();
                      }
                    },
                  ),
                ))
              ],
            ));
      }),
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({super.key, required SidebarXController controller})
      : _controller = controller;
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
            color: Themecolor.primary,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        // iconTheme: IconThemeData(
        //   color: Colors.white,
        // ),
        // selectedTextStyle:  TextStyle(color: Colors.white),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 100,
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.white,
          ),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.search, label: 'Created Teachers'),
        SidebarXItem(icon: Icons.settings, label: 'Created Students'),
        SidebarXItem(icon: Icons.menu_book_outlined, label: 'Created Subjects'),
        SidebarXItem(icon: Icons.dark_mode, label: 'Light/Dark Mode'),
      ],
    );
  }
}
