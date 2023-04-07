import 'package:drop_the_fish/models/fish_detail_model.dart';
import 'package:http/http.dart' as http;

class FishDetailService {
  static const String baseUrl =
      'http://211.237.50.150:7080/openapi/sample/xml/Grid_20220818000000000621_1/1/5?DATES=20180402';

  static Future<FishDetailModel> getTodaysFishDetails() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return FishDetailModel('광어(넙치)', 30000, 20000, 25000, 100);
    }

    throw Error();
  }
}
