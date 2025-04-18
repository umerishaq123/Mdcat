import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/all_imports.dart';


class NotificationCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Themecolor.orange, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16, color: Themecolor.black),
                  children: [
                    TextSpan(text: "Good Morning "),
                    TextSpan(
                      text: "Ravi Patel!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Today you have 9 New Applications.\nAlso you need to hire 2 new UX Designers. 1\nReact Native Developer",
                style: TextStyle(
                  fontSize: 14,
                  color: Themecolor.black,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Read More",
                style: TextStyle(
                    fontSize: 14,
                    color: Themecolor.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          if (MediaQuery.of(context).size.width >= 620) ...{
            Spacer(),
            // Image.asset(
            //   "assets/notification_image.png",
            //   height: 160,
            // )
          }
        ],
      ),
    );
  }
}