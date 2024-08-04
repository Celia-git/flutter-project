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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyC1KM8DXL0ukHRGDcLFh91WtzqelTak2k0',
    appId: '1:702055309693:web:6d6753413fd5d3269aac14',
    messagingSenderId: '702055309693',
    projectId: 'new-project34127856',
    authDomain: 'new-project34127856.firebaseapp.com',
    storageBucket: 'new-project34127856.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDUNueNHjNSHeHvpcA-OyuHStpzE5Xsnw',
    appId: '1:702055309693:android:19d11b2ae5ca70869aac14',
    messagingSenderId: '702055309693',
    projectId: 'new-project34127856',
    storageBucket: 'new-project34127856.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjnnTSuk7U00H7Tlw3jCKjV1dL4XV9g70',
    appId: '1:702055309693:ios:d14a1a24801d18ff9aac14',
    messagingSenderId: '702055309693',
    projectId: 'new-project34127856',
    storageBucket: 'new-project34127856.appspot.com',
    iosBundleId: 'com.example.newProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjnnTSuk7U00H7Tlw3jCKjV1dL4XV9g70',
    appId: '1:702055309693:ios:d14a1a24801d18ff9aac14',
    messagingSenderId: '702055309693',
    projectId: 'new-project34127856',
    storageBucket: 'new-project34127856.appspot.com',
    iosBundleId: 'com.example.newProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1KM8DXL0ukHRGDcLFh91WtzqelTak2k0',
    appId: '1:702055309693:web:9a687b9aa72d91a09aac14',
    messagingSenderId: '702055309693',
    projectId: 'new-project34127856',
    authDomain: 'new-project34127856.firebaseapp.com',
    storageBucket: 'new-project34127856.appspot.com',
  );

}