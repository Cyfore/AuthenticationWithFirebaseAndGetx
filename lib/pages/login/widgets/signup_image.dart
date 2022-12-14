import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app_with_firebase/core/constants/image/image_constants.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage(
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
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(asset),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: InkWell(
            onTap: () => Get.back(),
            child: IgnorePointer(
              child: SizedBox(
                width: 70,
                height: 70,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 70,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: h * 0.17),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          backgroundImage: AssetImage(ImageConstants.instance.garou),
        ),
      ],
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
