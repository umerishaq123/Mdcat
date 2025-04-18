
import 'package:mdcat_kawiish/all_imports.dart';

class ListOfStudentBySubject extends StatefulWidget {
  final String subjectName;
  final String Grade;
  final String Subjectid;
  
  const ListOfStudentBySubject({
    super.key,
    required this.subjectName,
    required this.Grade,
    required this.Subjectid,
  });

  @override
  State<ListOfStudentBySubject> createState() => _ListOfStudentBySubjectState();
}

class _ListOfStudentBySubjectState extends State<ListOfStudentBySubject> {
  @override
  void initState() {
    super.initState();
    context.read<FetchAllSubjectForAcademyBloc>().add(FetchedStudentsForSubjectApi(widget.Subjectid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subjectName} - ${widget.Grade}'),
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
              final students = state.fetchAllStudentBySubject?.subject?.students ?? [];
              if (students.isEmpty) {
                return const Center(child: Text("No students found for this subject"));
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    final studentName = student.name ?? 'Unknown';
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5)), // Border color and opacity
                            borderRadius: BorderRadius.circular(10), // Border radius
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
                            title: Text(studentName),
                            trailing: Text(widget.subjectName),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
