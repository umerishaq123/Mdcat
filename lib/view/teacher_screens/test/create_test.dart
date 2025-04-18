import 'package:mdcat_kawiish/all_imports.dart';

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
  _AddQuestionDialogState createState() => _AddQuestionDialogState();
}

class _AddQuestionDialogState extends State<AddQuestionDialog> {
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
            const  GappedWidget(
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
