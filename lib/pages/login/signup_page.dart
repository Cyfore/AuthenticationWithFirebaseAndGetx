import 'package:flutter/material.dart';

import '../../core/constants/image/image_constants.dart';
import 'utils/colors.dart';
import 'widgets/login_and_text.dart';
import 'widgets/login_button.dart';
import 'widgets/login_image.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          LoginImage(
            ImageConstants.instance.midoriya,
            h: h,
            w: w,
          ),
          LoginAndText(w: w),
          const SizedBox(height: 70),
          LoginButton(
            h: h,
            w: w,
          ),
          const SizedBox(height: 70),
          Container(),
          SizedBox(height: w * 0.15),
          RichText(
            text: TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                color: MyLoginColors.smallTextColor,
                fontSize: 20,
              ),
              children: const [
                TextSpan(
                  text: "  Create",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
