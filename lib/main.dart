import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app_with_firebase/controllers/auth_controller.dart';

import 'pages/login/login_page.dart';
import 'pages/splash.dart';

void main() async {
  // Firebase'in ve AuthController'ın başlatılıp Flutter
  // Ağacımıza eklendiğinden kesin emin ol.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => Get.put(AuthController()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
