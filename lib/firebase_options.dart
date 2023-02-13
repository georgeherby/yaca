// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars

// 📦 Package imports:
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBNIBmMLHXqHyk1g2o7-s3nChFq5TG3U2Q',
    appId: '1:243267923096:web:1b8823218e9043545a74ed',
    messagingSenderId: '243267923096',
    projectId: 'yaca-827e3',
    authDomain: 'yaca-827e3.firebaseapp.com',
    storageBucket: 'yaca-827e3.appspot.com',
    measurementId: 'G-KZFNJG1FJP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6jtrxvcaZiJKw-p44z_Rn6zce8j5H6OM',
    appId: '1:243267923096:android:294230b5cfc8a1a25a74ed',
    messagingSenderId: '243267923096',
    projectId: 'yaca-827e3',
    storageBucket: 'yaca-827e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8UfPZ7eYTbXXDtlv6mT_vGYQT-tNUCnw',
    appId: '1:243267923096:ios:55a6acfd430e40b85a74ed',
    messagingSenderId: '243267923096',
    projectId: 'yaca-827e3',
    storageBucket: 'yaca-827e3.appspot.com',
    iosClientId:
        '243267923096-5r7626hmfib25j45vr135eh4c8bo15m6.apps.googleusercontent.com',
    iosBundleId: 'app.yaca.ios',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8UfPZ7eYTbXXDtlv6mT_vGYQT-tNUCnw',
    appId: '1:243267923096:ios:73eeb8d789c8ff615a74ed',
    messagingSenderId: '243267923096',
    projectId: 'yaca-827e3',
    storageBucket: 'yaca-827e3.appspot.com',
    iosClientId:
        '243267923096-2dk44p925jhlhrrhcvnogmo5hqc3gjen.apps.googleusercontent.com',
    iosBundleId: 'app.yaca.macos',
  );
}
