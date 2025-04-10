import 'package:flutter/material.dart';

class ColorOverlays extends StatelessWidget {
  const ColorOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/yellow_overlay.png',
              fit: BoxFit.cover,
              height: screenHeight,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/pink_overlay.png',
              fit: BoxFit.cover,
              height: screenHeight,
            ),
          ),
        ],
      ),
    );
  }
}
