import 'dart:convert';
import 'package:http/http.dart' as h;

class GeminiHelper {
  GeminiHelper._();
  static final GeminiHelper instance = GeminiHelper._();

  String apiLink =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyD-Y2YX1Ik3l7aeFwS2ZXKJUViF0cqqAXY";

  Future<String> fatchData({required String prompt}) async {
    Map<String, String> header = {"Content-Type": "application/json"};
    var body = {
      {
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }
    };

    try {
      h.Response response = await h.post(
        Uri.parse(apiLink),
        headers: header,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['candidates'][0]['content']['parts'][0]
                ['text']
            .toString();
      }
    } catch (e) {
      print(
        "Gemini Call Error$e",
      );
    }
    return "No Data Fetch !!!\nTry Again later";
  }
}
