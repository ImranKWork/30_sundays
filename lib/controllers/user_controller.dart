import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  void fetchUser() async {
    try {
      isLoading(true);
      print("Fetching user...");
      final response = await http.get(
        Uri.parse('http://3.111.103.244/api/user'),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("Parsed JSON: $jsonResponse");

        userData.value = jsonResponse['data'] ?? {};
        print("User Data Updated: ${userData.value}");
      } else {
        Get.snackbar("Error", "Failed to fetch user: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print("Fetch error: $e");
    } finally {
      isLoading(false);
    }
  }
}
