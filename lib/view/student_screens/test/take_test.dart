import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_test/fetch_test_bloc.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_test/fetch_test_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_test/fetch_test_state.dart';
import 'package:mdcat_kawiish/view/student_screens/test/attempt_test.dart';


class TakeTestScreen extends StatefulWidget {
  final String chapterId;

  const TakeTestScreen({Key? key, required this.chapterId}) : super(key: key);

  @override
  State<TakeTestScreen> createState() => _TakeTestScreenState();
}

class _TakeTestScreenState extends State<TakeTestScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FetchTestBloc>().add(FetchedTestForStudentApi(widget.chapterId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Test'),
      ),
      body: BlocBuilder<FetchTestBloc, FetchTestState>(
        builder: (context, state) {
          switch (state.loadingStatus) {
            case LoadingStatus.initial:
              return const Center(child: Text('Welcome to the Test'));
            case LoadingStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case LoadingStatus.error:
              return ErrorWidgett(
                errorMessage: state.message ?? 'An error occurred.',
                onRetry: () {
                  context.read<FetchTestBloc>().add(FetchedTestForStudentApi(widget.chapterId));
                },
              );
            case LoadingStatus.success:
              final tests = state.fetchChapterTestModel?.tests ?? [];
              if (tests.isEmpty) {
                return const Center(child: Text('No Test found.'));
              }
              return ListView.builder(
                itemCount: tests.length,
                itemBuilder: (context, index) {
                  final test = tests[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the test attempt screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttemptTestScreen(test: test),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text('Test ${index + 1}: ${test.testName}'),
                      subtitle: Text('${test.questions?.length ?? 0} Questions'),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
