import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/image_picker/image_picker_event.dart';

class CreateTeacherDesktop extends StatefulWidget {
  const CreateTeacherDesktop({super.key});

  @override
  State<CreateTeacherDesktop> createState() => _CreateTeacherDesktopState();
}

class _CreateTeacherDesktopState extends State<CreateTeacherDesktop> {
  late CreateTeacherBloc _createTeacherBloc;
  late SubjectSelectionBloc _subjectSelectionBloc;
  late AccadmeyCreateStudentBloc _accadmeyCreateStudentBloc;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
    FocusNode namefocusnode=FocusNode();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  FocusNode phoneNumberFocusNode=FocusNode();
  String? selectedGender = 'Male';
  @override
  void initState() {
    super.initState();
    _createTeacherBloc = CreateTeacherBloc();
    _subjectSelectionBloc = SubjectSelectionBloc();
    _accadmeyCreateStudentBloc = AccadmeyCreateStudentBloc(ImagePickerUtils());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create a Teacher'),
          centerTitle: true,
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => _createTeacherBloc),
              BlocProvider(create: (context) => _subjectSelectionBloc),
              BlocProvider(create: (context) => _accadmeyCreateStudentBloc),
            ],
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GappedWidget(
                      topGap: 1,
                    ),
                    BlocBuilder<ImagePickerBloc, ImagePickerState>(
                        builder: (BuildContext context, state) {
                      // imagepath=state.file?.path;

                      return state.file == null
                          ? InkWell(
                              onTap: () {
                                context
                                    .read<ImagePickerBloc>()
                                    .add(GalleryPickerEvent());
                              },
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Icon(Icons.camera),
                                ),
                              ),
                            )
                          :
                          //
                          Center(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: kIsWeb
                                    ? NetworkImage(state.file!.path)
                                    : FileImage(File(state.file!.path))
                                        as ImageProvider,
                              ),
                            );
                    }),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    Center(
                      child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                        builder: (BuildContext context, state) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<ImagePickerBloc>()
                                  .add(GalleryPickerEvent());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Themecolor.primary,
                                  borderRadius: BorderRadius.circular(15)),
                              height: height * 0.06,
                              width: width * 0.1,
                              child: const Center(
                                  child: Text(
                                'Profile',
                                style: TextStyle(color: Themecolor.white),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                    const GappedWidget(
                      bottomGap: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const GappedWidget(
                                topGap: 1,
                              ),
                              buildCustomTextField(
                                focusNode: namefocusnode,
                                onFieldSubmitted: (value){
                                  Utils.fieldFocusChange(context, namefocusnode, emailFocusNode);
                                },
                                  controller: nameController,
                                  hintText: 'Enter your name'),
                            ],
                          ),
                        ),
                        const GappedWidget(
                          rightGap: 1,
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'email',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const GappedWidget(
                                topGap: 1,
                              ),
                              buildCustomTextField(    focusNode: emailFocusNode,
                              onFieldSubmitted: (value){
                                  Utils.fieldFocusChange(context,  emailFocusNode,passwordFocusNode);
                                },
                                  controller: emailController,
                                  hintText: 'Enter your email'),
                            ],
                          ),
                        )
                      ],
                    ),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    Text(
                      'password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    buildCustomTextField(
                          focusNode: passwordFocusNode,
                          onFieldSubmitted: (value){
                                  Utils.fieldFocusChange(context, passwordFocusNode, phoneNumberFocusNode);
                                },
                        controller: passwordController,
                        hintText: 'Enter password'),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    Text(
                      'Phonenumber',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    buildCustomTextField(
                        controller: phonenumberController,
                        hintText: 'Enter your phonenumber'),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    Text(
                      'Subject',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    BlocBuilder<SubjectSelectionBloc, SubjectSelectionState>(
                      builder:
                          (BuildContext context, SubjectSelectionState state) {
                        return Wrap(
                          spacing: 10.0,
                          runSpacing: 5.0,
                          children: listOfSubjectsConstant.map((subject) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  // checkColor: Themecolor.primary,
                                  activeColor: Themecolor.grey,
                                  value:
                                      state.selectedSubjects[subject] ?? false,
                                  onChanged: (bool? value) {
                                    context
                                        .read<SubjectSelectionBloc>()
                                        .add(ToggleSubjectEvent(subject));
                                  },
                                ),
                                Text(subject),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    Text(
                      'Gender',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    CustomDropdown(
                        items: listOfGendersConstant,
                        value: selectedGender,
                        onChanged: (newvalue) {
                          selectedGender = newvalue.toString();
                        },
                        hintText: 'select a gender'),
                    const GappedWidget(
                      topGap: 1,
                    ),
                    BlocConsumer<CreateTeacherBloc, CreateTeacherState>(
                      listener: (context, state) {
                        // print('::: the token of student is :${token}')
                        if (state is UserSuccess) {
                          Utils.snackBar('User Created Successfully', context);
                        } else if (state is UserFailure) {
                          Utils.snackBar('User creation failed', context);
                        }
                      },
                      builder: (context, state) {
                        if (state is UserLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Center(
                          child: ElevatedButton(
                            child: const Text('Enroll'),
                            onPressed: () {
                              final name = nameController.text;
                              final email = emailController.text;
                              final password = passwordController.text;
                              final phoneNumber = phonenumberController.text;

                              final subjects = context
                                  .read<SubjectSelectionBloc>()
                                  .state
                                  .selectedSubjects
                                  .entries
                                  .where((entry) => entry.value)
                                  .map((entry) => entry.key)
                                  .toList();

                              final imagepath = context
                                  .read<ImagePickerBloc>()
                                  .state
                                  .file
                                  ?.path
                                  .toString();

                              Map<String, dynamic> data = {
                                'name': name,
                                'email': email,
                                'password': password,
                                'phone': phoneNumber,
                                'subjects': subjects,
                                'gender': selectedGender,
                              };

                              Map<String, String> imagePath = {
                                'profilePic': imagepath ?? '',
                              };

                              context
                                  .read<CreateTeacherBloc>()
                                  .add(CreateUser(data, imagePath));
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
