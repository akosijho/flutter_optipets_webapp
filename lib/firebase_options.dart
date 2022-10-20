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
    apiKey: 'AIzaSyD9LTar9L0PBjmigDlRgofgHFLSRfO8cPk',
    appId: '1:123934579832:web:f5a3ee6c4fb6c72fe7218d',
    messagingSenderId: '123934579832',
    projectId: 'optipets',
    authDomain: 'optipets.firebaseapp.com',
    storageBucket: 'optipets.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCk5CQ4JLNbBEspCQJ5Rw9wg-B7Zrlu4v8',
    appId: '1:123934579832:android:76815ca16c737067e7218d',
    messagingSenderId: '123934579832',
    projectId: 'optipets',
    storageBucket: 'optipets.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_S8hepDkwOBid_QCoLOsu6nOUCEBXMSg',
    appId: '1:123934579832:ios:956bd04391ce3879e7218d',
    messagingSenderId: '123934579832',
    projectId: 'optipets',
    storageBucket: 'optipets.appspot.com',
    iosClientId: '123934579832-6cj30i3u4qc3pp6qhbge9btrdiq4qr1u.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterOptipetsWebapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_S8hepDkwOBid_QCoLOsu6nOUCEBXMSg',
    appId: '1:123934579832:ios:956bd04391ce3879e7218d',
    messagingSenderId: '123934579832',
    projectId: 'optipets',
    storageBucket: 'optipets.appspot.com',
    iosClientId: '123934579832-6cj30i3u4qc3pp6qhbge9btrdiq4qr1u.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterOptipetsWebapp',
  );
}
