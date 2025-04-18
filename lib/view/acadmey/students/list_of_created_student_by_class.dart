import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/all_students_model.dart';

class ListOfCreatedStudentByClass extends StatelessWidget {
  final List<Students> students;
  final String grade;
  final String subject;

  const ListOfCreatedStudentByClass({
    super.key,
    required this.students,
    required this.grade,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$grade - $subject Students'),
      ),
      body: students.isEmpty
          ? const Center(child: Text('No students found'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                // return Container(child: Column(),);
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey
                            .withOpacity(0.5)), // Border color and opacity
                    borderRadius: BorderRadius.circular(10), // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset: const Offset(0, 3), // Offset from top-left
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: NetworkImageWidget(
                        imageUrl: student.profilePic.toString()),
                    //  CircleAvatar(
                    //   backgroundImage:
                    //       NetworkImage(student.profilePic.toString()),
                    // ),
                    title: Text(student.name ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${student.email}'),
                        Text('Phone Number: ${student.phone}'),
                        Text('Grade: ${student.grade}'),
                        Text('Subjects: ${student.subjects}'),
                      ],
                    ),
                    trailing: Text(student.gender.toString()),
                  ),
                );
              },
            ),
    );
  }
}
