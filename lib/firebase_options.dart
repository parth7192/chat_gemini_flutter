// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBlVG1Xv9m5ex3CBFtASLnQ-NdzY_c3cAI',
    appId: '1:1052836876537:web:5117ee11fe15abc914d228',
    messagingSenderId: '1052836876537',
    projectId: 'chat-gemini-app-001',
    authDomain: 'chat-gemini-app-001.firebaseapp.com',
    storageBucket: 'chat-gemini-app-001.firebasestorage.app',
    measurementId: 'G-SWZGDX7RS0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnml13xzC4hdUYj9ojR2Ik9W0sFjLh4Is',
    appId: '1:1052836876537:android:c4d32961a03a178b14d228',
    messagingSenderId: '1052836876537',
    projectId: 'chat-gemini-app-001',
    storageBucket: 'chat-gemini-app-001.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyjP1STdEXp_6vvykRaEUis7LvNfGBMpU',
    appId: '1:1052836876537:ios:cb5c1c7bad8611f414d228',
    messagingSenderId: '1052836876537',
    projectId: 'chat-gemini-app-001',
    storageBucket: 'chat-gemini-app-001.firebasestorage.app',
    iosBundleId: 'com.example.chatGeminiFlutter',
  );
}
