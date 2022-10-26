import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app_with_firebase/pages/home/home_page.dart';
import 'package:login_app_with_firebase/pages/login/login_page.dart';

class AuthController extends GetxController {
  // AuthController'ın sahip olduğu fonksiyonlara erişmek için
  // instance ı AuthControllerın constructor'ında olarak tanımlıyoruz.
  // Örnek => AuthController.instance.signIn diye dışarıdan ulaşılır.
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    // -------------
    // auth.currentUser firebaseden o anki bilgileri alır
    // ve Rx<User?> tipine type cast yapıp bilgileri _user a atar
    // email password name ve bunun gibi bilgileri atar.
    _user = Rx<User?>(auth.currentUser);
    // -------------
    // kullanıcının her hareketinde
    // _user bilgilendirilir.
    // örnek login olduğunda ya da hesaptan çıktığında ve bunun gibi şeylerde
    _user.bindStream(auth.userChanges());

    // user'a gelen herhangi değişiklikte _initialScreen e gönder
    // Örnek -> Login olduğunda _initialScreen e gönder ve bizim senaryomuza göre
    // HomaPage e gönder
    // kısacası ever her değişikliği dinler ve dinlediği değişikliği _initialScreen'e gönderir
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    // eğer user null ise
    // daha login olmamış demektir.
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => HomePage(email: user.email!));
    }
  }

  void signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      googleSignIn.disconnect();
    } catch (e) {}
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
        final crendentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await auth.signInWithCredential(crendentials);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void signIn() async {
    try {
      await auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      _controllerclear();
    } catch (value) {
      debugPrint(value.toString());
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          value.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void signUp() async {
    try {
      await auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      _controllerclear();
    } catch (value) {
      debugPrint(value.toString());
      Get.snackbar(
        "About User",
        "User message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account creation failed",
        ),
        messageText: Text(
          value.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  _controllerclear() {
    email.clear();
    password.clear();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
