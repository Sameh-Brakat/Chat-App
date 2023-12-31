// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyBvZn7zPHjJMUXRSfurzqLJtjNajhdh8Cg',
    appId: '1:691743020655:web:0d3f1a3364544ea2085f9a',
    messagingSenderId: '691743020655',
    projectId: 'chat-app-6b250',
    authDomain: 'chat-app-6b250.firebaseapp.com',
    storageBucket: 'chat-app-6b250.appspot.com',
    measurementId: 'G-H6NW10LSP5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdFemm0R48-G5hEQOSXmQ2Kjj9Jm0MTYY',
    appId: '1:691743020655:android:b6de2eb71cbd3953085f9a',
    messagingSenderId: '691743020655',
    projectId: 'chat-app-6b250',
    storageBucket: 'chat-app-6b250.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgicf24wThuH_4X0H0uBt099KccwZpLzs',
    appId: '1:691743020655:ios:786d483d3e4b4f63085f9a',
    messagingSenderId: '691743020655',
    projectId: 'chat-app-6b250',
    storageBucket: 'chat-app-6b250.appspot.com',
    iosClientId: '691743020655-kqj2ch75deo4ei9vjad1g9tub5mp1ghd.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgicf24wThuH_4X0H0uBt099KccwZpLzs',
    appId: '1:691743020655:ios:2ccb0af809bb64a5085f9a',
    messagingSenderId: '691743020655',
    projectId: 'chat-app-6b250',
    storageBucket: 'chat-app-6b250.appspot.com',
    iosClientId: '691743020655-pb72jmqsn5egg3hc639he73rh4d4bdio.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
