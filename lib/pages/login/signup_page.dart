import 'package:flutter/material.dart';
import 'package:login_app_with_firebase/widgets/text/small_text.dart';

import '../../controllers/auth_controller.dart';
import '../../core/constants/image/image_constants.dart';
import 'widgets/login_button.dart';
import 'widgets/signup_image.dart';
import 'widgets/signup_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SignUpImage(
              ImageConstants.instance.saitama,
              h: h,
              w: w,
            ),
            SignUpTextfield(
              w: w,
            ),
            const SizedBox(height: 70),
            LoginButton(
              ImageConstants.instance.deadPlanetSpecular,
              h: h,
              w: w,
              text: 'Sign Up',
              authOnTap: AuthController.instance.signUp,
            ),
            const SizedBox(height: 70),
            const SmallText(
              text: 'Sign up using on the following method',
            ),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return GestureDetector(
                  onTap: AuthController.instance.signInWithGoogle,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.grey[400],
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: AssetImage(ImageList.images[index]),
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class ImageList {
  static List images = [
    ImageConstants.instance.facebook,
    ImageConstants.instance.twitter,
    ImageConstants.instance.google,
  ];
}
