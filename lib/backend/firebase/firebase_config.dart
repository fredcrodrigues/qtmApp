import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAqLIycn5VvFeWQXdorOvhHaxX0YdZ_lxo",
            authDomain: "app-qtm-25e27.firebaseapp.com",
            projectId: "app-qtm-25e27",
            storageBucket: "app-qtm-25e27.appspot.com",
            messagingSenderId: "71023789235",
            appId: "1:71023789235:web:1a13c1a331afc1756b9cc6",
            measurementId: "G-WLMKMK0RJM"));
  } else {
    await Firebase.initializeApp();
  }
}
