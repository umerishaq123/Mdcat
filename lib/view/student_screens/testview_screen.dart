import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/view/teacher_screens/test/create_test.dart';


class StudentViewScreen extends StatefulWidget {
  final List<Question> questions;

  StudentViewScreen({required this.questions});

  @override
  _StudentViewScreenState createState() => _StudentViewScreenState();
}

class _StudentViewScreenState extends State<StudentViewScreen> {
  int currentQuestionIndex = 0;

  void _selectOption(int index) {
    setState(() {
      widget.questions[currentQuestionIndex].selectedOption = index;
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App - Student View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...question.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String option = entry.value;
              return CheckboxListTile(
                title: Text(option),
                value: question.selectedOption == idx,
                onChanged: (bool? value) {
                  if (value != null && value) {
                    _selectOption(idx);
                  }
                },
              );
            }).toList(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: _previousQuestion,
                    child: Text('Previous'),
                  ),
                if (currentQuestionIndex < widget.questions.length - 1)
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    child: Text('Next'),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
