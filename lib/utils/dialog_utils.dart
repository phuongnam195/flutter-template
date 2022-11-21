import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/constant/colors.dart';

class DialogUtils {
  static showError(BuildContext context, String content, {String? title}) {
    show(
      context,
      iconData: Icons.error_outline_rounded,
      iconColor: AppColors.orange,
      title: title ?? 'Lỗi',
      content: content,
      neutralLabel: 'Hủy',
      onNeutralPressed: () => Navigator.of(context).pop(),
    );
  }

  static setupLoading() {
    EasyLoading.instance
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static showLoading({String? title}) {
    EasyLoading.show(
      status: title,
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static hideLoading() {
    EasyLoading.dismiss();
  }

  static show(
    BuildContext context, {
    IconData? iconData,
    Color? iconColor,
    String? title,
    String? content,
    String? primaryLabel,
    void Function()? onPrimaryPressed,
    String? neutralLabel,
    void Function()? onNeutralPressed,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        contentPadding: const EdgeInsets.all(16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (iconData != null)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.gray_1),
                child: Center(
                  child: Icon(
                    iconData,
                    size: 20,
                    color: iconColor,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            if (title != null)
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.foreground,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (title != null) const SizedBox(height: 8),
            if (content != null)
              Text(
                content,
                style: const TextStyle(
                  color: AppColors.foreground,
                  fontSize: 14,
                ),
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (neutralLabel != null)
                  ElevatedButton(
                    onPressed: onNeutralPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.gray_2,
                      shape: const StadiumBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        neutralLabel,
                        style: const TextStyle(
                          color: AppColors.foreground,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                if (primaryLabel != null)
                  ElevatedButton(
                    onPressed: onPrimaryPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.secondary,
                      shape: const StadiumBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        primaryLabel,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static showBottomSheetMenu(
    BuildContext context, {
    String? title,
    required List<BottomSheetAction> items,
  }) async {
    showAdaptiveActionSheet(
      context: context,
      title: title == null ? null : Text(title),
      androidBorderRadius: 30,
      actions: items,
      cancelAction: CancelAction(title: const Text('Đóng')),
    );
  }
}
