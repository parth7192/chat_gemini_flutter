import 'package:chat_gemini_flutter/Routes/app_route.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.instance.intro,
        );
      },
    );
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          "lib/assets/image/main.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
