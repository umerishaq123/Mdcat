import 'package:mdcat_kawiish/view/acadmey/subjects/create_subject_desktop.dart';
import 'package:mdcat_kawiish/view/acadmey/subjects/create_subject_mobile.dart';
import 'package:mdcat_kawiish/view/login/login_desktop.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/view/login/login_mobile.dart';

class CreateSubject extends StatefulWidget {
  const CreateSubject({super.key});

  @override
  State<CreateSubject> createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  @override
  Widget build(BuildContext context) {
 
    return const Responsive(
        mobile: CreateSubjectMobile(), tablet: CreateSubjectMobile(), desktop: CreateSubjectDesktop());
  }
}