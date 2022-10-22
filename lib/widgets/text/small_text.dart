import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    required this.text,
    required this.color,
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
