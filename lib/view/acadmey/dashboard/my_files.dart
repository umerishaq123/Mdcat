import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/academy_home_desktop.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/header.dart';
import 'package:mdcat_kawiish/view/acadmey/students/create_student_mobile.dart';
import 'package:mdcat_kawiish/view/acadmey/students/list_of_created_student_tabbar.dart';
import 'package:mdcat_kawiish/view/acadmey/subjects/create_subject_mobile.dart';
import 'package:mdcat_kawiish/view/acadmey/subjects/list_of_created_subjects.dart';
import 'package:mdcat_kawiish/view/acadmey/teachers/create_teacher_mobile.dart';

class FileInfoCardGridView extends StatefulWidget {
  const FileInfoCardGridView({
    super.key,
  });

  @override
  State<FileInfoCardGridView> createState() => _FileInfoCardGridViewState();
}

class _FileInfoCardGridViewState extends State<FileInfoCardGridView> {
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    bool darkMode = isDarkMode(context);

    List<CloudStorageInfo> demoMyFiles = [
      CloudStorageInfo(
        title: "Teachers",
        numOfFiles: 1328,
        svgSrc: Icons.person,
        totalStorage: "1.9GB",
        color: Themecolor.primary,
        percentage: 35,
        onTap: () {
          Navigator.pushNamed(context, RoutesName.accadmeycreateteacher);
        },
      ),
      CloudStorageInfo(
        title: "Students",
        numOfFiles: 1328,
        svgSrc: Icons.person,
        totalStorage: "2.9GB",
        color: const Color(0xFFFFA113),
        percentage: 35,
        onTap: () {
          Navigator.pushNamed(context, RoutesName.accadmeycreateStudent);
        },
      ),
      CloudStorageInfo(
        title: "Subjects",
        numOfFiles: 1328,
        svgSrc: Icons.menu_book_sharp,
        totalStorage: "1GB",
        color: const Color(0xFFA4CDFF),
        percentage: 10,
        onTap: () {
          Navigator.pushNamed(context, RoutesName.createsubject);
        },
      ),
    ];

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (BuildContext context, state) {
                return Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: demoMyFiles.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: defaultPadding,
                        mainAxisSpacing: defaultPadding,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedScreen = index;
                          });
                        },
                        child: FileInfoCard(
                          info: demoMyFiles[index],
                          isSelected: selectedScreen == index,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    Expanded(
                      child: IndexedStack(
                        index: selectedScreen,
                        children: const [
                          ListOfCreatedTeacherTabbar(),
                          ListOfCreatedStudentTabbar(),
                          ListOfCreatedSubjects(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // const SizedBox(width: defaultPadding),
          // Container(
          //   width: 1,
          //   color: Themecolor.primary,
          // ),
          const SizedBox(width: defaultPadding),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: darkMode ? Themecolor.grey : Themecolor.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white10),
              ),
              margin: const EdgeInsets.all(12),
              child: IndexedStack(
                index: selectedScreen,
                children: const [
                  CreateTeacherMobile(),
                  CreateStudentMobile(),
                  CreateSubjectMobile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    super.key,
    required this.info,
    required this.isSelected,
  });

  final CloudStorageInfo info;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isSelected
            ? info.color!.withOpacity(0.5)
            : info.color!.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  info.svgSrc!,
                  color: info.color!,
                ),
              ),
              GestureDetector(
                onTap: info.onTap,
                child: const Icon(
                  Icons.add,
                ),
              )
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${info.numOfFiles} Files",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  info.totalStorage!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CloudStorageInfo {
  final String? title, totalStorage;
  final IconData? svgSrc;
  final int? numOfFiles, percentage;
  final Color? color;
  VoidCallback onTap;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
    required this.onTap,
  });
}
