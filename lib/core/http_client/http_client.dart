import 'package:zelenbank/core/http_client/http_client_interface.dart';
import 'package:zelenbank/core/http_client/http_response_entity.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  final http.Client client;

  HttpClient(this.client);

  @override
  Future<HttpResponse> get({
    required String url,
    Map<String, String>? header,
  }) async {
    final response = await client.get(
      Uri.parse(url),
      headers: header,
    );

    return HttpResponse(
      body: response.body,
      statusCode: response.statusCode,
    );
  }
}
