import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/view/acadmey/dashboard/academy_home_desktop.dart';

class ListOfCreatedSubjects extends StatefulWidget {
  const ListOfCreatedSubjects({super.key});

  @override
  State<ListOfCreatedSubjects> createState() => _ListOfCreatedSubjectsState();
}

class _ListOfCreatedSubjectsState extends State<ListOfCreatedSubjects> {
  @override
  void initState() {
    super.initState();
    context.read<FetchAllSubjectForAcademyBloc>().add(FetchedAllSubjectsApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Responsive.isDesktop(context)
          ? isDarkMode(context)
              ? Themecolor.grey
              : Themecolor.white
          : null,
      appBar: AppBar(
        title: const Text('Created Subject'),
      ),
      body: BlocBuilder<FetchAllSubjectForAcademyBloc, FetchSubjectState>(
        builder: (BuildContext context, FetchSubjectState state) {
          switch (state.loadingStatus) {
            case LoadingStatus.loading:
              return const LoadingWidget();
            case LoadingStatus.error:
              return ErrorWidgett(
                  errorMessage: state.message.toString(), onRetry: () {});
            case LoadingStatus.initial:
              return const SizedBox();
            case LoadingStatus.success:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.fetchAllSubjectModel.subjects?.length,
                  itemBuilder: (context, index) {
                    final subjects =
                        state.fetchAllSubjectModel.subjects?[index];
                    final subjectname = subjects?.subjectName ?? '';
                    final grade = subjects?.grade ?? '';
                    final subjectid = subjects?.id ?? '';
                    return Container(
                      margin: const EdgeInsets.all(8),
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
                            offset: const Offset(0, 3), // Offset from top-left
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(subjectname),
                        trailing: Text(grade),
                        onTap: () {
                          navigateToDetailScreen(
                              context, grade, subjectname, subjectid);
                        },
                      ),
                    );
                  },
                ),
              );
          }
        },
      ),
      floatingActionButton: Responsive.isDesktop(context)
          ? const SizedBox()
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.createsubject);
              },
              child: const Icon(Icons.add),
            ),
    );
  }

  void navigateToDetailScreen(BuildContext context, String? grade,
      String? subjectName, String subjectId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListOfStudentBySubject(
                subjectName: subjectName ?? '',
                Grade: grade ?? '',
                Subjectid: subjectId,
              )),
    );
  }
}
