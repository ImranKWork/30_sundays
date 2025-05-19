import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';

class HelpFeedback extends StatefulWidget {
  const HelpFeedback({super.key});

  @override
  State<HelpFeedback> createState() => _HelpFeedbackState();
}

class _HelpFeedbackState extends State<HelpFeedback> {
  void openCallSupport() async {
    final Uri callUri = Uri(
      scheme: 'tel',
      path: '1234567890',
    ); // Replace with your support number
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $callUri';
    }
  }

  void openPlayStoreRating() async {
    const String appId = 'com.sunday.package';
    final Uri playStoreUri = Uri.parse(
      'https://play.google.com/store/apps/details?id=$appId',
    );
    if (await canLaunchUrl(playStoreUri)) {
      await launchUrl(playStoreUri);
    } else {
      throw 'Could not launch $playStoreUri';
    }
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
                          "Help & feedback",
                          style: AppFontFamily.HeadingStyle20(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16,
                    top: 24,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.grey4),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            openCallSupport();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/call.png",
                                height: 35,
                                width: 35,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Contact Us",
                                style: AppFontFamily.smallStyle16(
                                  color: AppColors.primary,
                                ),
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/images/right_arr.png",
                                width: 20,
                                height: 20,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Divider(color: AppColors.grey4),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/feedback.png",
                                height: 35,
                                width: 35,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Feedback for our app",
                                style: AppFontFamily.smallStyle16(
                                  color: AppColors.primary,
                                ),
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/images/right_arr.png",
                                width: 20,
                                height: 20,
                                color: AppColors.primary,
                              ),
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
    );
  }
}
