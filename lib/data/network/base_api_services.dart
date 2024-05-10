abstract class BaseApiServices {
Future<dynamic> fetchGetApiWithToken(String url, [String? token]);


  Future<dynamic> fetchPostApi(String url, dynamic data);

  Future<dynamic> fetchPostApiWithToken(
      String url, dynamic data, String token);

  Future<dynamic> fetchPostApiWithImages({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> imagePaths,
    String? token,
  });
}


