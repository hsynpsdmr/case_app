import 'package:case_app/constant/constant.dart';
import 'package:case_app/model/detail_model.dart';
import 'package:case_app/service/http_service.dart';
import 'package:http/http.dart' as http;

class ParticipantsService {
  static Future<DetailModel?> getParticipantDetail() async {
    try {
      http.StreamedResponse response = await HttpService().get(Constant.usersEndPoint);
      return detailModelFromJson(await response.stream.bytesToString());
    } catch (e) {
      return null;
    }
  }
}
