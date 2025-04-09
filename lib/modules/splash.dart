import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/custom_widget.dart';
import 'auth/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const ColorOverlays(),
            Positioned(
              top: screenHeight * 0.01,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/30sundays.png",
                alignment: Alignment.center,
                height: 382,
                width: 360,
              ),
            ),

            Positioned(
              top: screenHeight * 0.20 + 100,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/vacation_text.png",
                scale: 3.8,
                alignment: Alignment.center,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/OBJECTS.png",
                width: 380.64,
                height: 390.29,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
