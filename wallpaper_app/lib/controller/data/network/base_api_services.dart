abstract class BaseApiServices {
  Future<dynamic> getApi({required String url, Map<String, String>? header});
}
