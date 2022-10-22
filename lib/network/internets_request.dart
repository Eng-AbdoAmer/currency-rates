import 'package:http/http.dart' as http;

class InternetsRequest {
  static Future<String?> getRequest() async {
    try {
      var url =
          "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";
      var response = await http.get(
        Uri.parse(url),
        headers: {"X-CMC_PRO_API_KEY": "2322726f-38b6-44fa-87e7-3b0886d71f7b"},
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
