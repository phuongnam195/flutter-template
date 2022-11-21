import 'package:flutter/material.dart';
import 'package:let_tutor/constants/constants.dart';

class LTFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final void Function(bool)? onSelected;
  final bool showCheckmark;

  const LTFilterChip({
    required this.label,
    required this.isSelected,
    this.onSelected,
    this.showCheckmark = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const selectedLabelColor = AppColors.secondary;
    const selectedBackgroundColor = Color(0xFFDDEAFF);

    return FilterChip(
      label: Text(
        label,
        style: AppTextStyle.medium().copyWith(
          color: isSelected ? selectedLabelColor : null,
          fontWeight: isSelected ? null : FontWeight.w400,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      labelPadding: const EdgeInsets.only(top: 1, bottom: 2, left: 3, right: 3),
      selected: isSelected,
      checkmarkColor: selectedLabelColor,
      selectedColor: selectedBackgroundColor,
      backgroundColor: AppColors.gray_1,
      onSelected: onSelected,
      showCheckmark: showCheckmark,
      pressElevation: 0,
    );
  }
}
