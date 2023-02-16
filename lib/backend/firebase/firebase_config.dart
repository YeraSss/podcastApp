import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA4trYzmbojO83-A_MxFlbB3_WHfujfpeo",
            authDomain: "groupproject-1167d.firebaseapp.com",
            projectId: "groupproject-1167d",
            storageBucket: "groupproject-1167d.appspot.com",
            messagingSenderId: "1020924115054",
            appId: "1:1020924115054:web:02025134a8f73aa4198e7f",
            measurementId: "G-P7ZJEKWTW2"));
  } else {
    await Firebase.initializeApp();
  }
}
