import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/list_of_chapter_notes_model.dart';

class FetchNotesState extends Equatable {
  final String message;
  final LoadingStatus loadingStatus;
  final ListOfChapterNotesModels fetchNotesForTeacher;

  FetchNotesState({
    this.message = '',
    this.loadingStatus = LoadingStatus.initial,
    ListOfChapterNotesModels? fetchNotesForTeacher,
  }) : fetchNotesForTeacher = fetchNotesForTeacher ?? ListOfChapterNotesModels();

  FetchNotesState copyWith({
    String? message,
    LoadingStatus? loadingStatus,
    ListOfChapterNotesModels? fetchNotesForTeacher,   
  }) {
    return FetchNotesState(
      message: message ?? this.message,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      fetchNotesForTeacher: fetchNotesForTeacher ?? this.fetchNotesForTeacher,
    );
  }

  @override
  List<Object> get props => [
        loadingStatus,
        fetchNotesForTeacher,
        message,
      ];
}
