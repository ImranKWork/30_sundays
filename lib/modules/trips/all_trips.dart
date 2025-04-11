import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/modules/trips/more_action.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';

class AllTrips extends StatefulWidget {
  const AllTrips({super.key});

  @override
  State<AllTrips> createState() => _AllTripsState();
}

class _AllTripsState extends State<AllTrips> {
  final List<String> locations = ['Upcoming', 'Ongoing', 'Past'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("All Trips", style: AppFontFamily.HeadingStyle20()),

                      Image.asset("assets/images/phone.png", scale: 2.5),
                    ],
                  ),
                ),

                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      final location = locations[index];
                      final isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 12),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.pink : Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppColors.pink
                                      : Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              location,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 8),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 12),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.grey4,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                        "assets/images/2.png",
                                        scale: 2.5,
                                      ),
                                      Positioned(
                                        bottom: 12,
                                        right: 12,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => MoreAction());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/duration.png",
                                                  scale: 2.5,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "4 Days to go",
                                                  style:
                                                      AppFontFamily.BoldStyle()
                                                          .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/moon.png",
                                        scale: 2.2,
                                      ),
                                      Text(
                                        "  6 Nights",
                                        style: AppFontFamily.BoldStyle(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  SizedBox(
                                    width: Get.width / 2.3,
                                    child: Text(
                                      "The Best Of Bali: One Where You Don't Miss Anything",
                                      style: AppFontFamily.HeadingStyle514(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "3N Seminyak • 3N Ubud",
                                    style: AppFontFamily.BoldStyle().copyWith(
                                      color: AppColors.blueLight,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Text(
                                        "₹41,199 ",
                                        style: AppFontFamily.HeadingStyle514(),
                                      ),
                                      Text(
                                        "/Person",
                                        style: AppFontFamily.smallStyle16()
                                            .copyWith(
                                              color: AppColors.blueLight,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Divider(color: AppColors.grey4),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/share.png",
                                        scale: 2,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Share Itinerary",
                                        style: AppFontFamily.HeadingStyle514()
                                            .copyWith(color: AppColors.pink),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
