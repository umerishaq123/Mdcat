import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_bloc.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_bloc.dart';
import 'package:mdcat_kawiish/data/models/chapters_for_subjects_model_teacher.dart';
import 'package:mdcat_kawiish/view/student_screens/test/take_test.dart';

class ListOfTopicScreenForStudent extends StatefulWidget {
  final Chapter chapter;
  final String subjectName;
  const ListOfTopicScreenForStudent(
      {super.key, required this.chapter, required this.subjectName});

  @override
  State<ListOfTopicScreenForStudent> createState() =>
      _ListOfTopicScreenForStudentState();
}

class _ListOfTopicScreenForStudentState
    extends State<ListOfTopicScreenForStudent> {
  @override
  void initState() {
    super.initState();
    context
        .read<FetchTopicsBloc>()
        .add(FetchedTopicsForStudentApi(widget.chapter.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Topics"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: height * 0.06,
              width: width * 0.2,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  // Define the action for the button here
                  _showNotes(context);
                },
                child: const Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          16 // Set the text color to white to match the AppBar
                      ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: height * 0.06,
              width: width * 0.2,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      SlideTransitionPage(
                          page: TakeTestScreen(
                        chapterId: widget.chapter.id.toString(),
                      )));
                },
                child: const Text(
                  "Take Test",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          16 // Set the text color to white to match the AppBar
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<FetchTopicsBloc, FetchTopicsState>(
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
                  context.read<FetchTopicsBloc>().add(
                      FetchedTopicsForStudentApi(widget.chapter.id.toString()));
                },
              );

            case LoadingStatus.success:
              final topics = state.topicsForTeacherModel.topics;
              if (topics == null || topics.isEmpty) {
                return const Center(child: Text('No Topics found.'));
              }
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: topics.length,
                        itemBuilder: (context, index) {
                          final subject = topics[index];
                          final title = subject.title ?? '';
                          final description = subject.discription ?? '';
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
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: const Icon(Icons.book),
                                  title: Text(title),
                                  subtitle: Text(description),
                                  onTap: () {},
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

  void _showNotes(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Trigger the data fetch
        context
            .read<FetchNotesBloc>()
            .add(FetchedNotesForStudentApi(widget.chapter.id.toString()));
        return AlertDialog(
          title: const Text('Notes'),
          content: BlocBuilder<FetchNotesBloc, FetchNotesState>(
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
                      context.read<FetchNotesBloc>().add(
                          FetchedNotesForStudentApi(
                              widget.chapter.id.toString()));
                    },
                  );
                case LoadingStatus.success:
                  final notes = state.fetchNotesForTeacher.notes;
                  if (notes == null || notes.isEmpty) {
                    return const Center(child: Text('No Notes found.'));
                  }
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: notes.map((note) {
                        return ListTile(
                          title: Text(note.title ?? 'No Title'),
                          subtitle: Text(note.description ?? 'No Description'),
                          onTap: () {
                            Navigator.push(
                                context,
                                SlideTransitionPage(
                                    page: PDFViewerScreen(
                                        pdfUrl: note.file.toString())));
                          },
                        );
                      }).toList(),
                    ),
                  );
              }
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
