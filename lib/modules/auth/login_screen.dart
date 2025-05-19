import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());

  final FocusNode _phoneFocusNode = FocusNode();
  bool _hasError = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    authController.phoneController.clear();

    authController.phoneController.addListener(_validateInput);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_phoneFocusNode);
    });
  }

  void _validateInput() {
    final input = authController.phoneController.text;
    setState(() {
      _isButtonEnabled = input.length == 10;
      _hasError = false;
    });
  }

  @override
  void dispose() {
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
                      controller: authController.phoneController,
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

                  // if (_hasError)
                  //   const Padding(
                  //     padding: EdgeInsets.only(top: 8),
                  //     child: Text(
                  //       "Please enter a valid 10-digit phone number",
                  //       style: TextStyle(color: Colors.red, fontSize: 14),
                  //     ),
                  //   ),
                  const SizedBox(height: 180),

                  Obx(
                    () =>
                        authController.isLoading.value
                            ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                minimumSize: const Size(160, 48),
                              ),
                              onPressed: null,
                              child: const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                  strokeWidth: 3,
                                ),
                              ),
                            )
                            : CustomButton(
                              text: "Get OTP",
                              onTap: () async {
                                final success =
                                    await authController.loginWithPhone();
                                if (!success) {
                                  setState(() {
                                    _hasError = true;
                                  });
                                }
                              },
                              isEnabled: _isButtonEnabled,
                            ),
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
