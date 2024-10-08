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
    apiKey: 'AIzaSyB8IwMdrumLh-v5hm8QjqbUSpbsM1oQh48',
    appId: '1:984008109940:web:a44bc2936926cf3b890621',
    messagingSenderId: '984008109940',
    projectId: 'ulearning-app-aa8ab',
    authDomain: 'ulearning-app-aa8ab.firebaseapp.com',
    storageBucket: 'ulearning-app-aa8ab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5F5dEzhvIvL6KQrcWe9IzN9jqShYNvGQ',
    appId: '1:984008109940:android:b6d7d5e2f23e9988890621',
    messagingSenderId: '984008109940',
    projectId: 'ulearning-app-aa8ab',
    storageBucket: 'ulearning-app-aa8ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3qTiuhV56gCke9fwPaxkUYij6iWMoxFA',
    appId: '1:984008109940:ios:c6ae9b8bcd4576e6890621',
    messagingSenderId: '984008109940',
    projectId: 'ulearning-app-aa8ab',
    storageBucket: 'ulearning-app-aa8ab.appspot.com',
    iosBundleId: 'com.example.ulearnApp',
  );
}
