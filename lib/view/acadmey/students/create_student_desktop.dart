import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/image_picker/image_picker_event.dart';

class CreateStudentDesktop extends StatefulWidget {
  const CreateStudentDesktop({super.key});

  @override
  State<CreateStudentDesktop> createState() => _CreateStudentDesktopState();
}

class _CreateStudentDesktopState extends State<CreateStudentDesktop> {
  late AccadmeyCreateStudentBloc _accadmeyCreateStudentBloc;
   FocusNode namefocusnode=FocusNode();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  FocusNode phoneNumberFocusNode=FocusNode();

  @override
  void initState() {
    super.initState();
    _accadmeyCreateStudentBloc = AccadmeyCreateStudentBloc(ImagePickerUtils());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a student'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => _accadmeyCreateStudentBloc,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AccadmeyCreateStudentBloc,
                        AccadmeyCreateStudentState>(
                    builder: (BuildContext context, state) {
                  return state.file == null
                      ? InkWell(
                          onTap: () {
                            context
                                .read<AccadmeyCreateStudentBloc>()
                                .add(GalleryPicker());
                          },
                          child: const Center(
                            child: CircleAvatar(
                              radius: 30,
                              child: Icon(Icons.camera),
                            ),
                          ),
                        )
                      :
                      //  Image.file(File(state.file!.path.toString()),height: 200,width: 200,);
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
                  topGap: 10,
                ),
                Center(
                  child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                    builder: (BuildContext context, state) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<AccadmeyCreateStudentBloc>()
                              .add(GalleryPicker());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Themecolor.primary,
                              borderRadius: BorderRadius.circular(15)),
                          height: height * 0.05,
                          width: width * 0.3,
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
                  bottomGap: 5,
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
                            topGap: 2,
                          ),
                          BlocBuilder<AccadmeyCreateStudentBloc,
                              AccadmeyCreateStudentState>(
                            builder: (BuildContext context, state) {
                              return buildCustomTextField(
                                  onChanged: (newvalue) {
                                    context
                                        .read<AccadmeyCreateStudentBloc>()
                                        .add(NameChange(name: newvalue));
                                  },
                                  hintText: 'Enter your name');
                            },
                          ),
                        ],
                      ),
                    ),
                    const GappedWidget(
                      topGap: 2,
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
                            topGap: 2,
                          ),
                          BlocBuilder<AccadmeyCreateStudentBloc,
                              AccadmeyCreateStudentState>(
                            builder: (BuildContext context, state) {
                              return buildCustomTextField(
                                  onChanged: (newvalue) {
                                    context
                                        .read<AccadmeyCreateStudentBloc>()
                                        .add(EmailChange(email: newvalue));
                                  },
                                  hintText: 'Enter your email');
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                const GappedWidget(
                  topGap: 2,
                ),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const GappedWidget(
                  topGap: 2,
                ),
                BlocBuilder<AccadmeyCreateStudentBloc,
                    AccadmeyCreateStudentState>(
                  builder: (BuildContext context, state) {
                    return buildCustomTextField(
                        onChanged: (newvalue) {
                          context
                              .read<AccadmeyCreateStudentBloc>()
                              .add(PasswordChange(password: newvalue));
                        },
                        hintText: 'Enter your password');
                  },
                ),
                const GappedWidget(
                  topGap: 2,
                ),
                Text(
                  'Phonenumber',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const GappedWidget(
                  topGap: 2,
                ),
                BlocBuilder<AccadmeyCreateStudentBloc,
                    AccadmeyCreateStudentState>(
                  builder: (BuildContext context, state) {
                    return buildCustomTextField(
                        onChanged: (newvalue) {
                          context
                              .read<AccadmeyCreateStudentBloc>()
                              .add(PhonenumChange(phonenumber: newvalue));
                        },
                        hintText: 'Enter your phonenumber');
                  },
                ),
                const GappedWidget(
                  topGap: 2,
                ),

                Text(
                  'Grade',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const GappedWidget(
                  topGap: 2,
                ),
                // Text('grade',style: Theme.of(context).textTheme.titleLarge,),
                BlocBuilder<AccadmeyCreateStudentBloc,
                        AccadmeyCreateStudentState>(
                    builder: (BuildContext context, state) {
                  // List<String> gradeItems = [
                  //   '9th',
                  //   '10th',
                  //   '1st year',
                  //   '2nd year'
                  // ];

                  // Ensure the value is from the items list
                  String? dropdownValue = state.grades.isNotEmpty &&
                          listOfGradesConstant.contains(state.grades[0])
                      ? state.grades[0]
                      : null;

                  return CustomDropdown(
                    items: listOfGradesConstant,
                    value: dropdownValue,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        context
                            .read<AccadmeyCreateStudentBloc>()
                            .add(Gradechange(selectgrades: newValue));
                      }
                    },
                    hintText: 'Enter your grade',
                  );
                }),

                const GappedWidget(
                  topGap: 2,
                ),
                Text(
                  'Subject',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const GappedWidget(
                  topGap: 2,
                ),
                BlocBuilder<AccadmeyCreateStudentBloc,
                    AccadmeyCreateStudentState>(
                  builder:
                      (BuildContext context, AccadmeyCreateStudentState state) {
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
                              value: state.selectedSubjects[subject] ?? false,
                              onChanged: (bool? value) {
                                context
                                    .read<AccadmeyCreateStudentBloc>()
                                    .add(ChooseSubjectEvent(subject));
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
                  topGap: 2,
                ),
                Text(
                  'Gender',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const GappedWidget(
                  topGap: 2,
                ),
                BlocBuilder<AccadmeyCreateStudentBloc,
                        AccadmeyCreateStudentState>(
                    builder: (BuildContext context, state) {
                  // Ensure the value is from the items list
                  String? dropdownValue = state.gender.isNotEmpty &&
                          listOfGendersConstant.contains(state.gender[0])
                      ? state.gender[0]
                      : null;

                  return CustomDropdown(
                    items: listOfGendersConstant,
                    value: dropdownValue,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        context
                            .read<AccadmeyCreateStudentBloc>()
                            .add(Genderchange(
                              gender: newValue,
                            ));
                      }
                    },
                    hintText: 'Enter your gender',
                  );
                }),
                const GappedWidget(
                  topGap: 2,
                ),
                BlocListener<AccadmeyCreateStudentBloc,
                    AccadmeyCreateStudentState>(
                  listener: (BuildContext context, state) {
                    if (state.loginStatus == LoadingStatus.error) {
                      Utils.snackBar(state.message.toString(), context);
                    }
                    if (state.loginStatus == LoadingStatus.success) {
                      Utils.snackBar(state.message.toString(), context);
                      // nameController.clear();
                      // emailController.clear();
                      // passwordController.clear();
                      // phonenumberController.clear();

                      context
                          .read<AccadmeyCreateStudentBloc>()
                          .add(const NameChange(name: ''));
                      context
                          .read<AccadmeyCreateStudentBloc>()
                          .add(const EmailChange(email: ''));
                      context
                          .read<AccadmeyCreateStudentBloc>()
                          .add(const PhonenumChange(phonenumber: ''));
                          
                      context
                          .read<ImagePickerBloc>()
                          .add(ResetImagePickerEvent());
                      context
                          .read<SubjectSelectionBloc>()
                          .add(ResetSubjectsEvent());
                      context
                          .read<FetchAllTeachersForAcademyBloc>()
                          .add(FetchedAllTeachersForAcademyApi());
                      Navigator.pop(context);
                    }
                  },
                  child: BlocBuilder<AccadmeyCreateStudentBloc,
                      AccadmeyCreateStudentState>(
                    builder: (BuildContext context, state) {
                      return state.loginStatus == LoadingStatus.loading
                          ? const LoadingWidget()
                          : BuildElevatedButton(
                              buttontext: 'Enroll',
                              onPressed: () {
                                if (state.file == null) {
                                  Utils.toastMessage('Please choose image.');
                                } else {
                                  context
                                      .read<AccadmeyCreateStudentBloc>()
                                      .add(SignupApiforStudent());
                                }
                              });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
