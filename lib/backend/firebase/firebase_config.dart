import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCecEbPU7Cr9z2k1-hjUG6tbT-hGvDPBJI",
            authDomain: "dasigapp.firebaseapp.com",
            projectId: "dasigapp",
            storageBucket: "dasigapp.appspot.com",
            messagingSenderId: "578216101324",
            appId: "1:578216101324:web:d3d474fb2553912a188969",
            measurementId: "G-N9BS68KMVW"));
  } else {
    await Firebase.initializeApp();
  }
}
