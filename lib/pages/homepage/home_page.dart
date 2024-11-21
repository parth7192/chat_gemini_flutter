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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(
                  () {
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: controller.geminiChatList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                                spreadRadius: 3,
                                color: Colors.grey.shade300,
                              )
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.7),
                                    child: Text(
                                      controller.geminiChatList[index].prompt,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.7),
                                    child: Text(controller
                                        .geminiChatList[index].response),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      controller.fatchData(prompt: value.toString());
                    },
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
                                controller.fatchData(prompt: txtedit.text);
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
                ),
              ),
            ],
          ),
          Obx(
            () => !controller.isLoading.value
                ? Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.green.withOpacity(0.6),
                      child: Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
