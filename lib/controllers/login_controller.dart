import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sunday/modules/auth/verify_otp.dart';
import 'package:sunday/utils/api_service.dart';
import 'package:sunday/utils/shared_pref.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  final TextEditingController phoneController = TextEditingController();

  Future<void> loginWithPhone() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty || phone.length != 10) {
      Get.snackbar('Validation', 'Please enter a valid 10-digit phone number');
      return;
    }

    isLoading.value = true;
    final url = Uri.parse(ApiServices.login);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone}),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final successMessage =
            responseBody['message']?.toString() ?? 'OTP sent successfully';
        Get.snackbar('Success', successMessage);

        Get.to(() => VerifyOtp(phoneNumber: phone));
      } else {
        final errorMessage =
            responseBody['error']?.toString() ??
            responseBody['message']?.toString() ??
            'Login failed. Please try again.';
        Get.snackbar('Error', errorMessage);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> verifyOtp(String phone, String otp) async {
    final url = Uri.parse(ApiServices.verify);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({"phone": phone, "otp": otp});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("✅ Success: $responseData");

        String message =
            responseData['message'] ?? 'OTP verified successfully!';
        String token = responseData['token'];

        await SharedPref.saveToken(token);

        Get.snackbar("Success", message);
        return true;
      } else {
        print("❌ Failed: ${response.statusCode} - ${response.body}");

        String errorMessage = 'Failed to verify OTP. Please try again.';
        try {
          final responseData = jsonDecode(response.body);
          errorMessage = responseData['message'] ?? errorMessage;
        } catch (e) {
          print("⚠️ Error while parsing error message: $e");
        }

        Get.snackbar("Failed", errorMessage);
        return false;
      }
    } catch (e) {
      print("⚠️ Error: $e");
      Get.snackbar("Error", "Error occurred while verifying OTP.");
      return false;
    }
  }

  Future<bool> resendOtp(String phone) async {
    final url = Uri.parse(ApiServices.resend);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({"phone": phone});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("✅ OTP Resent: $responseData");

        String message = responseData['message'] ?? 'OTP resent successfully!';
        Get.snackbar("Success", message);
        return true;
      } else {
        print(
          "❌ Failed to resend OTP: ${response.statusCode} - ${response.body}",
        );

        String errorMessage = 'Failed to resend OTP. Please try again.';
        try {
          final responseData = jsonDecode(response.body);
          errorMessage =
              responseData['error'] ?? responseData['message'] ?? errorMessage;
        } catch (e) {
          print("⚠️ Error while parsing error message: $e");
        }

        Get.snackbar("Failed", errorMessage);
        return false;
      }
    } catch (e) {
      print("⚠️ Error: $e");

      Get.snackbar("Error", "Error occurred while resending OTP.");
      return false;
    }
  }
}
