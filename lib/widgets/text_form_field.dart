import 'package:flutter/material.dart';
import 'package:flutter_template/constant/colors.dart';

import 'couple_text.dart';

class LTTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final FocusNode? focusNode;
  final bool isRequired;
  final String? hintText;
  final bool isPassword;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final bool enabled;
  final void Function()? onTap;
  final bool isStadium;
  final double? height;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextAlign textAlign;
  final BorderRadius? borderRadius;
  final int maxLines;
  final String? initialValue;
  final TextStyle? titleStyle;
  final TextInputType? keyboardType;

  const LTTextFormField({
    this.controller,
    this.title,
    this.focusNode,
    this.enabled = true,
    this.isRequired = false,
    this.hintText,
    this.isPassword = false,
    this.errorText,
    this.validator,
    this.onEditingComplete,
    this.textInputAction,
    this.onTap,
    this.isStadium = false,
    this.height,
    this.suffixIcon,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.borderRadius,
    this.maxLines = 1,
    this.initialValue,
    this.titleStyle,
    this.keyboardType,
    super.key,
  });

  @override
  State<LTTextFormField> createState() => _LTTextFormFieldState();
}

class _LTTextFormFieldState extends State<LTTextFormField> {
  bool _isHideText = false;
  late BorderRadius _borderRadius;
  late TextStyle _titleStyle;

  @override
  void initState() {
    _isHideText = widget.isPassword;
    _borderRadius = widget.borderRadius ??
        (widget.isStadium
            ? BorderRadius.circular(100)
            : BorderRadius.circular(6));
    _titleStyle = widget.titleStyle ??
        const TextStyle(fontSize: 16, height: 1.5, color: AppColors.foreground);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: CoupleText(
              first: widget.title ?? '',
              second: widget.isRequired ? ' *' : null,
              firstStyle: _titleStyle,
              secondStyle: _titleStyle.copyWith(color: Colors.red),
            ),
          ),
        GestureDetector(
          onTap: () {
            if (!widget.enabled) {
              widget.onTap?.call();
            }
          },
          child: SizedBox(
            height: widget.height,
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.initialValue,
              focusNode: widget.focusNode,
              enabled: widget.enabled,
              onTap: widget.onTap,
              obscureText: _isHideText,
              style: const TextStyle(
                  fontSize: 16, height: 1.5, color: AppColors.foreground),
              cursorColor: AppColors.secondary,
              validator: widget.validator,
              onEditingComplete: widget.onEditingComplete,
              textInputAction: widget.textInputAction,
              readOnly: widget.readOnly,
              textAlign: widget.textAlign,
              maxLines: widget.maxLines,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                  filled: widget.enabled ? null : true,
                  fillColor: widget.enabled ? null : AppColors.gray_1,
                  errorText: widget.errorText,
                  errorStyle: const TextStyle(
                      fontSize: 16, height: 1.2, color: AppColors.red),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      fontSize: 16, height: 1.2, color: AppColors.gray_3),
                  border: OutlineInputBorder(
                    borderRadius: _borderRadius,
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.gray_4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: _borderRadius,
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.gray_4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: _borderRadius,
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: AppColors.secondary,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: _borderRadius,
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: AppColors.red,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: _borderRadius,
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.gray_4),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: widget.isStadium ? 20 : 12, vertical: 0),
                  suffixIcon: widget.suffixIcon ??
                      (!widget.isPassword
                          ? null
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  _isHideText = !_isHideText;
                                });
                              },
                              child: Icon(
                                _isHideText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 22,
                                color: AppColors.gray_4,
                              ),
                            ))),
            ),
          ),
        ),
      ],
    );
  }
}
