
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/teacher/fetch_my_subjects/fetch_my_subjects_bloc.dart';
import 'package:mdcat_kawiish/bloc/teacher/fetch_my_subjects/fetch_my_subjects_event.dart';
import 'package:mdcat_kawiish/bloc/teacher/fetch_my_subjects/fetch_my_subjects_state.dart';


class TeacherDashboardMobile extends StatefulWidget {
  const TeacherDashboardMobile({super.key});

  @override
  State<TeacherDashboardMobile> createState() => _TeacherDashboardMobileState();
}

class _TeacherDashboardMobileState extends State<TeacherDashboardMobile> {
  @override
  void initState() {
    super.initState();
    context
        .read<FetchMySubjectsForTeacherBloc>()
        .add(FetchedMySubjectsForTeacherApi());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: TeacherDrawerWidget(height: height),
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        centerTitle: true,
      ),
      body: BlocBuilder<FetchMySubjectsForTeacherBloc,
          FetchMySubjectsForTeacherState>(
        builder: (BuildContext context, state) {
          switch (state.loaingStatus) {
            case LoadingStatus.initial:
              return const SizedBox();
            case LoadingStatus.loading:
              return const LoadingWidget();
            case LoadingStatus.error:
              return ErrorWidgett(
                errorMessage: state.message.toString(),
                onRetry: () {
                  context
                      .read<FetchMySubjectsForTeacherBloc>()
                      .add(FetchedMySubjectsForTeacherApi());
                },
              );
            case LoadingStatus.success:
              final subjects = state.listOfMySubjectsForTeacherModel.subjects;
              if (subjects == null || subjects.isEmpty) {
                return const Center(child: Text('No subjects found.'));
              }
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          final subject = subjects[index];
                          final title = subject.subjectName ?? '';
                          final grade = subject.grade ?? '';
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: const Icon(Icons.book),
                                  title: Text(title),
                                  subtitle: Text(grade),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        SlideTransitionPage(
                                            page: AllChaptersScreenForTeachers(
                                          subject: subject,
                                        )));
                                    // Navigator.pushNamed(
                                    //     context, RoutesName.createChapter);
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}