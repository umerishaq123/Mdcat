import 'package:file_picker/file_picker.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/teacher/create_chap/create_chap_bloc.dart';
import 'package:mdcat_kawiish/bloc/teacher/create_chap/create_chap_event.dart';
import 'package:mdcat_kawiish/bloc/teacher/create_chap/create_chap_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_bloc.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_bloc.dart';
import 'package:mdcat_kawiish/config/constants/assetspath.dart';
import 'package:mdcat_kawiish/config/routes/slide_transition_page.dart';
import 'package:mdcat_kawiish/core/components/pdf_view_screen.dart';
import 'package:mdcat_kawiish/data/models/chapters_for_subjects_model_teacher.dart';
import 'package:mdcat_kawiish/view/teacher_screens/test/create_chapter_test_screen.dart';
import 'package:mdcat_kawiish/view/teacher_screens/topics/add_topic_screen.dart';

class ListOfTopicScreenForTeacher extends StatefulWidget {
  final Chapter chapter;
  final String subjectName;
  const ListOfTopicScreenForTeacher(
      {super.key, required this.chapter, required this.subjectName});

  @override
  State<ListOfTopicScreenForTeacher> createState() => _ListOfTopicScreenForTeacherState();
}

class _ListOfTopicScreenForTeacherState extends State<ListOfTopicScreenForTeacher> {
  @override
  void initState() {
    super.initState();
    context
        .read<FetchTopicsBloc>()
        .add(FetchedTopicsForTeacherApi(widget.chapter.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Topic"),
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
                      FetchedTopicsForTeacherApi(widget.chapter.id.toString()));
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "CreateTest", // Unique hero tag
            isExtended: true,
            onPressed: () {
              Navigator.push(
                  context,
                  SlideTransitionPage(
                      page: CreateChapterTestScreen(
                    chapter: widget.chapter,
                    subjectName: widget.subjectName.toString(),
                  )));
            },
            icon: const Icon(Icons.add),

            label: Text(
              'Test',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          FloatingActionButton(
              heroTag: "addNotes", // Unique hero tag
              isExtended: true,
              onPressed: () {
                _showDialogs(context);
              },
              child: Text(
                'Add Notes',
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          const GappedWidget(
            rightGap: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  SlideTransitionPage(
                      page: AddTopicScreen(
                    chapterID: widget.chapter.id.toString(),
                  )));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _showDialogs(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController chaptertitleController =
        TextEditingController();
    final TextEditingController chapterdescriptioncontroller =
        TextEditingController();
    String? filePath;
    String? fileName;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: AlertDialog(
                title: Image.asset(AssetPaths.uploadfiles),
                content: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildCustomTextField(
                            controller: chaptertitleController,
                            hintText: 'Enter a title'),
                        const SizedBox(height: 20),
                        buildCustomTextField(
                            controller: chapterdescriptioncontroller,
                            hintText: 'Enter a description'),
                        const SizedBox(height: 20),
                        if (filePath == null)
                          ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'doc', 'docx'],
                              );

                              if (result != null) {
                                setState(() {
                                  filePath = result.files.single.path;
                                  fileName = result.files.single.name;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Selected file: $fileName')),
                                );
                              }
                            },
                            child: const Text('Upload File'),
                          )
                        else
                          Column(
                            children: [
                              Text('Selected file: $fileName'),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    filePath = null;
                                    fileName = null;
                                  });
                                },
                                child: const Text('Remove File'),
                              ),
                            ],
                          ),
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
                  BlocConsumer<CreateChapterBloc, CreateChapState>(
                    listener: (context, state) {
                      print("::: the status issss :${state.loginStatus}");
                      // Check if the loading status is success
                      if (state.loginStatus == LoadingStatus.success) {
                        Utils.snackBar(state.message, context);
                      } else if (state.loginStatus == LoadingStatus.error) {
                        Utils.snackBar(state.message, context);
                      }
                    },
                    builder: (BuildContext context, state) {
                      return TextButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Map<String, dynamic> data = {
                              "chapterId": widget.chapter.id.toString(),
                              "title": chaptertitleController.text,
                              'description': chapterdescriptioncontroller.text,
                              // Include the file path in the data
                            };
                            Map<String, String> filepaths = {
                              'file': filePath.toString(),
                            };

                            context
                                .read<CreateChapterBloc>()
                                .add(AddNotes(data, filepaths));

                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showNotes(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Trigger the data fetch
        context
            .read<FetchNotesBloc>()
            .add(FetchedNotesForTeacherApi(widget.chapter.id.toString()));
        return AlertDialog(
          title: const Text('Notes'),
          content:
              BlocBuilder<FetchNotesBloc, FetchNotesState>(
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
                          FetchedNotesForTeacherApi(
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
                            print('::: note pdf url ${note.file.toString()}');
                            Navigator.push(context, SlideTransitionPage(page: PDFViewerScreen(pdfUrl: note.file.toString())));
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
