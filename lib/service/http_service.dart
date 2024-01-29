import 'package:case_app/constant/constant.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static const String baseUrl = Constant.baseUrl;
  static const Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<http.StreamedResponse> post(String url, String body) async {
    var request = http.Request('POST', Uri.parse(baseUrl + url));
    request.body = body;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return response;
  }
}
