import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/utils/app_font_family.dart';

import '../../utils/app_color.dart';
import '../../utils/custom_widget.dart';
import '../dashboard.dart';

class Successfully extends StatefulWidget {
  const Successfully({super.key});

  @override
  State<Successfully> createState() => _SuccessfullyState();
}

class _SuccessfullyState extends State<Successfully> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const DashBoard());
    });
  }

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
                Image.asset('assets/images/success.png', width: 80, height: 80),
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
