import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/modules/trips/where_to_eat.dart';
import 'package:sunday/modules/trips/your_documents.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';
import 'details_activities.dart';

class MoreAction extends StatefulWidget {
  const MoreAction({super.key});

  @override
  State<MoreAction> createState() => _MoreActionState();
}

class _MoreActionState extends State<MoreAction> {
  double progressValue = 0.4;
  final List<Map<String, dynamic>> items = [
    {"image": "assets/images/edit.png", "name": "View"},
    {"image": "assets/images/doc2.png", "name": "Your documents"},
    {"image": "assets/images/visa.png", "name": "Visa"},
    {"image": "assets/images/forex.png", "name": "Forex"},
    {"image": "assets/images/insurance.png", "name": "Insurance"},
    {"image": "assets/images/flights.png", "name": "Before you go"},
  ];
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(
                        width: Get.width / 1.4,
                        child: Text(
                          "The best of Bali: One Where...",
                          style: AppFontFamily.HeadingStyle20(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Image.asset("assets/images/phone.png", scale: 2.5),
                    ],
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
                              Text(
                                "4 Days left for your trip!",
                                style: AppFontFamily.smallStyle16(
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(height: 10),

                              LinearProgressIndicator(
                                value: progressValue,
                                backgroundColor: AppColors.greenShade,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.green,
                                ),
                                minHeight: 8,

                                borderRadius: BorderRadius.circular(100),
                              ),
                              SizedBox(height: 12),

                              Text(
                                "Hooray! Your trip starts in 4 days :)",
                                style: AppFontFamily.HeadingWhite414(
                                  color: AppColors.blueLight,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              Row(
                                children: [
                                  Text(
                                    "1 Installment left!",
                                    style: AppFontFamily.smallStyle16(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Spacer(),
                                  /*   Text(
                                    "Pay now",
                                    style: AppFontFamily.HeadingStyle514(
                                      color: AppColors.pink,
                                    ),
                                  ),
                                  SizedBox(width: 5),

                                  Image.asset(
                                    "assets/images/right_arr.png",
                                    scale: 2.5,
                                  ),*/
                                ],
                              ),
                              SizedBox(height: 10),
                              LinearProgressIndicator(
                                value: progressValue,
                                backgroundColor: AppColors.greenShade,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.green,
                                ),
                                minHeight: 8,

                                borderRadius: BorderRadius.circular(100),
                              ),
                              SizedBox(height: 12),

                              Text(
                                "Rs. 20,000 remaining. You have paid Rs. 60,000.",
                                style: AppFontFamily.HeadingWhite414(
                                  color: AppColors.blueLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "More Actions",
                          style: AppFontFamily.HeadingStyle618().copyWith(
                            fontWeight: FontWeight.w600,
                          ),
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
                                  Get.to(() => DetailsActivities());
                                } else if (index == 1) {
                                  Get.to(() => YourDocuments());
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColors.gray),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                        0.1,
                                      ), // Shadow color
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      items[index]['image'],
                                      scale: 3.5,
                                      // height: 40,
                                      // width: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      items[index]['name'],
                                      style: AppFontFamily.HeadingStyle518()
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        Text(
                          "30 Sundays Recommendations",
                          style: AppFontFamily.HeadingStyle618(),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => WhereToEat());
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 12,
                              top: 12,
                              bottom: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.gray),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Where to Eat",
                                      style: AppFontFamily.HeadingStyle518()
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Find the best place to eat",
                                      style: AppFontFamily.HeadingWhite414(
                                        color: AppColors.blueLight,
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    Row(
                                      children: [
                                        Text(
                                          "Explore",
                                          style: AppFontFamily.HeadingStyle514(
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
                                  ],
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/images/foods.png",
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        /* Container(
                          padding: EdgeInsets.only(
                            left: 12,
                            top: 12,
                            bottom: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.gray),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/shop.png",
                                height: 80,
                                width: 80,
                              ),

                              SizedBox(width: 20),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Where to Shop",
                                    style: AppFontFamily.HeadingStyle518()
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Find the best place to eat",
                                    style: AppFontFamily.HeadingWhite414(
                                      color: AppColors.blueLight,
                                    ),
                                  ),
                                  SizedBox(height: 15),

                                  Row(
                                    children: [
                                      Text(
                                        "Explore",
                                        style: AppFontFamily.HeadingStyle514(
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
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),*/
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
