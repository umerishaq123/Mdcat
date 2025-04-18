import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/all_imports.dart';

import 'package:provider/provider.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Themecolor.black,
              ),
              onPressed:(){}
            ),
          Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
         
        ],
      ),
    );
  }

  Widget navigationIcon({icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: Themecolor.black,
      ),
    );
  }
}