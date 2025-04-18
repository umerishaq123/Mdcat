import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/teacher/create_chap/create_chap_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_bloc.dart';
import 'package:mdcat_kawiish/data/models/list_of_subjects_for_teacher_model.dart';

class AllChaptersScreenForTeachers extends StatefulWidget {
  final Subject subject;
  const AllChaptersScreenForTeachers({super.key, required this.subject});

  @override
  State<AllChaptersScreenForTeachers> createState() => _AllChaptersScreenForTeachersState();
}

class _AllChaptersScreenForTeachersState extends State<AllChaptersScreenForTeachers> {
  String? filePath;
  @override
  void initState() {
    super.initState();
    context
        .read<FetchChaptersBloc>()
        .add(FetchedChaptersForTeacherApi(widget.subject.id.toString()));
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
          title: const Text('All Chapters'),

          // centerTitle: true,
        ),
        body: BlocListener<CreateChapterBloc, CreateChapState>(
          listener: (BuildContext context, state) {
            // if (state.loginStatus == LoadingStatus.error) {
            //   Utils.snackBar(state.message, context);
            // }

            if (state.loginStatus == LoadingStatus.success) {
              Utils.snackBar('Created.', context);
              context.read<FetchChaptersBloc>().add(
                  FetchedChaptersForTeacherApi(widget.subject.id.toString()));
            }
          },
          child: BlocBuilder<FetchChaptersBloc,
              FetchChaptersState>(
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
                  final chapters =
                      state.chaptersForSubjectTeacherModel.chapters;
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
                                final subtitle =
                                    listofchapter.chapterName ?? '';
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
                                            color: Colors.grey.withOpacity(
                                                0.2), // Shadow color
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
                                                  page: ListOfTopicScreenForTeacher(
                                                chapter: chapters[index],
                                                subjectName: widget
                                                    .subject.subjectName
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
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const GappedWidget(
                rightGap: 10,
              ),
              FloatingActionButton.extended(
                label: Text(
                  'Chapter',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                heroTag: "addIcon", // Unique hero tag
                onPressed: () {
                  _showDialog(context);
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ));
  }

  void _showDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController chapterNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Details'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildCustomTextField(
                      controller: chapterNameController,
                      hintText: 'enter a chapter name'),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Map<String, dynamic> data = {
                    "chapterName": chapterNameController.text,
                    "subjectId": widget.subject.id.toString()
                  };
                  context.read<CreateChapterBloc>().add(CreateChapterr(data));

                  Navigator.pop(context);
                  context.read<FetchChaptersBloc>().add(
                      FetchedChaptersForTeacherApi(
                          widget.subject.id.toString()));
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class CreateChapterlist {
  final Icon? icon;
  final String? chapterName;
  final String? teacherName;
  final String? grade;
  CreateChapterlist(
      {this.icon, this.chapterName, this.teacherName, this.grade});
}
