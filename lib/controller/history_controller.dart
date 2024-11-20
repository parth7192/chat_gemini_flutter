import 'package:chat_gemini_flutter/helper/db_helper.dart';
import 'package:chat_gemini_flutter/model/history_model.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  RxList<HistoryModel> historyList = <HistoryModel>[].obs;

  Future<void> historyGetData() async {
    List<HistoryModel> history = await DbHelper.helper.readData();
    historyList.value = history;
  }
}
