import 'package:flutter/material.dart';

class CoupleText extends StatelessWidget {
  final String first;
  final String? second;
  final TextStyle? firstStyle;
  final TextStyle? secondStyle;
  final bool separatedByColon;

  const CoupleText({
    required this.first,
    this.second,
    this.firstStyle,
    this.secondStyle,
    this.separatedByColon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: separatedByColon ? '$first: ' : first,
        style: firstStyle,
        children: [
          TextSpan(
            text: second,
            style: secondStyle,
          ),
        ],
      ),
    );
  }
}
