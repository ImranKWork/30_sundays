import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';
import 'edit_activities.dart';

class DetailsActivities extends StatefulWidget {
  const DetailsActivities({super.key});

  @override
  State<DetailsActivities> createState() => _DetailsActivitiesState();
}

class _DetailsActivitiesState extends State<DetailsActivities> {
  final List<Map<String, String>> locations = [
    {'title': 'Activities', 'image': 'assets/images/activities.png'},
    {'title': 'Hotels', 'image': 'assets/images/hotels.png'},
    // {'title': 'Flights', 'image': 'assets/images/flight.png'},
  ];
  int selectedIndex = 0;
  int selectedDayIndex = 0;
  List<bool> isCheckedList = List<bool>.filled(10, false);
  bool isExpanded = false;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/images/back_arrow.png",
                          scale: 2.5,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Best of Bali",
                        style: AppFontFamily.HeadingStyle20(),
                      ),
                      Spacer(),
                      Image.asset("assets/images/phone.png", scale: 2.5),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      final location = locations[index];
                      final isSelected = index == selectedIndex;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isSelected ? AppColors.pink : Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? AppColors.pink
                                          : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                                boxShadow:
                                    isSelected
                                        ? []
                                        : [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    location['image']!,
                                    height: 16,
                                    width: 16,
                                    color:
                                        isSelected
                                            ? AppColors.white
                                            : AppColors.blueLight,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    location['title']!,
                                    style: AppFontFamily.HeadingStyle14(
                                      color:
                                          isSelected
                                              ? AppColors.white
                                              : AppColors.blueLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (selectedIndex == 0) ...[
                          SizedBox(
                            height: 65,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                final isSelected = index == selectedDayIndex;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDayIndex = index;
                                    });
                                  },
                                  child: Container(
                                    height: 54,
                                    width: 60,
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? AppColors.pink
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        width: 1,
                                        color:
                                            isSelected
                                                ? AppColors.pink
                                                : AppColors.grey4,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Day',
                                          style: AppFontFamily.HeadingWhite414()
                                              .copyWith(
                                                color:
                                                    isSelected
                                                        ? AppColors.white
                                                        : AppColors.primary,
                                              ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          '${index + 1}',
                                          style: AppFontFamily.smallStyle16(
                                            color:
                                                isSelected
                                                    ? AppColors.white
                                                    : AppColors.blueLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10),

                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 8, right: 8),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => EditActivities());
                                },
                                child: Container(
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
                                              child: Text(
                                                "₹1999 /Person",
                                                style:
                                                    AppFontFamily.HeadingWhite414()
                                                        .copyWith(
                                                          color:
                                                              AppColors.primary,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            "Day 1 activities",
                                            style:
                                                AppFontFamily.HeadingStyle514(),
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            "assets/images/calender.png",
                                            height: 12,
                                            width: 12,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "May 9, 2025",
                                            style:
                                                AppFontFamily.HeadingWhite414()
                                                    .copyWith(
                                                      color: AppColors.primary,
                                                    ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: AnimatedCrossFade(
                                              firstChild: Text(
                                                "Explore a cozy café and enjoy a\ndelicious breakfast with fresh coffee and\nlocal specialties",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    AppFontFamily.HeadingWhite414()
                                                        .copyWith(
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                              ),
                                              secondChild: Text(
                                                "Explore a cozy café and enjoy a\ndelicious breakfast with fresh coffee and\nlocal specialties",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    AppFontFamily.HeadingWhite414()
                                                        .copyWith(
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                              ),
                                              crossFadeState:
                                                  isExpanded
                                                      ? CrossFadeState
                                                          .showSecond
                                                      : CrossFadeState
                                                          .showFirst,
                                              duration: Duration(
                                                milliseconds: 200,
                                              ),
                                            ),
                                          ),
                                          // Toggle Button
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Image.asset(
                                                isExpanded
                                                    ? 'assets/images/up_arrow.png'
                                                    : 'assets/images/down_arrow.png',
                                                scale: 2.5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*  Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Explore a cozy café and enjoy a\ndelicious breakfast with fresh coffee and\nlocal specialties",
                                            style: AppFontFamily.HeadingWhite414()
                                                .copyWith(
                                                  color: AppColors.blueLight,
                                                ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Image.asset(
                                            "assets/images/down_arrow.png",
                                            scale: 2.5,
                                          ),
                                        ],
                                      ),*/
                                      SizedBox(height: 5),
                                      /*
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => EditActivities());
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Edit Activities",
                                              style:
                                                  AppFontFamily.HeadingStyle514(
                                                    color: AppColors.pink,
                                                  ),
                                            ),
                                            SizedBox(width: 5),

                                            Image.asset(
                                              "assets/images/right_arr.png",
                                              scale: 2.5,
                                            ),
                                          ],
                                        ),
                                      ),*/
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ] else if (selectedIndex == 1) ...[
                          // === Hotels List ===
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
                                          "assets/images/3.png",
                                          scale: 2.5,
                                        ),
                                        Positioned(
                                          top: 80,
                                          // bottom: 22,
                                          right: 12,
                                          child: Image.asset(
                                            "assets/images/right_arrow.png",
                                            scale: 2.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/star2.png",
                                          height: 12,
                                          width: 12,
                                        ),
                                        SizedBox(width: 8),

                                        Text(
                                          "4 Star hotel",
                                          style: AppFontFamily.HeadingWhite414(
                                            color: AppColors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    Text(
                                      "Ubud Tropical",
                                      style: AppFontFamily.HeadingStyle514(),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/location.png",
                                          height: 14,
                                          width: 11,
                                        ),
                                        SizedBox(width: 8),

                                        Text(
                                          "Petulu, Kecamatan Ubud",
                                          style: AppFontFamily.HeadingWhite414()
                                              .copyWith(
                                                color: AppColors.blueLight,
                                              ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "₹4483 ",
                                                style:
                                                    AppFontFamily.HeadingStyle518(),
                                              ),
                                              TextSpan(
                                                text: "/Night",
                                                style:
                                                    AppFontFamily.smallStyle416(),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "assets/images/b_logo.png",
                                              height: 16,
                                              width: 16,
                                            ),
                                            SizedBox(width: 5),

                                            Text(
                                              "9.2 Rated",
                                              style:
                                                  AppFontFamily.HeadingStyle20()
                                                      .copyWith(fontSize: 14),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      /*  bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: CustomButton(
          width: Get.width,
          text: "Update",
          onTap: () {
            // _showUpdateBottomSheet(context);
          },
          isEnabled: false,
        ),
      ),*/
    );
  }
}
