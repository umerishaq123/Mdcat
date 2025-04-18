import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/teacher/create_chap/create_chap_state.dart';
import 'package:mdcat_kawiish/data/models/chapters_for_subjects_model_teacher.dart';

class CreateChapterTestScreen extends StatefulWidget {
  final String subjectName;
  final Chapter chapter;
  const CreateChapterTestScreen({super.key, required this.chapter, required this.subjectName});

  @override
  CreateChapterTestScreenState createState() => CreateChapterTestScreenState();
}

class CreateChapterTestScreenState extends State<CreateChapterTestScreen> {
  List<Question> questions = [];

  void _addQuestion(Question question) {
    setState(() {
      questions.add(question);
    });
  }

  void _removeQuestion(int index) {
    setState(() {
      questions.removeAt(index);
    });
  }

  Future<void> _uploadTest() async {
    final requestBody = {
      "subjectName": widget.subjectName,
      "chapterId": widget.chapter.id, // Update with actual chapterId
      "testName": widget.chapter.chapterName.toString(),
      "questions": questions
          .map((q) => {
                "question": q.question,
                "options": q.options,
                "correctAnswer": q.correctOption,
              })
          .toList(),
      "status": "pending",
    };
    context.read<CreateChapterBloc>().add(CreateChapterWiseTest(requestBody));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Test'),
      ),
      body: BlocListener<CreateChapterBloc, CreateChapState>(
        listener: (BuildContext context, state) {
          if (state.loginStatus == LoadingStatus.success) {
            Utils.snackBar('Test Created.', context);

            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  constraints:
                                      BoxConstraints(maxWidth: width / 1.3),
                                  child: Text(
                                    'Q no ${index + 1}: ${questions[index].question}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    _removeQuestion(index);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 10.0,
                              children: questions[index]
                                  .options
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int optionIndex = entry.key;
                                String option = entry.value;
                                return Text('${optionIndex + 1}: $option');
                              }).toList(),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Correct: ${questions[index].correctOption + 1}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GestureDetector(
                onTap: _uploadTest,
                child: Container(
                  height: height * 0.07,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: Themecolor.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Upload',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Themecolor.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddQuestionDialog(context);
        },
      ),
    );
  }

  void _showAddQuestionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddQuestionDialog(
          addQuestion: _addQuestion,
        );
      },
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctOption;
  int? selectedOption;

  Question({
    required this.question,
    required this.options,
    required this.correctOption,
    this.selectedOption,
  });
}

class AddQuestionDialog extends StatefulWidget {
  final Function(Question) addQuestion;

  AddQuestionDialog({super.key, required this.addQuestion});

  @override
  AddQuestionDialogState createState() => AddQuestionDialogState();
}

class AddQuestionDialogState extends State<AddQuestionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _optionControllers =
      List.generate(4, (index) => TextEditingController());

  int? _correctOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Question'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _questionController,
                decoration: InputDecoration(labelText: 'Question'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a question';
                  }
                  return null;
                },
              ),
              const GappedWidget(
                topGap: 10,
              ),
              ..._optionControllers.asMap().entries.map((entry) {
                int idx = entry.key;
                TextEditingController controller = entry.value;
                return TextFormField(
                  controller: controller,
                  decoration: InputDecoration(labelText: 'Option ${idx + 1}'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an option';
                    }
                    return null;
                  },
                );
              }).toList(),
              const GappedWidget(
                topGap: 10,
              ),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Correct Option'),
                items: List.generate(4, (index) => index).map((index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text('Option ${index + 1}'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _correctOption = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select the correct option';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.addQuestion(
                Question(
                  question: _questionController.text,
                  options: _optionControllers
                      .map((controller) => controller.text)
                      .toList(),
                  correctOption: _correctOption!,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: Text('Done'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    _optionControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
