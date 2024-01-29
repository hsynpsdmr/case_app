import 'package:case_app/constant/constant.dart';
import 'package:case_app/model/token_model.dart';
import 'package:case_app/pages/login/login_model.dart';
import 'package:case_app/service/http_service.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<TokenModel?> login(LoginModel data) async {
    try {
      http.StreamedResponse response = await HttpService().post(Constant.loginEndPoint, loginModelToJson(data));
      return tokenModelFromJson(await response.stream.bytesToString());
    } catch (e) {
      return null;
    }
  }
}
