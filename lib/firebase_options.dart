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
    apiKey: 'AIzaSyC7UcBVTtQ1OSaSjoVMM8PAJQWUXIoJoY8',
    appId: '1:74241467943:web:4548c42ca9726962791002',
    messagingSenderId: '74241467943',
    projectId: 'bultfarm-92992',
    authDomain: 'bultfarm-92992.firebaseapp.com',
    storageBucket: 'bultfarm-92992.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWYhf4Kc_HuDu-eeSf6qNoSlf_1M7yV3U',
    appId: '1:74241467943:android:5599d4419320d21c791002',
    messagingSenderId: '74241467943',
    projectId: 'bultfarm-92992',
    storageBucket: 'bultfarm-92992.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmVyONp_EW1dhr8FlMR-Uhn37IPiTXnCk',
    appId: '1:74241467943:ios:c69bfb60aa4b5cc6791002',
    messagingSenderId: '74241467943',
    projectId: 'bultfarm-92992',
    storageBucket: 'bultfarm-92992.appspot.com',
    iosBundleId: 'com.aquaponics.bultyFarmm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmVyONp_EW1dhr8FlMR-Uhn37IPiTXnCk',
    appId: '1:74241467943:ios:f3fb277e75dc627d791002',
    messagingSenderId: '74241467943',
    projectId: 'bultfarm-92992',
    storageBucket: 'bultfarm-92992.appspot.com',
    iosBundleId: 'com.aquaponics.bultyFarmm.RunnerTests',
  );
}