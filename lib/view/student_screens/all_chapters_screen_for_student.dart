import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_bloc.dart';
import 'package:mdcat_kawiish/data/models/list_of_subjects_for_student_model.dart';
import 'package:mdcat_kawiish/view/student_screens/list_of_topics_screen_for_student.dart';

class AllChaptersScreenForStudent extends StatefulWidget {
  final Subject subject;
  const AllChaptersScreenForStudent({super.key, required this.subject});

  @override
  State<AllChaptersScreenForStudent> createState() =>
      _AllChaptersScreenForStudentState();
}

class _AllChaptersScreenForStudentState
    extends State<AllChaptersScreenForStudent> {
  @override
  void initState() {
    super.initState();
    context
        .read<FetchChaptersBloc>()
        .add(FetchedChaptersForStudentApi(widget.subject.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text('All Chapters for ${widget.subject.name}'),
      ),
      body: BlocBuilder<FetchChaptersBloc, FetchChaptersState>(
        buildWhen: (current, previous) =>
            current.loaingStatus != previous.loaingStatus,
        builder: (BuildContext context, state) {
          switch (state.loaingStatus) {
            case LoadingStatus.loading:
              return const LoadingWidget();
            case LoadingStatus.error:
              return ErrorWidgett(
                errorMessage: state.message.toString(),
                onRetry: () {
                  context.read<FetchChaptersBloc>().add(
                      FetchedChaptersForTeacherApi(
                          widget.subject.id.toString()));
                },
              );
            case LoadingStatus.initial:
              return const SizedBox();
            case LoadingStatus.success:
              final chapters = state.chaptersForSubjectTeacherModel.chapters;
              if (chapters == null || chapters.isEmpty) {
                return const Center(child: Text('No Chapter found.'));
              }
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: chapters.length,
                          itemBuilder: (context, index) {
                            final listofchapter = chapters[index];
                            // final leading = listofchapter.icon;
                            final title = 'Chapter ${index + 1}';
                            final subtitle = listofchapter.chapterName ?? '';
                            final trailings =
                                listofchapter.subject?.grade ?? '';
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(
                                            0.5)), // Border color and opacity
                                    borderRadius: BorderRadius.circular(
                                        10), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.2), // Shadow color
                                        spreadRadius: 1, // Spread radius
                                        blurRadius: 2, // Blur radius
                                        offset: const Offset(
                                            0, 3), // Offset from top-left
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    // leading: leading,
                                    title: Text(title),
                                    subtitle: Text(subtitle),
                                    trailing: Text(trailings),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          SlideTransitionPage(
                                              page: ListOfTopicScreenForStudent(
                                            chapter: chapters[index],
                                            subjectName: widget.subject.name
                                                .toString(),
                                          )));
                                    },
                                  ),
                                ),
                                const GappedWidget(
                                  topGap: 10,
                                )
                              ],
                            );
                          }),
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
