import 'package:flutter/material.dart';
import 'package:let_tutor/constants/constants.dart';

class LTChip extends StatelessWidget {
  final String label;

  const LTChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    const labelColor = AppColors.secondary;
    const backgroundColor = Color(0xFFDDEAFF);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Chip(
        label: Text(
          label,
          style: AppTextStyle.medium().copyWith(
            color: labelColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        labelPadding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
