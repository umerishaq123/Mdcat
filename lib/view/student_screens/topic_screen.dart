import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/config/theme/theme.dart';
import 'package:mdcat_kawiish/core/gap_widget.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  List<listoftopic> topiclist = [
    listoftopic('union', Icon(Icons.menu_book_sharp)),
    listoftopic('intersection', Icon(Icons.menu_book_sharp)),
    listoftopic('derivatives', Icon(Icons.menu_book_sharp)),
    listoftopic('integeration', Icon(Icons.menu_book_sharp))
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                height: height * 0.3,
                width: width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios_new),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.sort_outlined,
                                color: Themecolor.white,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Derivatives and integeration',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: Themecolor.white,
                                        letterSpacing: 1)),
                           const GappedWidget(
                              topGap: 2,
                            ),
                            Text('Last Update 7 Aug 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.white54,
                                        letterSpacing: 1))
                          ],
                        ),
                      ),
                    ])),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
              // color: Themecolor.grey,
                height: height*0.67,
                width: width,
                child: ListView.builder(
                    itemCount: topiclist.length,
                    itemBuilder: (context, index) {
                      final list = topiclist[index];
                      final Title = list.topicname;
                      final leading = list.icon;
                      return Column(
                        children: [
                          Container(
                            // height: height*0.1,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey
                                      .withOpacity(0.5)), // Border color and opacity
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2), // Shadow color
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 2, // Blur radius
                                  offset: Offset(0, 3), // Offset from top-left
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: CircleAvatar(child: leading,
                              maxRadius: 25,),
                              title: Text(Title),
                            ),
                          ),
                          GappedWidget(topGap: 15,)
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class listoftopic {
  final Icon? icon;
  final String topicname;
  listoftopic(this.topicname, this.icon);
}
