import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/all_teacher_model.dart';

class ListOfCreatedTecherByClass extends StatelessWidget {
  final List<Teachers> teachers;
  final String grade;
  final String subject;

  const ListOfCreatedTecherByClass({super.key, 
    required this.teachers,
    required this.grade,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$grade - $subject Teacher'),
      ),
      body: teachers.isEmpty
          ? const Center(child: Text('No Teacher found'))
          : ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                final student = teachers[index];
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
                    leading: NetworkImageWidget(imageUrl: student.profilePic.toString()),
                    // CircleAvatar(
                    //   backgroundImage:
                    //       NetworkImage(student.profilePic.toString()),
                    // ),
                    title: Text(student.name ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${student.email}'),
                        Text('Phone Number: ${student.phone}'),
                        // Text('Grade: ${student.grade}'),
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
