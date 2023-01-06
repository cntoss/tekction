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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxNSo1j2__AXsrlS918vibrq5WDAZJLNA',
    appId: '1:765102064979:android:65d394d67f507407a20da6',
    messagingSenderId: '765102064979',
    projectId: 'tekction',
    databaseURL: 'https://tekction-default-rtdb.firebaseio.com',
    storageBucket: 'tekction.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7Us-CGWrUSoVHocVP3GZS96d_RISJxmk',
    appId: '1:765102064979:ios:23dac42e7ff745b9a20da6',
    messagingSenderId: '765102064979',
    projectId: 'tekction',
    databaseURL: 'https://tekction-default-rtdb.firebaseio.com',
    storageBucket: 'tekction.appspot.com',
    androidClientId: '765102064979-lr9m80ktol3t0sd80s5dfcj9jh0nen3h.apps.googleusercontent.com',
    iosClientId: '765102064979-pqhnrh2u0jqhi0r0vu86hmi3q66u05jf.apps.googleusercontent.com',
    iosBundleId: 'com.tekkon.tekction',
  );
}
