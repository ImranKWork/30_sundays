import 'package:flutter/material.dart';
import 'package:sunday/utils/app_color.dart';
import 'package:sunday/utils/app_font_family.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isEnabled;
  final double? width;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isEnabled = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.6,
        child: Container(
          width: width ?? 160,
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: isEnabled ? AppColors.pink : AppColors.lightPink,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              text,
              style: AppFontFamily.smallStyle16(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
