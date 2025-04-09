import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sunday/modules/auth/login_screen.dart';
import 'package:sunday/modules/auth/successful.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart';

class VerifyOtp extends StatefulWidget {
  final String phoneNumber;

  const VerifyOtp({super.key, required this.phoneNumber});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;

  bool _isButtonEnabled = false;
  bool _isResendEnabled = false;
  bool _isOtpCompleted = false;
  String? _otpErrorMessage;

  int _secondsRemaining = 60;
  Timer? _timer;

  final defaultPinTheme = PinTheme(
    width: 200,
    textStyle: AppFontFamily.HeadingStyle32().copyWith(
      color: AppColors.primary,
    ),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColors.grey2, width: 2)),
    ),
  );

  final transparentUnderlinePinTheme = PinTheme(
    width: 200,
    textStyle: AppFontFamily.HeadingStyle32().copyWith(
      color: AppColors.primary,
    ),
    decoration: const BoxDecoration(), // No underline
  );

  final submittedPinTheme = PinTheme(
    width: 200,
    textStyle: AppFontFamily.HeadingStyle32().copyWith(
      color: AppColors.primary,
    ),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColors.primary, width: 2)),
    ),
  );

  late final PinTheme focusedPinTheme;

  final errorPinTheme = PinTheme(
    width: 200,
    textStyle: AppFontFamily.HeadingStyle32().copyWith(color: AppColors.pink),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColors.pink, width: 2)),
    ),
  );
  final pinkTextOnlyTheme = PinTheme(
    width: 200,
    textStyle: AppFontFamily.HeadingStyle32().copyWith(color: AppColors.pink),
    decoration: const BoxDecoration(), // no underline
  );

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    focusNode = FocusNode();

    focusedPinTheme = defaultPinTheme.copyWith(
      textStyle: AppFontFamily.HeadingStyle32().copyWith(
        color: AppColors.primary,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.primary, width: 2)),
      ),
    );

    _startCountdown();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });

    pinController.addListener(() {
      setState(() {
        _isButtonEnabled = pinController.text.length == 6;
      });
    });
  }

  void _startCountdown() {
    _secondsRemaining = 60;
    _isResendEnabled = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isResendEnabled = true;
        });
        _timer?.cancel();
      }
    });
  }

  void _resendOtp() {
    debugPrint("Resending OTP to ${widget.phoneNumber}");
    _startCountdown();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("OTP has been resent")));
  }

  void _validateOtp() {
    String otp = pinController.text.trim();

    if (otp.isEmpty || otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 6-digit OTP")),
      );
      return;
    }

    debugPrint("Verifying OTP: $otp");

    Get.to(() => Successfully());
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    _timer?.cancel();
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
                  Image.asset(
                    "assets/images/line2.png",
                    height: 10,
                    width: 120,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Verification code",
                    style: AppFontFamily.HeadingStyle20(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "We have sent the OTP on ${widget.phoneNumber}",
                    style: AppFontFamily.HeadingStyle14(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),

                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Pinput(
                          length: 6,
                          controller: pinController,
                          focusNode: focusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          defaultPinTheme:
                              _otpErrorMessage != null
                                  ? pinkTextOnlyTheme
                                  : (_isOtpCompleted
                                      ? transparentUnderlinePinTheme
                                      : defaultPinTheme),

                          focusedPinTheme:
                              _otpErrorMessage != null
                                  ? pinkTextOnlyTheme
                                  : (_isOtpCompleted
                                      ? transparentUnderlinePinTheme
                                      : focusedPinTheme),

                          submittedPinTheme:
                              _otpErrorMessage != null
                                  ? pinkTextOnlyTheme
                                  : (_isOtpCompleted
                                      ? transparentUnderlinePinTheme
                                      : submittedPinTheme),

                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          showCursor: true,
                          cursor: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 2,
                              height: 20,
                              color: AppColors.primary,
                            ),
                          ),
                          onCompleted: (pin) {
                            setState(() {
                              _isOtpCompleted = true;
                              _otpErrorMessage =
                                  pin == '222222' ? null : 'Invalid OTP';
                            });
                          },
                          onChanged: (value) {
                            if (value.length < 6) {
                              setState(() {
                                _isOtpCompleted = false;
                                _otpErrorMessage = null;
                              });
                            }
                          },
                          separatorBuilder: (index) => const SizedBox(width: 8),
                        ),

                        if (_otpErrorMessage != null) ...[
                          const SizedBox(height: 12),
                          Text(
                            _otpErrorMessage!,
                            style: AppFontFamily.HeadingStyle14().copyWith(
                              color: AppColors.pink,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  _isResendEnabled
                      ? TextButton(
                        onPressed: _resendOtp,
                        child: Text(
                          "Resend OTP",
                          style: AppFontFamily.smallStyle16().copyWith(
                            color: AppColors.pink,
                          ),
                        ),
                      )
                      : Text(
                        "Resend code after $_secondsRemaining seconds",
                        style: AppFontFamily.HeadingStyle14().copyWith(
                          color: AppColors.primary,
                        ),
                      ),

                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text(
                      "Change phone number",
                      style: AppFontFamily.smallStyle16().copyWith(
                        color: AppColors.pink,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  CustomButton(
                    text: "Submit",
                    onTap: _validateOtp,
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
