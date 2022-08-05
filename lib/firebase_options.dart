// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAuHgGPhWKbrQlaumlYID_BM4HB4I0ZbQ',
    appId: '1:398152368850:android:1eff6ee44143fef62ba30b',
    messagingSenderId: '398152368850',
    projectId: 'ghareluapp-np',
    storageBucket: 'ghareluapp-np.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8ywoKAg-6pJ33mK8ND2ikVhD3In1wx9I',
    appId: '1:398152368850:ios:e36d18ea25545ac22ba30b',
    messagingSenderId: '398152368850',
    projectId: 'ghareluapp-np',
    storageBucket: 'ghareluapp-np.appspot.com',
    iosClientId:
        '398152368850-o822p1ea53vcr98ujnprs5c7sq5ed4sc.apps.googleusercontent.com',
    iosBundleId: 'app.gharelu',
  );
}
