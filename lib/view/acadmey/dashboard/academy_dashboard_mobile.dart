import 'package:mdcat_kawiish/all_imports.dart';

class AcademyDashboardMobile extends StatefulWidget {
  const AcademyDashboardMobile({super.key});

  @override
  AcademyDashboardMobileState createState() => AcademyDashboardMobileState();
}

class AcademyDashboardMobileState extends State<AcademyDashboardMobile> {
  @override
  Widget build(BuildContext context) {
        final height = MediaQuery.of(context).size.height;

    return Scaffold(
         endDrawer: TeacherDrawerWidget(
          height: height,
        ),
      appBar: AppBar(
        title: const Text('Admin Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.accadmeycreateStudent);
              },
              child: const Text('Create Student'),
            ),
          ),
          const GappedWidget(
            topGap: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.accadmeycreateteacher);
              },
              child: const Text('Create Teacher'),
            ),
          ),
          const GappedWidget(
            topGap: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, RoutesName.listOfCreatedStudentsTabbar);
              },
              child: const Text('List Of Created Student'),
            ),
          ),
          const GappedWidget(
            topGap: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, RoutesName.listCreatedTeacherTabbar);
              },
              child: const Text('List Of Created Teacher'),
            ),
          ),
          const GappedWidget(
            topGap: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.createsubject);
              },
              child: const Text('Create Subject'),
            ),
          ),
          const GappedWidget(
            topGap: 10,
          ),
          const GappedWidget(
            topGap: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.listOfCreatedSubject);
              },
              child: const Text('List Of Created Subjects'),
            ),
          ),
          const GappedWidget(
            topGap: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await SessionHandling()
                    .removeAcademySignedInToken()
                    .then((value) {
                  Navigator.pushReplacementNamed(
                      context, RoutesName.loginScreen);
                });
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}



      // bottomNavigationBar: Responsive.isMobile(context)
      //     ? BottomNavigationBar(
      //         currentIndex: _selectedScreen,
      //         unselectedItemColor: Colors.green,
      //         selectedItemColor: Colors.amber,
              
      //         onTap: (value) {
      //           setState(() {
      //             _selectedScreen = value;
      //           });
      //         },
      //         items: const [
      //             BottomNavigationBarItem(
      //                 icon: Icon(Icons.abc), label: 'Home0'),
      //             BottomNavigationBarItem(
      //                 icon: Icon(Icons.abc), label: 'Home1'),
      //             BottomNavigationBarItem(
      //                 icon: Icon(Icons.abc), label: 'Home2'),
      //           ])
      //     : SizedBox(),