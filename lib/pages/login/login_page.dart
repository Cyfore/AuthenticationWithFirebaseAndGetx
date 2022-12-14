import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app_with_firebase/core/constants/image/image_constants.dart';
import 'package:login_app_with_firebase/pages/login/signup_page.dart';

import '../../controllers/auth_controller.dart';
import 'utils/colors.dart';
import 'widgets/login_and_text.dart';
import 'widgets/login_button.dart';
import 'widgets/login_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final DateTime time1;
  @override
  void initState() {
    time1 = DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final DateTime time2 = DateTime.now();
    // print('speeeeed---------------');
    // final result = time2.microsecondsSinceEpoch - time1.microsecondsSinceEpoch;
    // print(result);
    // print('EXIIIIIIIIIIIIT');
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginImage(
              ImageConstants.instance.midoriya,
              h: h,
              w: w,
            ),
            LoginAndText(w: w),
            const SizedBox(height: 70),
            LoginButton(
              ImageConstants.instance.garouMonster,
              h: h,
              w: w,
              text: 'Sign In',
              authOnTap: AuthController.instance.signIn,
            ),
            const SizedBox(height: 70),
            SizedBox(height: w * 0.15),
            RichText(
              text: TextSpan(
                text: "Don't have an account?",
                style: const TextStyle(
                  color: MyLoginColors.smallTextColor,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: "  Create",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => const SignUpPage()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
