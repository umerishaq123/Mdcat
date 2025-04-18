import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/teacher/create_chap/create_chap_state.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_bloc.dart';

import '../../../bloc/common/fetch_topics/fetch_topics_event.dart';

class AddTopicScreen extends StatefulWidget {
  final String chapterID;
  const AddTopicScreen({super.key, required this.chapterID});

  @override
  AddTopicScreenState createState() => AddTopicScreenState();
}

class AddTopicScreenState extends State<AddTopicScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _videoFilePath;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      setState(() {
        _videoFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Topic"),
        centerTitle: true,
      ),
      body: BlocListener<CreateChapterBloc, CreateChapState>(
        listener: (BuildContext context, state) {
          if (state.loginStatus == LoadingStatus.success) {
            Utils.snackBar('Topic Created.', context);
            context
                .read<FetchTopicsBloc>()
                .add(FetchedTopicsForTeacherApi(widget.chapterID.toString()));
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildCustomTextField(
                    controller: _titleController,
                    hintText: 'Enter topic name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a topic name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  buildCustomTextField(
                    controller: _descriptionController,
                    hintText: 'Enter description',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickVideo,
                    child: const Text('Pick Video'),
                  ),
                  if (_videoFilePath != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Selected Video: $_videoFilePath'),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    // onPressed: _submit,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Map<String, dynamic> data = {
                          'chapterId': widget.chapterID.toString(),
                          'title': _titleController.text,
                          'discription': _descriptionController.text,
                        };

                        Map<String, String> videoPath = {
                          'video': _videoFilePath ?? '',
                        };

                        context
                            .read<CreateChapterBloc>()
                            .add(CreateTopic(data, videoPath));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomTextField({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
