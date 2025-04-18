import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/config/constants/assetspath.dart';
import 'package:mdcat_kawiish/view/student_screens/topic_screen.dart';

class Chapterslist extends StatefulWidget {
    const Chapterslist({super.key,});


  @override
  State<Chapterslist> createState() => _ChapterslistState();
}

class _ChapterslistState extends State<Chapterslist> {
  List imgdata = [
    AssetPaths.mathimg,
    AssetPaths.mathimg,
    AssetPaths.mathimg,
    AssetPaths.mathimg,
    AssetPaths.mathimg,
    AssetPaths.mathimg,
  
  ];
  List<String> titles = [
    'Scaller',
    'Derivatives',
    'union',
    'probility',
    'integeration',
    'geometry',
    
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Themecolor.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius:const BorderRadius.only(
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
                          onTap: (){
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
                        Text('Dashboard',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Themecolor.white, letterSpacing: 1)),
                        GappedWidget(
                          topGap: 2,
                        ),
                        Text('Last Update 7 Aug 2023',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.white54, letterSpacing: 1))
                      ],
                    ),
                  ),
                      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  // Add your search logic here
                },
              ),
            ),
                ],
              ),
            ),
        
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Themecolor.white,
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(30),
                    //     topRight: Radius.circular(30))),
                ),
                height: height * 0.75,
                width: width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount:titles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        InkWellContainer(context, titles[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Themecolor.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  color: Colors.black26)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height * 0.12,
                              width: width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors
                                    .grey[300], // Inner container decoration
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                 imgdata[index],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${titles[index]} - ${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 15,
                                    ),
                                    child: Container(
                                      height: height * 0.03,
                                      width: width * 0.1,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15)),
                                          color: Colors.green[800]),
                                      child:
                                          Icon(Icons.remove_red_eye_outlined),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void InkWellContainer(context,String title) {
    if (title == 'Scaller') {
  Navigator.pushNamed(context, RoutesName.listoftopic);
    } else if (title == 'derivative') {
    } else if (title == 'union') {
    } else if (title == 'integeration') {

    }
  }
}
