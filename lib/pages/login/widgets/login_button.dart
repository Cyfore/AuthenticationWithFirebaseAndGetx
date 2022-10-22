import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../widgets/text/big_text.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.w, required this.h});
  final double w;
  final double h;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * 0.5,
      height: h * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(
            ImageConstants.instance.garouMonster,
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
            child: const BigText(
              'Sign in',
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
      ),
    );
  }
}
