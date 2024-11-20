import 'package:chat_gemini_flutter/helper/gemini_helper.dart';
import 'package:chat_gemini_flutter/model/gemini_model.dart';
import 'package:get/get.dart';

class GeminiController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<GeminiModel> history = <GeminiModel>[].obs;

  Future<void> fatchData({required String prompt}) async {
    isLoading.value = true;
    String data = await GeminiHelper.instance.fatchData(prompt: prompt);
    history.add(GeminiModel(prompt: prompt.obs, response: data.obs));
  }
}
