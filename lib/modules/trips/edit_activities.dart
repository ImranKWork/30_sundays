import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart';

class EditActivities extends StatefulWidget {
  const EditActivities({super.key});

  @override
  State<EditActivities> createState() => _EditActivitiesState();
}

class _EditActivitiesState extends State<EditActivities> {
  List<bool> isCheckedList = List<bool>.filled(10, false);
  String? customMessage;
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
                      Text("Day 1", style: AppFontFamily.HeadingStyle20()),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16, left: 16, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: isCheckedList.length,
                            padding: const EdgeInsets.only(top: 10),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
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
                                      Image.asset(
                                        "assets/images/party_club.png",
                                        scale: 2.5,
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/clock.png",
                                                  scale: 2.5,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "7 am to 9 am",
                                                  style:
                                                      AppFontFamily.HeadingWhite414(
                                                        color: AppColors.green,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),

                                            SizedBox(
                                              width: Get.width / 2.3,
                                              child: Text(
                                                "Breakfast at cozy cafe in open sky",
                                                style:
                                                    AppFontFamily.HeadingStyle514(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              "Feel the nature vibes in fresh & calm environment",
                                              style: AppFontFamily.BoldStyle()
                                                  .copyWith(
                                                    color: AppColors.blueLight,
                                                  ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "+₹650",
                                                  style:
                                                      AppFontFamily.HeadingStyle618(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColors.primary,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (customMessage != null)
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.lightPink),
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/check2.png", scale: 2),
                  SizedBox(width: 8),
                  Text(
                    customMessage!,
                    style: AppFontFamily.HeadingStyle514().copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        customMessage = null;
                      });
                    },
                    child: Image.asset("assets/images/close.png", scale: 3),
                  ),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            color: Colors.white,
            child: Builder(
              builder: (context) {
                int selectedCount = isCheckedList.where((e) => e).length;
                return CustomButton(
                  width: Get.width,
                  text: "Update",
                  isEnabled: selectedCount > 0,
                  onTap: () {
                    // if (selectedCount > 0) {
                    //   setState(() {
                    //     customMessage =
                    //         "$selectedCount Activities modified successfully.";
                    //   });
                    // }
                    Get.back();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
