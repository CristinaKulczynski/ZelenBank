import 'package:zelenbank/core/http_client/http_response_entity.dart';

abstract class IHttpClient {
  Future<HttpResponse> get({
    required String url,
    Map<String, String>? header,
  });
}
