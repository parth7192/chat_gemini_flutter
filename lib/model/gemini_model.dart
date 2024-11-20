class GeminiModel {
  String prompt;
  String response;

  GeminiModel({
    required this.prompt,
    required this.response,
  });

  factory GeminiModel.fromJson(Map<String, dynamic> json) => GeminiModel(
        prompt: json["prompt"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "prompt": prompt,
        "response": response,
      };
}
