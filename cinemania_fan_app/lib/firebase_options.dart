import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
   show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
     case TargetPlatform.fuchsia:
       
     case TargetPlatform.linux:
       
     case TargetPlatform.windows:
       
   }

   throw UnsupportedError(
     'DefaultFirebaseOptions are not supported for this platform.',
   );
 }

 static const FirebaseOptions web = FirebaseOptions(
   apiKey: 'AIzaSyCto2K9R-79rYvUwErbdAIAamfPKWGoHQU',
   appId: '1:567420217457:android:66937ff2b886cbf1a713d0',
   messagingSenderId: '567420217457',
   projectId: 'movie-cinemania',
   authDomain: 'flutterfire-ui-codelab.firebaseapp.com',
   storageBucket: 'flutterfire-ui-codelab.appspot.com',
   measurementId: 'G-DGF0CP099H',
 );

 static const FirebaseOptions android = FirebaseOptions(
   apiKey: 'AIzaSyCto2K9R-79rYvUwErbdAIAamfPKWGoHQU',
   appId: '1:567420217457:android:66937ff2b886cbf1a713d0',
   messagingSenderId: '567420217457',
   projectId: 'movie-cinemania',
   storageBucket: 'flutterfire-ui-codelab.appspot.com',
 );

 static const FirebaseOptions ios = FirebaseOptions(
   apiKey: 'AIzaSyCto2K9R-79rYvUwErbdAIAamfPKWGoHQU',
   appId: '1:567420217457:android:66937ff2b886cbf1a713d0',
   messagingSenderId: '567420217457',
   projectId: 'movie-cinemania',
   storageBucket: 'flutterfire-ui-codelab.appspot.com',
   iosClientId: '963656261848-v7r3vq1v6haupv0l1mdrmsf56ktnua60.apps.googleusercontent.com',
   iosBundleId: 'com.example.complete',
 );

 static const FirebaseOptions macos = FirebaseOptions(
   apiKey: 'AIzaSyCto2K9R-79rYvUwErbdAIAamfPKWGoHQU',
   appId: '1:567420217457:android:66937ff2b886cbf1a713d0',
   messagingSenderId: '567420217457',
   projectId: 'movie-cinemania',
   storageBucket: 'flutterfire-ui-codelab.appspot.com',
   iosClientId: '963656261848-v7r3vq1v6haupv0l1mdrmsf56ktnua60.apps.googleusercontent.com',
   iosBundleId: 'com.example.complete',
 );
}