import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/api_service.dart';
import '../utils/shared_pref.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userData = {}.obs;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      print("Fetching user...");

      String? token = await SharedPref.getToken();
      if (token == null) {
        Get.snackbar("Error", "Unauthorized! Please login again.");
        isLoading(false);
        return;
      }

      final response = await http.get(
        Uri.parse(ApiServices.user),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
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
