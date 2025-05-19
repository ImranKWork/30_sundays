import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart';

class DocumentsDetails extends StatefulWidget {
  const DocumentsDetails({super.key});

  @override
  State<DocumentsDetails> createState() => _DocumentsDetailsState();
}

class _DocumentsDetailsState extends State<DocumentsDetails> {
  int selectedDayIndex = 0;
  List<bool> isCheckedList = List<bool>.filled(10, false);
  List<String> imageList = [
    "assets/images/4.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];

  final List<Map<String, dynamic>> items = [
    {"image": "assets/images/docs.png", "name": "Your documents"},
    {"image": "assets/images/ice_cream.png", "name": "Where to eat?"},
    {"image": "assets/images/shop2.png", "name": "Shopping"},
    {"image": "assets/images/lang.png", "name": "Translator"},
  ];

  int selectedIndex = 0;
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
                      SizedBox(
                        width: Get.width / 1.4,
                        child: Text(
                          "The Best Of Bali: One Where You Don't Miss Anything",
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
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: SizedBox(
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
                              color: isSelected ? AppColors.pink : Colors.white,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  '${index + 9}',
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
                ),

                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                                    "assets/images/hotel.png",
                                    scale: 2.5,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    top: 0,
                                    child: Image.asset(
                                      "assets/images/video.png",
                                      scale: 3,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Transfer from Bali Airport to The 101 Bali Fontana Hotel",
                                style: AppFontFamily.smallStyle16(
                                  color: AppColors.primary,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Start your Bali journey with a comfortable private AC car transfer from Bali Airport to The 101 Bali Fontana Hotel, a luxurious retreat known for its stunning views and exceptional service.",
                                style: AppFontFamily.HeadingWhite414().copyWith(
                                  color: AppColors.blueLight,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 15),

                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/clock.png",
                                    scale: 1.8,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "3:40 AM",
                                    style: AppFontFamily.smallStyle416(
                                      color: AppColors.green,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.grey4,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pickup at 3:40 AM from Bali Airport',
                                      style: AppFontFamily.smallStyle16(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/star3.png",
                                          width: 11.35,
                                          height: 12,
                                        ),
                                        SizedBox(width: 8),
                                        SizedBox(
                                          width: Get.width / 1.4,
                                          child: Text(
                                            'Your personal cab will be waiting for you',
                                            style:
                                                AppFontFamily.HeadingStyle14(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/star3.png",
                                          width: 11.35,
                                          height: 12,
                                        ),
                                        SizedBox(width: 8),
                                        SizedBox(
                                          width: Get.width / 1.4,
                                          child: Text(
                                            'You’ll reach your hotel at 4:30 AM',
                                            style:
                                                AppFontFamily.HeadingStyle14(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/star3.png",
                                          width: 11.35,
                                          height: 12,
                                        ),
                                        SizedBox(width: 8),

                                        SizedBox(
                                          width: Get.width / 1.4,
                                          child: Text(
                                            'Have your breakfast at hotel till 10:00 AM',
                                            style:
                                                AppFontFamily.HeadingStyle14(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/star3.png",
                                          width: 11.35,
                                          height: 12,
                                        ),
                                        SizedBox(width: 8),
                                        SizedBox(
                                          width: Get.width / 1.4,
                                          child: Text(
                                            'Mountain visit at 11:00 AM',
                                            style:
                                                AppFontFamily.HeadingStyle14(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 8),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, listIndex) {
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
                                      CarouselSlider(
                                        items:
                                            imageList.map((imagePath) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.asset(
                                                  imagePath,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  scale: 2.5,
                                                ),
                                              );
                                            }).toList(),
                                        //carouselController: carouselControllers[listIndex],
                                        options: CarouselOptions(
                                          height: 180,
                                          viewportFraction: 1.0,
                                          enableInfiniteScroll:
                                              true, // optional: enable loop
                                          autoPlay:
                                              true, // ✅ enables auto scroll
                                          autoPlayInterval: Duration(
                                            seconds: 3,
                                          ), // change interval if needed
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              activeIndexes[listIndex] = index;
                                            });
                                          },
                                        ),
                                      ),

                                      // Dots
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

                                      // Right arrow
                                      Positioned(
                                        top: 80,
                                        right: 12,
                                        child: GestureDetector(
                                          onTap: () {
                                            int nextIndex =
                                                activeIndexes[listIndex] + 1;
                                            if (nextIndex < imageList.length) {
                                              // carouselControllers[listIndex]
                                              //     .animateToPage(
                                              //       nextIndex,
                                              //       duration: Duration(
                                              //         milliseconds: 300,
                                              //       ),
                                              //       curve: Curves.linear,
                                              //     );
                                            }
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
                                  SizedBox(height: 10),
                                  Text(
                                    "Amarea Resort & Spa",
                                    style: AppFontFamily.HeadingStyle514(),
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
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  SizedBox(height: 8),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          "More Actions",
                          style: AppFontFamily.HeadingStyle618(),
                        ),
                        SizedBox(height: 15),
                        GridView.builder(
                          itemCount: items.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.4,
                              ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (index == 0) {
                                  //  Get.to(() => DetailsActivities());
                                } else if (index == 1) {
                                  //   Get.to(() => YourDocuments());
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColors.gray),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      items[index]['image'],
                                      scale: 3.8,
                                      // height: 40,
                                      // width: 40,
                                    ),
                                    SizedBox(height: 18),
                                    Text(
                                      items[index]['name'],
                                      style: AppFontFamily.HeadingStyle518(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 15),
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
        padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
        child: CustomButton(text: "Need help?", onTap: () {}),
      ),
    );
  }
}
