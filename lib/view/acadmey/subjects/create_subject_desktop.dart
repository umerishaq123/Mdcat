import 'package:mdcat_kawiish/all_imports.dart';

class CreateSubjectDesktop extends StatefulWidget {
  const CreateSubjectDesktop({super.key});

  @override
  State<CreateSubjectDesktop> createState() => _CreateSubjectDesktopState();
}

class _CreateSubjectDesktopState extends State<CreateSubjectDesktop> {
  late CreateSubjectBloc _createSubjectBloc;
  late FetchAllTeachersForAcademyBloc _fetchAllTeachersForAcademyBloc;

  final TextEditingController _emailController = TextEditingController();
  String? subject;
  String? grade;
  String? selectedEmail;

  @override
  void initState() {
    _createSubjectBloc = CreateSubjectBloc();
    _fetchAllTeachersForAcademyBloc = FetchAllTeachersForAcademyBloc();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _showTeacherDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select a Teacher'),
          content: SizedBox(
            width: double.maxFinite,
            child: BlocBuilder<FetchAllTeachersForAcademyBloc,
                FetchAllTeacherState>(
              builder: (BuildContext context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.fetchAllTeachersModel.teachers?.length,
                  itemBuilder: (context, index) {
                    final listofTeacher =
                        state.fetchAllTeachersModel.teachers?[index];
                    final title = listofTeacher?.name ?? '';
                    final subtitle = listofTeacher?.email ?? '';
                    final leading = listofTeacher?.profilePic ?? '';
                    return ListTile(
                      leading: NetworkImageWidget(imageUrl: leading),
                      // title: Text(teachers[index]['name']!),
                      title: Text(title),
                      subtitle: Text(subtitle),
                      onTap: () {
                        setState(() {
                          selectedEmail = subtitle;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Subject'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _createSubjectBloc),
          BlocProvider(
              create: (context) => _fetchAllTeachersForAcademyBloc
                ..add(const FetchAllTeachersForAcademy())),
        ],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email'),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  _showTeacherDialog();
                  context
                      .read<FetchAllTeachersForAcademyBloc>()
                      .add(FetchedAllTeachersForAcademyApi());
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      selectedEmail ?? 'Select email',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width*0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Grade'),
                        const SizedBox(height: 5),
                        CustomDropdown(
                          items: listOfGradesConstant,
                          value: grade,
                          onChanged: (newValue) {
                            grade = newValue;
                          },
                          hintText: 'Enter a grade',
                        ),
                      ],
                    ),
                  ),
                  GappedWidget(
                    rightGap: 5,
                  ),
                  SizedBox(
                    width: width*0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Subjects'),
                        const SizedBox(height: 5),
                        CustomDropdown(
                          // items: const ['Physics', 'Chemistry', 'Maths', 'Biology'],
                          items: listOfSubjectsConstant,
                          value: subject,
                          onChanged: (newValue) {
                            subject = newValue;
                          },
                          hintText: 'Enter a subject',
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              BlocConsumer<CreateSubjectBloc, CreateSubjectState>(
                listener: (BuildContext context, state) {
                  if (state is UserSuccess) {
                    Utils.snackBar(state.message.toString(), context);
                  } else if (state is UserFailure) {
                    Utils.snackBar(state.message.toString(), context);
                  }
                },
                builder: (BuildContext context, state) {
                  return Center(
                    child: ElevatedButton(
                      child: const Text('Create subject'),
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "email": selectedEmail,
                          "subjects": subject,
                          "gradeName": grade,
                        };
                        context
                            .read<CreateSubjectBloc>()
                            .add(CreateSubjects(data));
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
