import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDiTN4HXj36tpbsswUscm0e4IGqhNXGqNc",
            authDomain: "extreme-giweaway-ibfad5.firebaseapp.com",
            projectId: "extreme-giweaway-ibfad5",
            storageBucket: "extreme-giweaway-ibfad5.appspot.com",
            messagingSenderId: "1081606806666",
            appId: "1:1081606806666:web:014e10d2cebf630baa6173"));
  } else {
    await Firebase.initializeApp();
  }
}
