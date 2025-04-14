import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sunday/modules/trips/more_action.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';

class AllTrips extends StatefulWidget {
  const AllTrips({super.key});

  @override
  State<AllTrips> createState() => _AllTripsState();
}

class _AllTripsState extends State<AllTrips> {
  final List<String> locations = ['Upcoming', 'Ongoing', 'Past'];
  int selectedIndex = 0;

  final List<Map<String, dynamic>> upcomingTrips = [
    {
      "image": "assets/images/2.png",
      "daysLeft": "4 Days to go",
      "nights": "6 Nights",
      "title": "The Best Of Bali: One Where You Don't\nMiss Anything",
      "location": "3N Seminyak • 3N Ubud",
      "price": "₹41,199",
    },
    {
      "image": "assets/images/2.png",
      "daysLeft": "10 Days to go",
      "nights": "5 Nights",
      "title": "Romantic Escape to Maldives",
      "location": "2N Male • 3N Resort",
      "price": "₹65,000",
    },
  ];

  final List<Map<String, dynamic>> ongoingTrips = [
    {
      "image": "assets/images/2.png",
      "status": "Currently Ongoing",
      "nights": "7 Nights",
      "title": "The Best Of Bali: One Where You Don't Miss Anything",
      "location": "3N Bangkok • 4N Phuket",
      "price": "₹41,199",
    },
  ];

  // final List<Map<String, dynamic>> pastTrips = [
  //   {
  //     "image": "assets/images/2.png",
  //     "status": "Completed",
  //     "nights": "6 Nights",
  //     "title": "The Best Of Bali: One Where You Don't Miss Anything",
  //     "location": "2N Abu Dhabi • 3N Dubai",
  //     "price": "₹60,000",
  //   },
  // ];
  final List<Map<String, dynamic>> pastTrips = [
    {
      "image": "assets/images/2.png",
      "status": "Completed",
      "nights": "6 Nights",
      "title": "The Best Of Bali: One Where You Don't Miss Anything",
      "location": "2N Abu Dhabi • 3N Dubai",
      "price": "₹60,000",
      "rating": 4.5,
      "review": "Amazing experience!",
    },
  ];

  List<Map<String, dynamic>> getSelectedTrips() {
    switch (selectedIndex) {
      case 0:
        return upcomingTrips;
      case 1:
        return ongoingTrips;
      case 2:
        return pastTrips;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedTrips = getSelectedTrips();

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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Trips", style: AppFontFamily.HeadingStyle20()),
                      Image.asset("assets/images/phone.png", scale: 2.5),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
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
                          ),
                          child: Center(
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
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: selectedTrips.length,
                    itemBuilder: (context, index) {
                      final trip = selectedTrips[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.grey4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(trip["image"], scale: 2.5),
                                if (trip["daysLeft"] != null)
                                  Positioned(
                                    bottom: 12,
                                    right: 12,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => MoreAction());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/duration.png",
                                              scale: 2.5,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              trip["daysLeft"],
                                              style: AppFontFamily.BoldStyle()
                                                  .copyWith(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/moon.png",
                                  scale: 2.2,
                                ),
                                Text(
                                  "  ${trip["nights"]}",
                                  style: AppFontFamily.BoldStyle(),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              trip["title"],
                              style: AppFontFamily.HeadingStyle514(),
                            ),
                            SizedBox(height: 6),
                            Text(
                              trip["location"],
                              style: AppFontFamily.BoldStyle().copyWith(
                                color: AppColors.blueLight,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  trip["price"],
                                  style: AppFontFamily.HeadingStyle514(),
                                ),
                                Text(
                                  "/Person",
                                  style: AppFontFamily.smallStyle16().copyWith(
                                    color: AppColors.blueLight,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(color: AppColors.grey4),
                            SizedBox(height: 5),
                            if (selectedIndex == 0)
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/share.png",
                                    height: 12,
                                    width: 12,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Share Itinerary",
                                    style: AppFontFamily.HeadingStyle514(
                                      fontSize: 12,
                                    ).copyWith(color: AppColors.pink),
                                  ),
                                ],
                              ),
                            if (selectedIndex == 1)
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/share.png",
                                    height: 12,
                                    width: 12,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Share Itinerary",
                                    style: AppFontFamily.HeadingStyle514(
                                      fontSize: 12,
                                    ).copyWith(color: AppColors.pink),
                                  ),
                                ],
                              ),
                            if (selectedIndex == 2)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "assets/images/msg.png",
                                    height: 12,
                                    width: 12,
                                  ),
                                  Text(
                                    "Review",
                                    style: AppFontFamily.HeadingStyle514(
                                      fontSize: 12,
                                    ).copyWith(color: AppColors.pink),
                                  ),

                                  Image.asset(
                                    "assets/images/picture.png",
                                    height: 12,
                                    width: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showImagePickerBottomSheet(context);
                                    },
                                    child: Text(
                                      "Request photobook",
                                      style: AppFontFamily.HeadingStyle514()
                                          .copyWith(
                                            color: AppColors.pink,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),

                                  Image.asset(
                                    "assets/images/share.png",
                                    height: 12,
                                    width: 12,
                                  ),

                                  Text(
                                    "Share Itinerary",
                                    style: AppFontFamily.HeadingStyle514(
                                      fontSize: 12,
                                    ).copyWith(color: AppColors.pink),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
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

void _showImagePickerBottomSheet(BuildContext context) {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedImages = [];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          Future<void> _pickImages() async {
            final List<XFile>? pickedFiles = await _picker.pickMultiImage(
              imageQuality: 80,
            );
            if (pickedFiles != null && pickedFiles.isNotEmpty) {
              setState(() {
                _selectedImages.addAll(pickedFiles);
              });
            }
          }

          Future<void> _uploadImages() async {
            if (_selectedImages.isNotEmpty) {
              for (var image in _selectedImages) {
                print("Uploading: ${image.path}");
                // Add actual upload logic here (e.g., API or Firebase)
              }
              Get.back();
            } else {
              Get.snackbar(
                "No Images",
                "Please select images before submitting",
              );
            }
          }

          return Padding(
            padding: MediaQuery.of(
              context,
            ).viewInsets.add(const EdgeInsets.all(16)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Upload your photos",
                        style: AppFontFamily.HeadingStyle618(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset("assets/images/close.png", scale: 2.8),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Please select photos you want to upload.",
                  style: AppFontFamily.HeadingStyle14(),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: _pickImages,
                  child: DottedBorder(
                    color: Colors.grey,
                    strokeWidth: 1.2,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    dashPattern: [8, 4],
                    child: Container(
                      color: AppColors.blue,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, color: Colors.black),
                          const SizedBox(width: 5),
                          Text(
                            "Select photos",
                            style: AppFontFamily.HeadingStyle518(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                if (_selectedImages.isNotEmpty) ...[
                  const SizedBox(height: 15),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _selectedImages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final image = _selectedImages[index];
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(image.path),
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedImages.removeAt(index);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.grey4),
                                ),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _uploadImages,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pink,
                    disabledBackgroundColor: AppColors.lightPink,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: AppFontFamily.HeadingStyle518(
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        },
      );
    },
  );
}
