import 'package:chat_gemini_flutter/Routes/app_route.dart';
import 'package:chat_gemini_flutter/controller/gemini_controller.dart';
import 'package:chat_gemini_flutter/helper/auth_helper.dart';
import 'package:chat_gemini_flutter/helper/db_helper.dart';
import 'package:chat_gemini_flutter/model/gemini_model.dart';
import 'package:chat_gemini_flutter/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtedit = TextEditingController();
    ValueNotifier<bool> isLoding = ValueNotifier(false);
    GeminiController controller = Get.put(GeminiController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {
              AuthHelper.instance.logOut().then(
                (value) {
                  Navigator.pushNamed(context, AppRoutes.instance.intro);
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Text("Hello");
                },
              ),
            ),
            TextFormField(
              controller: txtedit,
              decoration: InputDecoration(
                labelText: "Tape Here",
                labelStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: ValueListenableBuilder(
                  valueListenable: isLoding,
                  builder: (context, value, child) {
                    if (value) {
                      return const SizedBox(
                        width: 20,
                        height: 20,
                        child: SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 20,
                        ),
                      );
                    }
                    return IconButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          String edit = txtedit.text;
                          controller.chatHistory.add(edit as GeminiModel);
                          HistoryModel model =
                              HistoryModel(answer: txtedit.text);
                          DbHelper.helper.insertData(model);
                          await controller
                              .chatHistory(edit as List<GeminiModel>?);
                          txtedit.clear();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      icon: const Icon(Icons.send),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
