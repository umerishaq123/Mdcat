import 'package:mdcat_kawiish/view/acadmey/teachers/create_teacher_desktop.dart';
import 'package:mdcat_kawiish/view/acadmey/teachers/create_teacher_mobile.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class CreateTeacher extends StatefulWidget {
  const CreateTeacher({super.key});

  @override
  State<CreateTeacher> createState() => _CreateTeacherState();
}

class _CreateTeacherState extends State<CreateTeacher> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: CreateTeacherMobile(),
        tablet: CreateTeacherMobile(),
        desktop: CreateTeacherDesktop());
  }
}
