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
    apiKey: 'AIzaSyAdech9BtcZD1t0Nl_TgL6NztrBuJzFbWQ',
    appId: '1:11724997008:web:fc938fdc24985a7bfe3315',
    messagingSenderId: '11724997008',
    projectId: 'chat-app-b3531',
    authDomain: 'chat-app-b3531.firebaseapp.com',
    storageBucket: 'chat-app-b3531.appspot.com',
    measurementId: 'G-GV3DLCNFHR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqVjk6-LAzyflkbWSAFMwWJszFReYFxck',
    appId: '1:11724997008:android:0b31caf70fd0d19efe3315',
    messagingSenderId: '11724997008',
    projectId: 'chat-app-b3531',
    storageBucket: 'chat-app-b3531.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHu_2RNeSRbpa-wL3nkfBWGsWIkjvoD74',
    appId: '1:11724997008:ios:8f15cfb79793eb30fe3315',
    messagingSenderId: '11724997008',
    projectId: 'chat-app-b3531',
    storageBucket: 'chat-app-b3531.appspot.com',
    iosClientId: '11724997008-enikadf71jpk7runqv7qkphcihhqb0jt.apps.googleusercontent.com',
    iosBundleId: 'com.example.newOne',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHu_2RNeSRbpa-wL3nkfBWGsWIkjvoD74',
    appId: '1:11724997008:ios:8f15cfb79793eb30fe3315',
    messagingSenderId: '11724997008',
    projectId: 'chat-app-b3531',
    storageBucket: 'chat-app-b3531.appspot.com',
    iosClientId: '11724997008-enikadf71jpk7runqv7qkphcihhqb0jt.apps.googleusercontent.com',
    iosBundleId: 'com.example.newOne',
  );
}
