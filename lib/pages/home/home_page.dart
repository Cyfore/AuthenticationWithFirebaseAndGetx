import 'package:flutter/material.dart';
import 'package:login_app_with_firebase/controllers/auth_controller.dart';
import 'package:login_app_with_firebase/widgets/text/big_text.dart';

import '../../core/constants/image/image_constants.dart';
import '../login/widgets/login_button.dart';
import 'widgets/home_top_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeTopImage(
              ImageConstants.instance.saitama,
              h: h,
              w: w,
            ),
            const SizedBox(height: 70),
            const BigText(
              'Home Page',
              color: Colors.black,
              size: 40,
            ),
            BigText(
              email,
              color: Colors.black,
              size: 20,
            ),
            LoginButton(
              ImageConstants.instance.gojoSenpai,
              h: h,
              w: w,
              text: 'Sign Out',
              authOnTap: AuthController.instance.signOut,
            ),
          ],
        ),
      ),
    );
  }
}
