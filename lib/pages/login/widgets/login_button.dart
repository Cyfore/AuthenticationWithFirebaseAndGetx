import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../widgets/text/big_text.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.asset, {super.key, required this.w, required this.h, required this.text});
  final double w;
  final double h;
  final String asset;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * 0.5,
      height: h * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(
            asset,
          ),
          fit: BoxFit.cover,
        ),
      ),
      // child: const Center(
      //   child: BigText(
      //     'Sign in',
      //     color: Colors.white,
      //     size: 36,
      //   ),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: BigText(
              text,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
      ),
    );
  }
}
