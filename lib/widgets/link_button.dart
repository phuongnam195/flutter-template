// import 'package:flutter/material.dart';

// class LinkButton extends StatelessWidget {
//   final String text;
//   final void Function()? onTap;
//   final double? fontSize;
//   final String? url;

//   const LinkButton({required this.text, this.onTap, this.fontSize, this.url, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(6),
//       splashColor: AppColors.link.withOpacity(0.1),
//       onTap: onTap ??
//           () {
//             if (!url.isNullOrEmpty) {
//               launchUrl(Uri.parse(url!));
//             }
//           },
//       child: Text(
//         text,
//         style: AppTextStyle.medium().copyWith(
//           color: AppColors.link,
//           fontSize: fontSize,
//         ),
//         overflow: TextOverflow.ellipsis,
//       ),
//     );
//   }
// }
