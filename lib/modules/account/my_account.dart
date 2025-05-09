import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/controllers/user_controller.dart';
import 'package:sunday/modules/account/notification.dart';
import 'package:sunday/modules/account/term_condition.dart';
import 'package:sunday/modules/auth/login_screen.dart';
import 'package:sunday/utils/app_color.dart';

import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';
import '../../utils/shared_pref.dart';
import 'help_feedback.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final UserController userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 20),
                  Text("My Account", style: AppFontFamily.HeadingStyle20()),
                  SizedBox(height: 20),
                  Obx(() {
                    final user = userController.userData;

                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.grey4),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            user['img'] ?? "assets/images/user.png",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name'] ?? '',
                                style: AppFontFamily.smallStyle16(
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                user['phone'] ?? '',
                                style: AppFontFamily.smallStyle416(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          /* Spacer(),
                          Image.asset(
                            "assets/images/customize.png",
                            width: 18,
                            height: 15,
                            color: AppColors.pink,
                          ),*/
                        ],
                      ),
                    );
                  }),
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
                        /* GestureDetector(
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
                        SizedBox(height: 15),*/
                        GestureDetector(
                          onTap: () {
                            Get.to(() => NotificationPage());
                          },
                          child: Row(
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
                        ),
                        SizedBox(height: 15),
                        Divider(color: AppColors.grey4),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => HelpFeedback());
                          },
                          child: Row(
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
                        ),
                        SizedBox(height: 15),
                        Divider(color: AppColors.grey4),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => TermCondition());
                          },
                          child: Row(
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
                        ),
                        SizedBox(height: 15),
                        Divider(color: AppColors.grey4),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text("Logout"),
                                  content: Text(
                                    "Are you sure you want to logout?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: AppFontFamily.smallStyle16(
                                          fontSize: 14,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await SharedPref.clearToken();
                                        Get.offAll(() => LoginScreen());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.white,
                                      ),
                                      child: Text(
                                        "Logout",
                                        style: AppFontFamily.smallStyle16(
                                          color: AppColors.pink,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
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
