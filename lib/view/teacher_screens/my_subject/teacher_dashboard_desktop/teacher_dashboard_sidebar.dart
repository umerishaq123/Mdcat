import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/all_imports.dart';


class Sidebar extends StatefulWidget {
   const Sidebar({super.key});
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Themecolor.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "MDCAT",
                style: TextStyle(
                  color: Themecolor.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: Icon(Icons.menu_book_sharp),
              press: () {},
            ),
            DrawerListTile(
              title: "Recruitment",
              icon: Icon(Icons.menu_book_outlined),
              press: () {},
            ),
            DrawerListTile(
              title: "Onboarding",
             icon: Icon(Icons.menu_book_outlined),
              press: () {},
            ),
            DrawerListTile(
              title: "Reports",
              icon: Icon(Icons.menu_book_outlined),
              press: () {},
            ),
            DrawerListTile(
              title: "Calendar",
             icon: Icon(Icons.menu_book_outlined),
              press: () {}, 
            ),
            DrawerListTile(
              title: "Settings",
              icon: Icon(Icons.menu_book_outlined),
              press: () {},
            ),
            Spacer(),
            
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final Icon icon ;
  final VoidCallback press;

  const DrawerListTile({ required this.title,required this.icon, required this.press});
    
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading:icon,
      
       title: Row(
        children: [
          SizedBox(width: 10), // Add space between icon and title
          Text(
            title,
            style: TextStyle(color: Themecolor.white),
          ),
        ],
      ),
    );
  }
}