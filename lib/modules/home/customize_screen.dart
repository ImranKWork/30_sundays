import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/utils/app_color.dart';

import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart';
import 'activities.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  final List<String> locations = ['Bali', 'Vietnam'];
  int selectedIndex = 0;
  List<bool> isChecked = List.filled(5, false);

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Itinerary",
                        style: AppFontFamily.HeadingStyle20(),
                      ),

                      Image.asset("assets/images/phone.png", scale: 2.5),
                    ],
                  ),
                ),

                SizedBox(
                  height: 43,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
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
                          margin: EdgeInsets.only(left: 12),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 6,
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
                SizedBox(height: 10),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.only(top: 12),
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
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => Activities());
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 15),
                                              Image.asset(
                                                "assets/images/1.png",
                                                scale: 2.5,
                                              ),
                                              SizedBox(width: 15),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/moon.png",
                                                        scale: 2.2,
                                                      ),
                                                      Text(
                                                        "  6 Nights",
                                                        style:
                                                            AppFontFamily.BoldStyle(),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 6),
                                                  SizedBox(
                                                    width: Get.width / 2.3,
                                                    child: Text(
                                                      "The Best Of Bali: One Where You Don't Miss Anything",
                                                      style:
                                                          AppFontFamily.HeadingStyle514(),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(height: 6),
                                                  Text(
                                                    "3N Seminyak • 3N Ubud",
                                                    style:
                                                        AppFontFamily.BoldStyle()
                                                            .copyWith(
                                                              color:
                                                                  AppColors
                                                                      .blueLight,
                                                            ),
                                                  ),
                                                  SizedBox(height: 6),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "₹38,499 ",
                                                        style:
                                                            AppFontFamily.HeadingStyle514(),
                                                      ),
                                                      Text(
                                                        "/Person",
                                                        style: AppFontFamily.smallStyle16()
                                                            .copyWith(
                                                              color:
                                                                  AppColors
                                                                      .blueLight,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Divider(color: AppColors.grey4),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _showUpdateBottomSheet(context);
                                              },
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 15),
                                                  Image.asset(
                                                    "assets/images/dates.png",
                                                    scale: 2,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Find best dates",
                                                    style:
                                                        AppFontFamily.HeadingStyle514()
                                                            .copyWith(
                                                              color:
                                                                  AppColors
                                                                      .pink,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                SizedBox(width: 15),
                                                Image.asset(
                                                  "assets/images/share.png",
                                                  scale: 2,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Share Itinerary",
                                                  style:
                                                      AppFontFamily.HeadingStyle514()
                                                          .copyWith(
                                                            color:
                                                                AppColors.pink,
                                                          ),
                                                ),
                                                SizedBox(width: 15),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),

                                if (index != 1) ...[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Divider(
                                          color: AppColors.grey4,
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          "OR",
                                          style: AppFontFamily.HeadingStyle14()
                                              .copyWith(fontSize: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: AppColors.grey4,
                                          thickness: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ],
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0.0,
        backgroundColor: AppColors.pink,
        shape: const CircleBorder(),
        child: Icon(Icons.add),
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
                                SizedBox(
                                  width: Get.width / 1.3,
                                  child: Text(
                                    "The Best Of Bali: One Where You Don't Miss Anything",
                                    style: AppFontFamily.HeadingStyle618(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
                            const SizedBox(height: 5),
                            Text(
                              "Find the best dates for your next trip.",
                              style: AppFontFamily.HeadingStyle14(),
                            ),
                            const SizedBox(height: 10),

                            // List with single selection
                            Expanded(
                              child: ListView.builder(
                                itemCount: isChecked.length,
                                padding: const EdgeInsets.only(top: 10),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setModalState(() {
                                        for (
                                          int i = 0;
                                          i < isChecked.length;
                                          i++
                                        ) {
                                          isChecked[i] = i == index;
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 16,
                                        right: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 1,
                                          color:
                                              isChecked[index]
                                                  ? AppColors.pink
                                                  : AppColors.grey4,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/calender.png",
                                                height: 13,
                                                width: 12,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                "Jan 14 - Jan 20",
                                                style:
                                                    AppFontFamily.smallStyle16(
                                                      color: AppColors.primary,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 25),
                                          Row(
                                            children: [
                                              RichText(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(
                                                  style:
                                                      AppFontFamily.BoldStyle()
                                                          .copyWith(
                                                            color:
                                                                AppColors
                                                                    .blueLight,
                                                          ),
                                                  children: [
                                                    TextSpan(
                                                      text: "₹38,499 ",
                                                      style: AppFontFamily.HeadingStyle14()
                                                          .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color:
                                                                AppColors
                                                                    .blueLight,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: " ₹36,799",
                                                      style:
                                                          AppFontFamily.HeadingStyle518()
                                                              .copyWith(
                                                                color:
                                                                    AppColors
                                                                        .green,
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: " /Person",
                                                      style: AppFontFamily.HeadingStyle14()
                                                          .copyWith(
                                                            color:
                                                                AppColors
                                                                    .blueLight,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Image.asset(
                                                isChecked[index]
                                                    ? 'assets/images/fill.png'
                                                    : 'assets/images/circle.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                          SizedBox(height: 10),
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

                      // Bottom button
                      Positioned(
                        bottom: 0,
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
                                  isChecked.where((e) => e).length;
                              return CustomButton(
                                text: "Pick date",
                                isEnabled: selectedCount > 0,
                                onTap: () {
                                  if (selectedCount > 0) {
                                    int selectedIndex = isChecked.indexWhere(
                                      (e) => e,
                                    );
                                    Get.back();
                                    // Do something with selectedIndex
                                    print("Selected Index: $selectedIndex");
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
