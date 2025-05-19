import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> locations = ['All', 'Upcoming Plans', 'Reminders'];
  int selectedIndex = 0;

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Your trip to Goa is confirmed!",
      "time": "10:20 AM",
      "description": "Pack your bags and get ready!",
      "date": DateTime.now(),
      "type": "Upcoming Plans",
    },
    {
      "title": "Confirm Your Hotel Stay at Ocean Nest",
      "time": "12:40 PM",
      "description":
          "Call us today to lock in your stay for Day 2. Rooms are filling fast!",
      "date": DateTime.now().subtract(Duration(days: 1)),
      "type": "Reminders",
    },
    {
      "title": "Your flight reminder",
      "time": "5:45 PM",
      "description": "Don’t forget to check in online!",
      "date": DateTime.now().subtract(Duration(days: 2)),
      "type": "Reminders",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final yesterday = today.subtract(Duration(days: 1));
    final dayBeforeYesterday = today.subtract(Duration(days: 2));

    List<Map<String, dynamic>> filtered =
        selectedIndex == 0
            ? notifications
            : notifications
                .where((n) => n['type'] == locations[selectedIndex])
                .toList();

    final todayList =
        filtered.where((n) => _isSameDay(n['date'], today)).toList();
    final yesterdayList =
        filtered.where((n) => _isSameDay(n['date'], yesterday)).toList();
    final dayBeforeList =
        filtered
            .where((n) => _isSameDay(n['date'], dayBeforeYesterday))
            .toList();

    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildFilterChips(),
                SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      children: [
                        if (todayList.isNotEmpty)
                          _buildSection("Today", todayList),
                        if (yesterdayList.isNotEmpty)
                          Column(
                            children: [
                              _buildSection("Yesterday", yesterdayList),
                              if (selectedIndex == 0) ...[
                                _dummyContainer(
                                  "Heads Up: Road Closure Near Fort Area",
                                  "Expect 20–30 min delays tomorrow morning. Leave early for your heritage walk.",
                                  "1:40 PM",
                                ),
                                SizedBox(height: 16),
                              ],
                            ],
                          ),
                        if (dayBeforeList.isNotEmpty)
                          _buildSection(
                            "${dayBeforeYesterday.day} ${_monthName(dayBeforeYesterday.month)}",
                            dayBeforeList,
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

  Widget _buildSection(String title, List<Map<String, dynamic>> list) {
    final limitedList = list.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFontFamily.HeadingStyle514(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            children:
                limitedList.map((item) {
                  bool isUpcomingPlan = item['type'] == 'Upcoming Plans';
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width / 1.6,
                              child: Text(
                                item['title'],
                                style: AppFontFamily.HeadingStyle514(
                                  color: AppColors.primary,
                                  fontSize: 14.8,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            Text(
                              item['time'],
                              style: AppFontFamily.HeadingStyle514(
                                color:
                                    isUpcomingPlan
                                        ? Colors.grey
                                        : AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          item['description'],
                          style: AppFontFamily.HeadingStyle514(
                            color: AppColors.grey2,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _dummyContainer(String title, subTitle, time) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: Get.width / 1.5,
                  child: Text(
                    title,
                    style: AppFontFamily.HeadingStyle514(
                      color: AppColors.primary,
                      fontSize: 14.4,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Text(
                  time,
                  style: AppFontFamily.HeadingStyle514(
                    color: AppColors.grey2,

                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),

            Text(
              subTitle,
              style: AppFontFamily.HeadingStyle514(
                color: AppColors.grey2,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 4, top: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset("assets/images/back_arrow.png", scale: 2.3),
          ),
          SizedBox(width: 10),
          Text("Notifications", style: AppFontFamily.HeadingStyle20()),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 20),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(locations.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.pink : Colors.white,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: isSelected ? AppColors.pink : Colors.grey.shade300,
                  width: 1.5,
                ),
                boxShadow:
                    isSelected
                        ? []
                        : [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                        ],
              ),
              child: Text(
                locations[index],
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFontFamily.Regular,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
