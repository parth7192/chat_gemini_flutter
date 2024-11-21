import 'package:chat_gemini_flutter/helper/gemini_helper.dart';
import 'package:chat_gemini_flutter/model/gemini_model.dart';
import 'package:get/get.dart';

class GeminiController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<GeminiModel> geminiChatList = <GeminiModel>[].obs;

  Future<void> fatchData({required String prompt}) async {
    isLoading(true);
    String data = await GeminiHelper.instance.fatchData(prompt: prompt);
    geminiChatList.add(
      GeminiModel(prompt: prompt, response: data),
    );
    isLoading(false);
  }
}
