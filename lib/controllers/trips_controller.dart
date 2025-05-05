import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/shared_pref.dart';

class TripController extends GetxController {
  var trips = [].obs;
  var upcomingTrips = [].obs;
  var ongoingTrips = [].obs;

  var isLoading = false.obs;
  var dealIds = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrips();
  }

  Future<void> fetchTrips() async {
    try {
      isLoading(true);

      String? token = await SharedPref.getToken();
      if (token == null) {
        Get.snackbar("Error", "Unauthorized! Please login again.");
        isLoading(false);
        return;
      }

      var response = await http.get(
        Uri.parse('http://3.111.103.244/api/trips'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        print(
          'Trips API Response:\n${JsonEncoder.withIndent('  ').convert(jsonResponse)}',
        );

        trips.value = jsonResponse['trips'] ?? [];

        // Extracting deal_ids and storing in dealIds
        dealIds.value =
            jsonResponse['trips']
                ?.map((trip) => trip["deal_id"].toString())
                .toList() ??
            [];

        // Debugging: Print the first dealId from dealIds
        print('Deal IDs: ${dealIds.value}');

        // After populating dealIds, fetch ongoing trips (using the first dealId)
        if (dealIds.isNotEmpty) {
          print('Fetching ongoing trip for dealId: ${dealIds[0]}');
          fetchOngoingTrips(dealIds[0]); // Pass the first deal_id as example
        }

        upcomingTrips.value =
            jsonResponse['trips']?.where((trip) {
              return trip['daysToGo'] == 'upcoming';
            }).toList() ??
            [];
      } else {
        print('Failed to load trips: ${response.statusCode}');
        print('Failed API Response: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
      print('Fetch trips error: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchOngoingTrips(String dealId) async {
    try {
      isLoading(true);

      String? token = await SharedPref.getToken();
      if (token == null) {
        Get.snackbar("Error", "Unauthorized! Please login again.");
        isLoading(false);
        return;
      }

      var response = await http.get(
        Uri.parse('http://3.111.103.244/api/trips/$dealId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        ongoingTrips.value = [jsonResponse['trip']] ?? [];
      } else {
        print('Failed to load ongoing trip: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
      print('Fetch ongoing trips error: $e');
    } finally {
      isLoading(false);
    }
  }
}
