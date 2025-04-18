import 'package:bloc/bloc.dart';
import 'package:mdcat_kawiish/bloc/academy/checkbox_subjects/checkboxEvent.dart';
import 'package:mdcat_kawiish/bloc/academy/checkbox_subjects/checkboxState.dart';

class SubjectSelectionBloc
    extends Bloc<SubjectSelectionEvent, SubjectSelectionState> {
  SubjectSelectionBloc()
      : super(SubjectSelectionState(const {
          'Maths': false,
          'Biology': false,
          'Chemistry': false,
          'Physics': false,
        })) {
    on<ToggleSubjectEvent>(_onToggleSubjectEvent);
    on<ResetSubjectsEvent>(_onResetSubjectsEvent);
  }

  void _onToggleSubjectEvent(
      ToggleSubjectEvent event, Emitter<SubjectSelectionState> emit) {
    final updatedSubjects = Map<String, bool>.from(state.selectedSubjects);
    updatedSubjects[event.subject] = !updatedSubjects[event.subject]!;
    emit(state.copyWith(updatedSubjects));
  }

  void _onResetSubjectsEvent(
      ResetSubjectsEvent event, Emitter<SubjectSelectionState> emit) {
    emit(SubjectSelectionState(const {
      'Maths': false,
      'Biology': false,
      'Chemistry': false,
      'Physics': false,
    }));
  }
}
