import 'package:flutter/material.dart';

class CreateStudentTeacher extends StatefulWidget {
  @override
  _CreateStudentTeacherState createState() => _CreateStudentTeacherState();
}

class _CreateStudentTeacherState extends State<CreateStudentTeacher> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _teacherNameController = TextEditingController();

  void _createStudent() {
    String studentName = _studentNameController.text;
    // Add code to create student
    print('Creating student: $studentName');
    _studentNameController.clear();
  }

  void _createTeacher() {
    String teacherName = _teacherNameController.text;
    // Add code to create teacher
    print('Creating teacher: $teacherName');
    _teacherNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _studentNameController,
              decoration: InputDecoration(
                labelText: 'Student Name',
              ),
            ),
            SizedBox(height: 16.0),
           ElevatedButton(
              onPressed: _createStudent,
              child: Text('Create Student'),
            ),
            SizedBox(height: 32.0),
            TextField(
              controller: _teacherNameController,
              decoration: InputDecoration(
                labelText: 'Teacher Name',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _createTeacher,
              child: Text('Create Teacher'),
            ),
          ],
        ),
      ),
    );
  }
}
