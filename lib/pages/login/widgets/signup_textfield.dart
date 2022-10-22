import 'package:flutter/material.dart';

import 'login_textfield_button.dart';

class SignUpTextfield extends StatelessWidget {
  const SignUpTextfield({
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
        children: const [
          SizedBox(height: 50),
          LoginTextField(hintText: 'Email', icon: Icons.email),
          SizedBox(height: 20),
          LoginTextField(hintText: 'Password', icon: Icons.password),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
