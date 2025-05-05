import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/shared_pref.dart';

class HotelController extends GetxController {
  var isLoading = true.obs;
  var hotelList = <Map<String, dynamic>>[].obs;
  var activeIndexes = <int>[].obs;
  @override
  void onInit() {
    ever(hotelList, (_) {
      activeIndexes.assignAll(List.filled(hotelList.length, 0));
    });
    fetchHotelData();
    super.onInit();
  }

  Future<void> fetchHotelData() async {
    try {
      isLoading(true);
      String? token = await SharedPref.getToken();
      if (token == null) {
        Get.snackbar("Error", "Unauthorized! Please login again.");
        isLoading(false);
        return;
      }
      final response = await http.get(
        Uri.parse('http://3.111.103.244/api/hotels/402002553316'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['message'] == 'Success') {
          hotelList.value = List<Map<String, dynamic>>.from(data['hotels']);
          print("API Success, Hotel Data:");
          print(data['hotels']);
        } else {
          throw Exception('Failed to load data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
