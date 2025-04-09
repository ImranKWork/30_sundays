import 'package:flutter/material.dart';
import 'package:sunday/utils/app_font_family.dart';

import '../../utils/app_color.dart';
import '../../utils/custom_widget.dart';

class Successfully extends StatefulWidget {
  const Successfully({super.key});

  @override
  State<Successfully> createState() => _SuccessfullyState();
}

class _SuccessfullyState extends State<Successfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const ColorOverlays(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/success.png', // ✅ Make sure this path is correct
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 20),
                Text(
                  'Login successfully!',
                  style: AppFontFamily.defaultStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
