import 'package:mdcat_kawiish/config/constants/api_links.dart';
import 'package:mdcat_kawiish/data/network/base_api_services.dart';
import 'package:mdcat_kawiish/data/network/network_appi_services.dart';
import 'package:mdcat_kawiish/services/splash_services/session_handling.dart';

class TeacherRepos {
  BaseApiServices apiServices = NetworkApiService();

  Future<String?> getTeacherSignedInToken() =>
      SessionHandling().getTeacherSignedInToken();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.fetchPostApi(Applinks.loginForTeacher, data, null);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupforTeacher(dynamic data, imagepath) async {
    try {
      dynamic response = await apiServices.fetchPostApiWithImages(
          url: Applinks.signupforTeacher, data: data, imagePaths: imagepath);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchMySubjects() async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response =
          await apiServices.fetchGetApi(Applinks.mySubjectsForTeacher, token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchChapterForSubject(String subjectId) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.chaptersForSubjectForTeacher(subjectId), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchTopicsForChapter(String chapterId) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.topicsForChapterforTeacher(chapterId), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createChapter(
    dynamic data,
  ) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response =
          await apiServices.fetchPostApi(Applinks.createChapter, data, token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createTopic(dynamic data, videoPath) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response = await apiServices.fetchPostApiWithImages(
          url: Applinks.createTopics,
          data: data,
          imagePaths: videoPath,
          token: token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addNotes(dynamic data, file) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response = await apiServices.fetchPostApiWithImages(
          url: Applinks.addNotes, data: data, imagePaths: file, token: token);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createTopics(
    dynamic data,
  ) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response =
          await apiServices.fetchPostApi(Applinks.createTopics, data, token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createChapterWiseTest(dynamic data) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response = await apiServices.fetchPostApi(
          Applinks.createChapterWiseTest, data, token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> notes(String chapterid) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.notesForTeacher(chapterid), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchTest(String chapterid) async {
    try {
      final token = await getTeacherSignedInToken();

      dynamic response = await apiServices.fetchGetApi(
          Applinks.fetchTestForTeacher(chapterid), token);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
