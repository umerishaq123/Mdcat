import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/fetch_test_model.dart';

class FetchTestState extends Equatable {
  final String message;
  final LoadingStatus loadingStatus;
  final FetchChapterTestModel fetchChapterTestModel;

  FetchTestState({
    this.message = '',
    this.loadingStatus = LoadingStatus.initial,
    FetchChapterTestModel? fetchChapterTestModel,
  }) : fetchChapterTestModel = fetchChapterTestModel ?? FetchChapterTestModel();

  FetchTestState copyWith({
    String? message,
    LoadingStatus? loadingStatus,
    FetchChapterTestModel? fetchChapterTestModel,   
  }) {
    return FetchTestState(
      message: message ?? this.message,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      fetchChapterTestModel: fetchChapterTestModel ?? this.fetchChapterTestModel,
    );
  }

  @override
  List<Object> get props => [
        loadingStatus,
        fetchChapterTestModel,
        message,
      ];
}
