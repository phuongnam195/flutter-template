import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {this.imageUrl, this.size = 56, this.isOnline = false, super.key});

  final String? imageUrl;
  final double size;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: SizedBox(
        width: size,
        height: size,
        child: imageUrl == null
            ? Container()
            : Image.network(
                imageUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFEBEBF0),
                  child: const Icon(
                    Icons.error_outline_rounded,
                    color: Color(0xFFA6A6B0),
                  ),
                ),
              ),
      ),
    );
  }
}
