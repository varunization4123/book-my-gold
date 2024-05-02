import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBPXG0AYN_ZHwvxdI_81DjZVt_1lif8hqE",
            authDomain: "jar-app-2kol48.firebaseapp.com",
            projectId: "jar-app-2kol48",
            storageBucket: "jar-app-2kol48.appspot.com",
            messagingSenderId: "201099847936",
            appId: "1:201099847936:web:46d2b5f412da98857aabe5"));
  } else {
    await Firebase.initializeApp();
  }
}
