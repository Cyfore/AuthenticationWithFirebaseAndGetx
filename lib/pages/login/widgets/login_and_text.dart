import 'package:flutter/material.dart';

import '../../../widgets/text/big_text.dart';
import '../../../widgets/text/small_text.dart';
import 'login_textfield_button.dart';

class LoginAndText extends StatelessWidget {
  const LoginAndText({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BigText('Hello', color: Colors.black),
          const SmallText(text: 'Sign into your account'),
          const SizedBox(height: 50),
          const LoginTextField(hintText: 'Email', icon: Icons.email),
          const SizedBox(height: 20),
          const LoginTextField(hintText: 'Password', icon: Icons.password),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 220),
            child: const SmallText(text: 'Forgot your account? '),
          ),
        ],
      ),
    );
  }
}
