import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/utils/custom_button.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';

class YourDocuments extends StatefulWidget {
  const YourDocuments({super.key});

  @override
  State<YourDocuments> createState() => _YourDocumentsState();
}

class _YourDocumentsState extends State<YourDocuments> {
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
                  padding: EdgeInsets.only(left: 16.0, right: 4),
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
                          "Your Documents",
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
                                "30 Sundays documents",
                                style: AppFontFamily.HeadingStyle618(),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/doc2.png",
                                    height: 32,
                                    width: 32,
                                  ),
                                  SizedBox(width: 8),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hotel & Sightseeing Voucher",
                                        style: AppFontFamily.smallStyle16(
                                          color: AppColors.primary,
                                        ),
                                      ),

                                      Text(
                                        "0.6 MB",
                                        style: AppFontFamily.HeadingWhite414(
                                          color: AppColors.blueLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/images/download.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(color: AppColors.gray, thickness: 1),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/doc2.png",
                                    height: 32,
                                    width: 32,
                                  ),
                                  SizedBox(width: 8),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Payment Receipts",
                                        style: AppFontFamily.smallStyle16(
                                          color: AppColors.primary,
                                        ),
                                      ),

                                      Text(
                                        "4.6 MB",
                                        style: AppFontFamily.HeadingWhite414(
                                          color: AppColors.blueLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/images/download.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(color: AppColors.gray, thickness: 1),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/doc2.png",
                                    height: 32,
                                    width: 32,
                                  ),
                                  SizedBox(width: 8),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Flight Tickets",
                                        style: AppFontFamily.smallStyle16(
                                          color: AppColors.primary,
                                        ),
                                      ),

                                      Text(
                                        "2.5 MB",
                                        style: AppFontFamily.HeadingWhite414(
                                          color: AppColors.blueLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/images/download.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: CustomButton(text: "Upload documents", onTap: () {}),
      ),
    );
  }
}
