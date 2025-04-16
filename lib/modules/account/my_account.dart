import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/utils/app_color.dart';

import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';
import 'add_account.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16.0, right: 4),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 15),
                  Text("My Account", style: AppFontFamily.HeadingStyle20()),

                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.grey4),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/user.png",
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Varun Sharma",
                              style: AppFontFamily.smallStyle16(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              "+91 9255639749",
                              style: AppFontFamily.smallStyle416(fontSize: 12),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          "assets/images/customize.png",
                          width: 18,
                          height: 15,
                          color: AppColors.pink,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Settings", style: AppFontFamily.HeadingStyle20()),

                  SizedBox(height: 20),
                  Container(
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
                            Get.to(() => AddAccount());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/user2.png",
                                height: 35,
                                width: 35,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Add your partner",
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
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/notification.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Notifications",
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
                        SizedBox(height: 15),
                        Divider(color: AppColors.grey4),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/help.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Help & feedback",
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
                        SizedBox(height: 15),
                        Divider(color: AppColors.grey4),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/term.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Terms & conditions",
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
                        SizedBox(height: 15),
                        Divider(color: AppColors.grey4),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/logout.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Logout",
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
