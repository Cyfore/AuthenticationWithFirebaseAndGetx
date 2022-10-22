import 'package:flutter/cupertino.dart';

import '../../core/constants/app/app_colors.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    required this.text,
    this.color = MyColors.smallTextColor,
    this.size = 20,
  });
  final String text;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
