import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage(
    this.asset, {
    super.key,
    required this.w,
    required this.h,
  });
  final double w;
  final double h;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        width: w,
        height: h * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              asset,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    // (0, 0) // 1. Point -> En Üst Sol köşe kordinatı.
    // path.moveTo(0, 100);
    path.lineTo(0, h); //  2. Point en alt sol köşe
    // path.lineTo(w, h); 4. Point en alt sağ köşe
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, 0); // 5. point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
