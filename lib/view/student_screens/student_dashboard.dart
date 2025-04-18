import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/students/fetch_student_subjects/fetch_my_subjects_for_students_bloc.dart';
import 'package:mdcat_kawiish/bloc/students/fetch_student_subjects/fetch_my_subjects_for_students_event.dart';
import 'package:mdcat_kawiish/bloc/students/fetch_student_subjects/fetch_my_subjects_for_students_state.dart';
import 'package:mdcat_kawiish/view/student_screens/all_chapters_screen_for_student.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context
        .read<FetchMySubjectsForStudentBloc>()
        .add(FetchedMySubjectsForStudentApi());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: TeacherDrawerWidget(
          height: height,
        ),
        body: BlocBuilder<FetchMySubjectsForStudentBloc,
            FetchMySubjectsForStudentState>(
          builder: (BuildContext context, state) {
            switch (state.loadingStatus) {
              case LoadingStatus.initial:
                return const SizedBox();
              case LoadingStatus.loading:
                return const LoadingWidget();
              case LoadingStatus.error:
                return ErrorWidgett(
                  errorMessage: state.message.toString(),
                  onRetry: () {
                    context
                        .read<FetchMySubjectsForStudentBloc>()
                        .add(FetchedMySubjectsForStudentApi());
                  },
                );
              case LoadingStatus.success:
                final subjects = state.listOfMySubjectsForStudentModel.subjects;
                if (subjects == null || subjects.isEmpty) {
                  return const Center(child: Text('No subjects found.'));
                }

                // Convert API subjects to a set for easier comparison
                final Set<String?> apiSubjects =
                    subjects.map((e) => e.name).toSet();

                return Container(
                  height: height,
                  width: width,
                  color: Colors.green[800],
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                        ),
                        height: height * 0.25,
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _scaffoldKey.currentState
                                          ?.openEndDrawer();
                                    },
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            // color: Themecolor.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        height: height * 0.75,
                        width: width,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.1,
                            mainAxisSpacing: 25,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: localSubjects.length,
                          itemBuilder: (context, index) {
                            String subjectName =
                                localSubjects.keys.elementAt(index);
                            bool isUnlocked = apiSubjects.contains(subjectName);

                            return InkWell(
                              onTap: () {
                                if (isUnlocked) {
                                  final subjectDetails = subjects.firstWhere(
                                      (subject) => subject.name == subjectName);
                                  Navigator.push(
                                    context,
                                    SlideTransitionPage(
                                        page: AllChaptersScreenForStudent(
                                            subject: subjectDetails)),
                                  );
                                } else {
                                  Utils.snackBar(
                                      'Contact Adminstration for enrolling you this is subject',
                                      context);
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                          color: Colors.black26)
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      localSubjects[subjectName]!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      subjectName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color: isUnlocked
                                                  ? Colors.black
                                                  : Colors.grey),
                                    ),
                                    if (!isUnlocked)
                                      Text(
                                        'Locked',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.red),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
           
           
           
           
           
            }
          },
        ));
  }
}
