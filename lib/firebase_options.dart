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
    apiKey: 'AIzaSyCtpCL0_wmgR93iUeW5PUlyTxS4xT06hao',
    appId: '1:28779360587:web:78458287cdb403ac1a78ce',
    messagingSenderId: '28779360587',
    projectId: 'newsviews-cb84c',
    authDomain: 'newsviews-cb84c.firebaseapp.com',
    storageBucket: 'newsviews-cb84c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuI8bSX77_Fl2B3iw1Vj0Ak3NbyTDK9Yk',
    appId: '1:28779360587:android:3331c46b29b4c0c61a78ce',
    messagingSenderId: '28779360587',
    projectId: 'newsviews-cb84c',
    storageBucket: 'newsviews-cb84c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgCrXPpCVJ-f8wYDRA5L4qgMhvZM-R1hw',
    appId: '1:28779360587:ios:0ee2ceb217689ffe1a78ce',
    messagingSenderId: '28779360587',
    projectId: 'newsviews-cb84c',
    storageBucket: 'newsviews-cb84c.appspot.com',
    iosBundleId: 'com.example.cipherschool',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgCrXPpCVJ-f8wYDRA5L4qgMhvZM-R1hw',
    appId: '1:28779360587:ios:4ecc13b120bddcc11a78ce',
    messagingSenderId: '28779360587',
    projectId: 'newsviews-cb84c',
    storageBucket: 'newsviews-cb84c.appspot.com',
    iosBundleId: 'com.example.cipherschool.RunnerTests',
  );
}
