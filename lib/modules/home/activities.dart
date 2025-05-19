import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/controllers/hotel_controller.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final List<Map<String, String>> locations = [
    {'title': 'Activities', 'image': 'assets/images/activities.png'},
    {'title': 'Hotels', 'image': 'assets/images/hotels.png'},
    // {'title': 'Flights', 'image': 'assets/images/flight.png'},
  ];
  int selectedIndex = 0;
  int selectedDayIndex = 0;
  List<bool> isCheckedList = List<bool>.filled(10, false);
  final HotelController hotelController = Get.put(HotelController());
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hotelController.fetchHotelData();
  }

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
                          scale: 2.3,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Best of Bali",
                        style: AppFontFamily.HeadingStyle20(),
                      ),
                      Spacer(),
                      Image.asset("assets/images/phone.png", scale: 2.3),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 6),
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
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
                          margin: EdgeInsets.only(
                            left: index == 0 ? 12 : 8,
                            right: index == locations.length - 1 ? 12 : 0,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
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
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (selectedIndex == 0) ...[
                          SizedBox(
                            height: 58,
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
                            padding: EdgeInsets.only(top: 8, right: 16),
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
                                          style: AppFontFamily.HeadingWhite414()
                                              .copyWith(
                                                color: AppColors.darkBlue,
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
                                                    ? CrossFadeState.showSecond
                                                    : CrossFadeState.showFirst,
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
                                                  ? 'assets/images/down_arrow.png'
                                                  : 'assets/images/down_arrow.png',
                                              scale: 2.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ] else if (selectedIndex == 1) ...[
                          // === Hotels List ===
                          Obx(() {
                            return ListView.builder(
                              itemCount: hotelController.hotelList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 8),
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final hotel = hotelController.hotelList[index];
                                List<String> imageUrls = List<String>.from(
                                  hotel['imgs'] ?? [],
                                );

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          if (imageUrls.isNotEmpty)
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: CarouselSlider.builder(
                                                itemCount: imageUrls.length,
                                                itemBuilder:
                                                    (
                                                      ctx,
                                                      itemIndex,
                                                      pageViewIndex,
                                                    ) => Image.network(
                                                      imageUrls[itemIndex],
                                                      fit: BoxFit.cover,
                                                      width: Get.width,
                                                      height: 200,
                                                    ),
                                                options: CarouselOptions(
                                                  height: 200,
                                                  viewportFraction: 1.0,
                                                  enlargeCenterPage: false,
                                                  enableInfiniteScroll: true,
                                                  autoPlay: true,
                                                ),
                                              ),
                                            )
                                          else
                                            Center(
                                              child: Text(
                                                "No images available",
                                              ),
                                            ),

                                          Positioned(
                                            top: 80,
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
                                            style:
                                                AppFontFamily.HeadingWhite414(
                                                  color: AppColors.green,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),

                                      Text(
                                        hotel['name'],
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
                                            hotel['location'],
                                            style:
                                                AppFontFamily.HeadingWhite414()
                                                    .copyWith(
                                                      color:
                                                          AppColors.blueLight,
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
                                                  text: "₹${hotel['price']}",
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
                            );
                          }),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 173,
                height: 48,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 38,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColors.grey4),
                ),
                child: Center(
                  child: Text(
                    "Create new",
                    style: AppFontFamily.smallStyle16(
                      color: AppColors.blueLight,
                    ),
                  ),
                ),
              ),
            ),
            CustomButton(
              text: "Update",
              onTap: () {
                _showUpdateBottomSheet(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: RawMaterialButton(
        onPressed: () {},
        elevation: 0.0, // Remove shadow if needed
        fillColor: Colors.transparent, // No background
        shape: const CircleBorder(),
        constraints: const BoxConstraints.tightFor(width: 70.0, height: 70.0),
        child: ClipOval(
          child: Image.asset(
            "assets/images/star.png",
            fit: BoxFit.cover,
            width: 70,
            height: 70,
          ),
        ),
      ),
    );
  }

  void _showUpdateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 10,
                          bottom: 70,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Drag Indicator
                            Center(
                              child: Container(
                                height: 4,
                                width: 40,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xffA6A6A6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),

                            SizedBox(height: 8),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/star1.png",
                                  scale: 2.5,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "30 Sundays Suggestions",
                                  style: AppFontFamily.HeadingStyle618(),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Image.asset(
                                    "assets/images/close.png",
                                    scale: 2.8,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Suggestion List
                            Expanded(
                              child: ListView.builder(
                                itemCount: isCheckedList.length,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 40,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setModalState(() {
                                        isCheckedList[index] =
                                            !isCheckedList[index];
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.only(top: 12),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 1,
                                          color:
                                              isCheckedList[index]
                                                  ? AppColors.pink
                                                  : AppColors.grey4,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 10,
                                            ), // add space manually
                                            child: Image.asset(
                                              "assets/images/1.png",
                                              scale: 2.5,
                                            ),
                                          ),

                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: Get.width / 2.3,
                                                  child: Text(
                                                    "Add Lombok islands: Increase your stay by 2 nights",
                                                    style:
                                                        AppFontFamily.HeadingStyle514(),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(height: 6),
                                                Text(
                                                  "Feel the nature vibes in\nfresh & calm environment",
                                                  style:
                                                      AppFontFamily.BoldStyle()
                                                          .copyWith(
                                                            color:
                                                                AppColors
                                                                    .blueLight,
                                                          ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "+₹4320",
                                                      style:
                                                          AppFontFamily.HeadingStyle618(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                AppColors.pink,
                                                          ),
                                                    ),
                                                    Spacer(),
                                                    Image.asset(
                                                      isCheckedList[index]
                                                          ? 'assets/images/check.png'
                                                          : 'assets/images/uncheck.png',
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                    const SizedBox(width: 10),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Bottom Fixed Button
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          color: Colors.white,
                          child: Builder(
                            builder: (context) {
                              int selectedCount =
                                  isCheckedList.where((e) => e).length;
                              return CustomButton(
                                text:
                                    selectedCount > 0
                                        ? "Add ($selectedCount) suggestions"
                                        : "Add",
                                isEnabled: selectedCount > 0,
                                onTap: () {
                                  if (selectedCount > 0) {
                                    Get.back(); // Close the bottom sheet
                                    // Handle selection
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
