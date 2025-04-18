import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/students/attempt_test/attempt_test_bloc.dart';
import 'package:mdcat_kawiish/bloc/students/attempt_test/attempt_test_event.dart';
import 'package:mdcat_kawiish/bloc/students/attempt_test/attempt_test_state.dart';
import 'package:mdcat_kawiish/data/models/fetch_test_model.dart';
import 'package:mdcat_kawiish/view/student_screens/test/result_screen.dart';

class AttemptTestScreen extends StatefulWidget {
  final Test test;

  const AttemptTestScreen({super.key, required this.test});

  @override
  AttemptTestScreenState createState() => AttemptTestScreenState();
}

class AttemptTestScreenState extends State<AttemptTestScreen> {
  late List<int?> selectedAnswers;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.test.questions!.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attempt Test'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.test.testName.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.test.questions!.length,
                itemBuilder: (context, index) {
                  List<String>? options = widget.test.questions![index].options;

                  return ListTile(
                    title:
                        Text(widget.test.questions![index].question.toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: options != null
                          ? options.asMap().entries.map((entry) {
                              return RadioListTile<int?>(
                                title: Text(entry.value),
                                value: entry.key,
                                groupValue: selectedAnswers[index],
                                onChanged: (value) {
                                  setState(() {
                                    selectedAnswers[index] = value;
                                  });
                                },
                              );
                            }).toList()
                          : [],
                    ),
                    trailing: selectedAnswers[index] == null
                        ? Text(
                            'Required',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error),
                          )
                        : null,
                  );
                },
              ),
              BlocListener<AttemptTestBloc, AttemptTestState>(
                listener: (BuildContext context, state) {
                  if (state.loginStatus == LoadingStatus.success) {
                    // Gather the selected answers and question indices
                    List<Map<String, dynamic>> answers = [];
                    for (int i = 0; i < selectedAnswers.length; i++) {
                      if (selectedAnswers[i] != null) {
                        answers.add({
                          'questionIndex': i,
                          'answer': selectedAnswers[i],
                        });
                      }
                    }
                    Utils.snackBar(state.message, context);
                    // Navigate to the ResultScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          answers: answers,
                          questions: widget.test.questions!
                              .map((q) => q.question!)
                              .toList(),
                          options: widget.test.questions!
                              .map((q) => q.options!)
                              .toList(),
                          correctAnswers: widget.test.questions!
                              .map((q) => q.correctAnswer!)
                              .toList(),
                          onRetake: _resetSelectedAnswers,
                        ),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitAnswers();
                    } else {
                      Utils.snackBar('Please answer all questions', context);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitAnswers() {
    // Check for unanswered questions
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please answer all questions'),
          ),
        );
        return;
      }
    }

    // Gather the selected answers and question indices
    List<Map<String, dynamic>> answers = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] != null) {
        answers.add({
          'questionIndex': i,
          'answer': selectedAnswers[i],
        });
      }
    }

    Map<String, dynamic> submission = {
      'testId': widget.test.id,
      'answers': answers,
    };
    print(submission);
    context.read<AttemptTestBloc>().add(AttemptTestApi(submission));
  }

  // Inside AttemptTestScreenState
  void _resetSelectedAnswers() {
    setState(() {
      selectedAnswers = List<int?>.filled(widget.test.questions!.length, null);
    });
  }
}
