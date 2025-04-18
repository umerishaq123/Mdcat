import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/core/responsive/responsive.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/academy_home_desktop.dart';

class ListOfCreatedTeacherTabbar extends StatefulWidget {
  const ListOfCreatedTeacherTabbar({super.key});

  @override
  State<ListOfCreatedTeacherTabbar> createState() =>
      _ListOfCreatedTeacherTabbarState();
}

class _ListOfCreatedTeacherTabbarState
    extends State<ListOfCreatedTeacherTabbar> {
  @override
  void initState() {
    super.initState();
    context
        .read<FetchAllTeachersForAcademyBloc>()
        .add(FetchedAllTeachersForAcademyApi());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Responsive.isDesktop(context)
            ? isDarkMode(context)
                ? Themecolor.grey
                : Themecolor.white
            : null,
        appBar: AppBar(
          title: const Text('Created Teachers'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.05),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Themecolor.primary)),
              child: TabBar(
                isScrollable: Responsive.isDesktop(context) ? false : true,
                indicatorColor: Themecolor.primary,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                tabs: const [
                  Text('9th'),
                  Text('10th'),
                  Text('1st year'),
                  Text('2nd year'),
                ],
                indicator: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Themecolor.primary, // Change this color as needed
                ),

                indicatorSize: TabBarIndicatorSize.tab,
                // Set the size of the indicator
                labelColor: Themecolor.white,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildTeacherListTab(context, '9th'),
            buildTeacherListTab(context, '10th'),
            buildTeacherListTab(context, '1st year'),
            buildTeacherListTab(context, '1nd year'),
          ],
        ),
        floatingActionButton: Responsive.isDesktop(context)
            ? const SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, RoutesName.accadmeycreateStudent);
                },
                child: const Icon(Icons.add),
              ),
      ),
    );
  }

  Widget buildTeacherListTab(BuildContext context, String grade) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child:
              BlocBuilder<FetchAllTeachersForAcademyBloc, FetchAllTeacherState>(
                  builder: (BuildContext context, state) {
            switch (state.loadingStatus) {
              case LoadingStatus.loading:
                return const LoadingWidget();
              case LoadingStatus.error:
                return ErrorWidgett(
                    errorMessage: state.message.toString(), onRetry: () {});
              case LoadingStatus.initial:
                return const SizedBox();
              case LoadingStatus.success:
                return ListView.builder(
                  itemCount: subjectList.length,
                  itemBuilder: (context, index) {
                    final listofsubjects = subjectList[index];
                    final leading = listofsubjects.icon;
                    final nameOfSubjects = listofsubjects.name ?? '';
                    final subjectGrade = grade;
                    final subject = listofsubjects.subject ?? '';
                    final filteredStudents =
                        state.fetchAllTeachersModel.teachers
                                ?.where(
                                  (teacher) =>
                                      // student.grade == grade &&
                                      teacher.subjects!.contains(subject),
                                )
                                .toList() ??
                            [];
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(
                                    0.5)), // Border color and opacity
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius: 1, // Spread radius
                                blurRadius: 2, // Blur radius
                                offset:
                                    const Offset(0, 3), // Offset from top-left
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Icon(leading),
                            title: Text(nameOfSubjects),
                            subtitle: Text(
                                'Total Teachers ${filteredStudents.length}'),
                            // trailing: Text(subject),
                            onTap: () {
                              navigateToDetailScreen(
                                  context, subjectGrade, subject);
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    );
                  },
                );
            }
          })),
        ],
      ),
    );
  }

  void navigateToDetailScreen(
      BuildContext context, String? grade, String? subjectName) {
    final state = context.read<FetchAllTeachersForAcademyBloc>().state;
    final filteredTeachers = state.fetchAllTeachersModel.teachers
            ?.where(
              (student) =>
                  // student.grade == grade &&
                  student.subjects!.contains(subjectName),
            )
            .toList() ??
        [];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListOfCreatedTecherByClass(
          teachers: filteredTeachers,
          grade: grade!,
          subject: subjectName!,
        ),
      ),
    );
  }
}

class SubjectInformation {
  final IconData? icon;
  final String? name;
  // final String? grade;
  final String? subject;
  SubjectInformation({required this.icon, this.name, this.subject});
}
