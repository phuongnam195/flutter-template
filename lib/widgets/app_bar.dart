import 'package:flutter/material.dart';
import 'package:flutter_template/constant/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final List<Widget>? actions;
  final bool showBack;
  final void Function()? onBack;
  final bool showLogo;
  final Widget? wxTitle;

  const MyAppBar({
    this.title,
    this.actions,
    this.showBack = false,
    this.onBack,
    this.showLogo = false,
    this.wxTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 56,
      title: showLogo
          ? const FlutterLogo(size: 56 * 0.6)
          : title != null
              ? Text(
                  title ?? '',
                  style: const TextStyle(
                      fontSize: 18, height: 1.33, color: AppColors.foreground),
                )
              : wxTitle,
      centerTitle: !showLogo || showBack,
      automaticallyImplyLeading: false,
      leading: !showBack
          ? null
          : IconButton(
              onPressed: onBack ?? () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: AppColors.primary,
              ),
            ),
      actions: actions,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
