import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sunday/modules/auth/verify_otp.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart'; // For ColorOverlays

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode(); // NEW
  bool _hasError = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateInput);

    // Request focus after first frame renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_phoneFocusNode);
    });
  }

  void _validateInput() {
    final input = _phoneController.text;
    setState(() {
      _isButtonEnabled = input.length == 10;
      _hasError = false;
    });
  }

  void _validatePhone() {
    setState(() {
      _hasError = _phoneController.text.length != 10;
    });

    if (!_hasError) {
      final phone = _phoneController.text;
      print("Phone number valid: $phone");

      Get.to(() => VerifyOtp(phoneNumber: phone));
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const ColorOverlays(),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset("assets/images/tree.png", height: 96, width: 96),
                  Image.asset("assets/images/line.png", height: 10, width: 120),
                  const SizedBox(height: 20),

                  Text(
                    "What’s your phone number?",
                    style: AppFontFamily.HeadingStyle20(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "You'll receive an OTP to begin",
                    style: AppFontFamily.HeadingStyle14(),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: 240,
                    child: TextField(
                      cursorHeight: 24,
                      controller: _phoneController,
                      focusNode: _phoneFocusNode,
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      style: AppFontFamily.HeadingStyle32().copyWith(
                        color: _hasError ? Colors.red : AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Type here',
                        hintStyle: AppFontFamily.HeadingStyle32(),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 180),

                  CustomButton(
                    text: "Get OTP",
                    onTap: _validatePhone,
                    isEnabled: _isButtonEnabled,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
