import 'package:mdcat_kawiish/all_imports.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String, dynamic>> answers;
  final List<String> questions;
  final List<List<String>> options;
  final List<int> correctAnswers;
  final Function() onRetake;

  const ResultScreen({
    super.key,
    required this.answers,
    required this.questions,
    required this.options,
    required this.correctAnswers,
    required this.onRetake,
  });

  @override
  Widget build(BuildContext context) {
    int totalScore = _calculateScore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Results'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: answers.length,
              itemBuilder: (context, index) {
                final answer = answers[index];
                final questionIndex = answer['questionIndex'] as int;
                final selectedAnswerIndex = answer['answer'] as int;
                final correctAnswerIndex = correctAnswers[questionIndex];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${index + 1}:',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const GappedWidget(),
                        Text(
                          questions[questionIndex],
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Correct Answer:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          options[questionIndex][correctAnswerIndex],
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your Answer:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedAnswerIndex == correctAnswerIndex
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Text(
                          options[questionIndex][selectedAnswerIndex],
                          style: TextStyle(
                            color: selectedAnswerIndex == correctAnswerIndex
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Total Score: $totalScore'),
                  const GappedWidget(),
                  ElevatedButton(
                    onPressed: () {
                      onRetake();
                      Navigator.pop(context);
                    },
                    child: const Text('Retake Test'),
                  ),
                  const GappedWidget(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          RoutesName.studentDashboard, (route) => false);
                    },
                    child: const Text('Home'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < answers.length; i++) {
      final answer = answers[i];
      final questionIndex = answer['questionIndex'] as int;
      final selectedAnswerIndex = answer['answer'] as int;
      final correctAnswerIndex = correctAnswers[questionIndex];
      if (selectedAnswerIndex == correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }
}
