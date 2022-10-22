import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  const BigText(
    this.text, {
    super.key,
    required this.color,
    this.size = 70,
    this.fontWeight = FontWeight.bold,
  });
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
