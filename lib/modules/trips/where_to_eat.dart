import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';

class WhereToEat extends StatefulWidget {
  const WhereToEat({super.key});

  @override
  State<WhereToEat> createState() => _WhereToEatState();
}

class _WhereToEatState extends State<WhereToEat> {
  final List<String> locations = ['Ubud', 'Seminyak', 'Kuta', 'Nusa dua'];
  List<String> imageList = [
    "assets/images/4.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];
  int selectedIndex = 0;
  bool isLoading = false;

  List<CarouselController> carouselControllers = [];
  List<int> activeIndexes = [];

  @override
  void initState() {
    super.initState();
    int itemCount = 3;
    carouselControllers = List.generate(itemCount, (_) => CarouselController());
    activeIndexes = List.generate(itemCount, (_) => 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 4),
                  child: Row(
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
                      SizedBox(
                        width: Get.width / 1.4,
                        child: Text(
                          "Where to eat",
                          style: AppFontFamily.HeadingStyle20(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Image.asset("assets/images/phone.png", scale: 2.3),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    itemBuilder: (context, index) {
                      final location = locations[index];
                      final isSelected = index == selectedIndex;
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(Duration(milliseconds: 500));

                          setState(() {
                            selectedIndex = index;
                            isLoading = false;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
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
                            boxShadow:
                                isSelected
                                    ? []
                                    : [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 4,
                                      ),
                                    ],
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
                SizedBox(height: 18),
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
                          itemBuilder: (context, listIndex) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 12),
                              padding: EdgeInsets.only(
                                left: 12,
                                top: 12,
                                bottom: 12,
                                // right: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      CarouselSlider(
                                        items:
                                            imageList.map((imagePath) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                  right: 12,
                                                ),
                                                decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //   color: Colors.grey.shade300,
                                                  //   width: 1,
                                                  // ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.asset(
                                                    imagePath,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    //  scale: 2.5,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                        options: CarouselOptions(
                                          height: 180,
                                          viewportFraction: 1.0,
                                          enableInfiniteScroll: true,
                                          autoPlay: true,
                                          autoPlayInterval: Duration(
                                            seconds: 3,
                                          ),
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              activeIndexes[listIndex] = index;
                                            });
                                          },
                                        ),
                                      ),

                                      Positioned(
                                        bottom: 10,
                                        left: 0,
                                        right: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children:
                                              imageList.asMap().entries.map((
                                                entry,
                                              ) {
                                                return Container(
                                                  width:
                                                      activeIndexes[listIndex] ==
                                                              entry.key
                                                          ? 40.0
                                                          : 8.0,
                                                  height:
                                                      activeIndexes[listIndex] ==
                                                              entry.key
                                                          ? 6.0
                                                          : 8.0,
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 4.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    color:
                                                        activeIndexes[listIndex] ==
                                                                entry.key
                                                            ? AppColors.white
                                                            : AppColors.grey4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                      Positioned(
                                        top: 80,
                                        right: 20,
                                        child: GestureDetector(
                                          onTap: () {
                                            int nextIndex =
                                                activeIndexes[listIndex] + 1;
                                            if (nextIndex < imageList.length) {}
                                          },
                                          child: Image.asset(
                                            "assets/images/right_arrow.png",
                                            scale: 2.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "Donna",
                                        style: AppFontFamily.HeadingStyle514(),
                                      ),
                                      Spacer(),
                                      Image.asset(
                                        "assets/images/star2.png",
                                        height: 12,
                                        width: 12,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "4.8 Star",
                                        style: AppFontFamily.HeadingWhite414(
                                          color: AppColors.green,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/location.png",
                                        height: 14,
                                        width: 11,
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "Petulu, Kecamatan Ubud",
                                          style: AppFontFamily.HeadingWhite414()
                                              .copyWith(
                                                color: AppColors.blueLight,
                                              ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        "Indonesian • Chinese • Indian",
                                        style: AppFontFamily.BoldStyle(),
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "₹600",
                                              style:
                                                  AppFontFamily.HeadingStyle514(),
                                            ),
                                            TextSpan(
                                              text: " /Person",
                                              style:
                                                  AppFontFamily.HeadingStyle514(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 12),
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

          // Loader Overlay
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.pink),
              ),
            ),
        ],
      ),
    );
  }
}
