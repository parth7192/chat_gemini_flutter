import 'package:chat_gemini_flutter/pages/homepage/home_page.dart';
import 'package:chat_gemini_flutter/pages/intropage/intro_page.dart';
import 'package:chat_gemini_flutter/pages/splashscreen/SplashScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String splash = '/';
  String intro = 'intro_page';
  String home = 'home_page';

  Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const Splashscreen(),
    'intro_page': (Context) => const IntroPage(),
    'home_page': (Context) => const HomePage(),
  };
}
