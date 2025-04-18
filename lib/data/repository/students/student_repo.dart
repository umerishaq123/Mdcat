import 'package:mdcat_kawiish/config/constants/api_links.dart';
import 'package:mdcat_kawiish/data/network/base_api_services.dart';
import 'package:mdcat_kawiish/data/network/network_appi_services.dart';
import 'package:mdcat_kawiish/services/splash_services/session_handling.dart';

class StudentRepos {
  BaseApiServices apiServices = NetworkApiService();
  Future<String?> getStudentSignedInToken() =>
      SessionHandling().getStudentSignedInToken();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await apiServices.fetchPostApi(
          Applinks.loginForStudent, data ?? '', null);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchMySubjects() async {
    try {
      final token = await getStudentSignedInToken();

      dynamic response =
          await apiServices.fetchGetApi(Applinks.mySubjectsForStudent, token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchChapterForSubject(String subjectId) async {
    try {
      final token = await getStudentSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.chaptersForSubjectForStudent(subjectId), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchTopicsForChapter(String chapterId) async {
    try {
      final token = await getStudentSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.topicsForChapterforStudent(chapterId), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchNotes(String chapterid) async {
    try {
      final token = await getStudentSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.notesForStudent(chapterid), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchTest(String chapterid) async {
    try {
      final token = await getStudentSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.fetchTestForStudent(chapterid), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> attemptTest(dynamic data) async {
    try {
            final token = await getStudentSignedInToken();

      dynamic response = await apiServices.fetchPostApi(
          Applinks.attemptTest, data ?? '', token);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
