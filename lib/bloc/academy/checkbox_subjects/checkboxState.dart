import 'package:equatable/equatable.dart';

class SubjectSelectionState extends Equatable {
  final Map<String, bool> selectedSubjects;
  

  const SubjectSelectionState(this.selectedSubjects);

 

  SubjectSelectionState copyWith(Map<String, bool>? selectedSubjects) {
    return SubjectSelectionState(selectedSubjects ?? this.selectedSubjects);
  }
  
  @override
  List<Object?> get props => [selectedSubjects];
}
