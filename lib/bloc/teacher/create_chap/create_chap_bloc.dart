import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/general_response_Model.dart';
import 'create_chap_state.dart';

class CreateChapterBloc extends Bloc<CreateChapEvent, CreateChapState> {
  CreateChapterBloc() : super(const CreateChapState()) {
    on<CreateChapterr>(_createChap);
    on<CreateTopic>(_createTopic);
    on<AddNotes>(_addNotes);
    on<CreateChapterWiseTest>(_createChapterWiseTest);
 
  }

  final TeacherRepos _myRepo = TeacherRepos();

  void _createChap(CreateChapterr event, Emitter<CreateChapState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _myRepo.createChapter(event.data);
      final modelresponse = GeneralResponseModel.fromJson(response);
      if (modelresponse.success == true) {
        emit(state.copyWith(
          loginStatus: LoadingStatus.success,
          message: modelresponse.message.toString(),
        ));
      } else {
        emit(state.copyWith(
          loginStatus: LoadingStatus.error,
          message: modelresponse.message,
        ));
      }
      Utils.toastMessage(modelresponse.message);
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  void _createTopic(CreateTopic event, Emitter<CreateChapState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _myRepo.createTopic(event.data, event.videoPath);
      final modelresponse = GeneralResponseModel.fromJson(response);

      if (modelresponse.success == true) {
        emit(state.copyWith(
          loginStatus: LoadingStatus.success,
          message: modelresponse.message.toString(),
        ));
        
      } else {
        emit(state.copyWith(
          loginStatus: LoadingStatus.error,
          message: modelresponse.message,
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  void _addNotes(AddNotes event, Emitter<CreateChapState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );
  
    try {
      final response = await _myRepo.addNotes(event.data, event.file);
    
      final modelresponse = GeneralResponseModel.fromJson(response);
      if (modelresponse.success) {
        emit(state.copyWith(
          loginStatus: LoadingStatus.success,
          message: 'Notes added sucessfully',
        ));
         Utils.toastMessage('Notes added successfully');
      } else {
        
        emit(state.copyWith(
          loginStatus: LoadingStatus.error,
          message:'Notes added failed' ,
        ));
          Utils.toastMessage('Failed to add notes');
      }
      // Utils.toastMessage(modelresponse.message);
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  void _createChapterWiseTest(CreateChapterWiseTest event, Emitter<CreateChapState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _myRepo.createChapterWiseTest(event.data);
      final modelresponse = GeneralResponseModel.fromJson(response);

      if (modelresponse.success == true) {
        emit(state.copyWith(
          loginStatus: LoadingStatus.success,
          message: modelresponse.message.toString(),
        ));
        
      } else {
        emit(state.copyWith(
          loginStatus: LoadingStatus.error,
          message: modelresponse.message,
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
// go add listenter and test


}
