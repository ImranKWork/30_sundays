import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sunday/utils/app_color.dart';
import 'package:sunday/utils/app_font_family.dart';
import 'package:sunday/utils/custom_button.dart';

import '../../utils/custom_widget.dart';

class CreateItinerary extends StatefulWidget {
  const CreateItinerary({super.key});

  @override
  State<CreateItinerary> createState() => _CreateItineraryState();
}

class _CreateItineraryState extends State<CreateItinerary> {
  String? fromLocation;
  String? toLocation;
  String selectedValue = '';
  int? selectedNights;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberOfNightsController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    DateTime? pickedDate;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Departure date",
                        style: AppFontFamily.HeadingStyle618(),
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
                  const SizedBox(height: 18),

                  /// Date Picker Section
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: AppColors.pink,
                        onPrimary: AppColors.white,
                        onSurface: AppColors.black,
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.pink,
                        ),
                      ),
                    ),
                    child: CalendarDatePicker(
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                      onDateChanged: (DateTime newDate) {
                        setModalState(() {
                          pickedDate = newDate;
                        });
                      },
                    ),
                  ),

                  CustomButton(
                    width: Get.width,
                    text: "Apply",
                    isEnabled: pickedDate != null,
                    onTap:
                        pickedDate != null
                            ? () {
                              setState(() {
                                _dateController.text = _dateFormat.format(
                                  pickedDate!,
                                );
                              });
                              Navigator.pop(context);
                            }
                            : null,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Create Itinerary",
                    style: AppFontFamily.HeadingStyle20(),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "It's time to plan your adventure with 30 Sundays!",
                    style: AppFontFamily.HeadingWhite414(
                      color: AppColors.blueLight,
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.grey4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Destination",
                          style: AppFontFamily.smallStyle16(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 5),

                        SizedBox(
                          height: 80,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: _showFromWere,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: AppColors.grey4,
                                            ),
                                          ),
                                          child: Text(
                                            fromLocation ??
                                                'From Where?', // If no location selected, show 'From Where?'
                                            style:
                                                AppFontFamily.HeadingStyle14(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: _showToWhere,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: AppColors.grey4,
                                            ),
                                          ),
                                          child: Text(
                                            toLocation ?? 'To Where?',
                                            style:
                                                AppFontFamily.HeadingStyle14(),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                top: 26,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.yellow,
                                    ),
                                    child: Image.asset(
                                      'assets/images/landing.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Passengers",
                          style: AppFontFamily.smallStyle16(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 18),

                        GestureDetector(
                          onTap: _openBottomSheet,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.grey4),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  passengerInfo.isNotEmpty
                                      ? passengerInfo
                                      : "Select passengers",
                                  style: AppFontFamily.HeadingStyle14(),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.blueLight,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 18),

                        Text(
                          "Departure date",
                          style: AppFontFamily.smallStyle16(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 18),
                        TextField(
                          style: AppFontFamily.HeadingStyle14(),
                          onTap: () => _selectDate(context),
                          controller: _dateController,
                          decoration: InputDecoration(
                            hintText: 'Select departure date',
                            hintStyle: AppFontFamily.HeadingStyle14(),

                            suffixIcon: Image.asset(
                              "assets/images/calender.png",
                              scale: 1.8,
                              color: AppColors.blueLight,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Rounded corners
                              borderSide: BorderSide(color: AppColors.grey4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Rounded corners
                              borderSide: BorderSide(
                                color: AppColors.grey4,
                                // Focused border color
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Rounded corners
                              borderSide: BorderSide(
                                color: AppColors.grey4,
                                // Border color when enabled
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                          ),

                          readOnly: true,
                        ),
                        SizedBox(height: 18),

                        Text(
                          "Number of nights",
                          style: AppFontFamily.smallStyle16(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 18),
                        /*   GestureDetector(
                          onTap:
                              () =>
                                  _selectNumberOfNights(), // Ensure the function is called
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.grey4),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Select",
                                  style: AppFontFamily.HeadingStyle14(),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.blueLight,
                                ),
                              ],
                            ),
                          ),
                        ),*/
                        GestureDetector(
                          onTap: _selectNumberOfNights,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.grey4),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  _numberOfNightsController.text.isEmpty
                                      ? "Select"
                                      : "${_numberOfNightsController.text} Nights",
                                  style: AppFontFamily.HeadingStyle14(),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.blueLight,
                                ),
                              ],
                            ),
                          ),
                        ),

                        /* Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color:
                                Colors.white, // Optional: set background color
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Rounded corners
                            border: Border.all(
                              color: AppColors.grey4, // Border color
                            ),
                          ),
                          child: DropdownButton<String>(
                            value:
                                selectedValue!.isEmpty ? null : selectedValue,
                            hint: Text(
                              "Select",
                              style: AppFontFamily.HeadingStyle14(),
                            ),
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.blueLight,
                            ),
                            elevation: 2,
                            underline: SizedBox(), // Removes default underline
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue =
                                    newValue ?? ""; // Handle null case
                              });
                            },
                            items:
                                <String>[
                                  'Option 1',
                                  'Option 2',
                                  'Option 3',
                                  'Option 4',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: AppFontFamily.HeadingStyle14(),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),*/
                        SizedBox(height: 18),
                        Text(
                          "Email",
                          style: AppFontFamily.smallStyle16(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 18),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter you email',
                            hintStyle: AppFontFamily.HeadingStyle14(),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Rounded corners
                              borderSide: BorderSide(color: AppColors.grey4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Rounded corners
                              borderSide: BorderSide(
                                color: AppColors.grey4,
                                // Focused border color
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Rounded corners
                              borderSide: BorderSide(
                                color: AppColors.grey4,
                                // Border color when enabled
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                          ),

                          readOnly: true,
                        ),
                        CustomButton(
                          text: "Create Itinerary",
                          onTap: () {},
                          isEnabled: false,
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

  int adultCount = 0, childrenCount = 0, infantCount = 0;

  String passengerInfo = "";

  void updatePassengerInfo() {
    List<String> parts = [];
    if (adultCount > 0)
      parts.add("$adultCount Adult${adultCount > 1 ? 's' : ''}");
    if (childrenCount > 0)
      parts.add("$childrenCount Child${childrenCount > 1 ? 'ren' : ''}");
    if (infantCount > 0)
      parts.add("$infantCount Infant${infantCount > 1 ? 's' : ''}");
    passengerInfo = parts.join(", ");
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "Select passengers",
                          style: AppFontFamily.HeadingStyle618(),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            "assets/images/close.png",
                            scale: 2.8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Passenger info display

                    // Adult count section
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Adults",
                              style: AppFontFamily.HeadingStyle14(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "12+ years",
                              style: AppFontFamily.HeadingWhite414(
                                color: AppColors.blueLight,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (adultCount > 0) adultCount--;
                              updatePassengerInfo();
                            });
                          },
                          child: Image.asset(
                            adultCount > 0
                                ? "assets/images/minus2.png"
                                : "assets/images/minus.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          adultCount.toString().padLeft(2, '0'),
                          style: AppFontFamily.HeadingStyle14(),
                        ),
                        SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            setState(() {
                              adultCount++;
                              updatePassengerInfo();
                            });
                          },
                          child: Image.asset(
                            "assets/images/add.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color: AppColors.grey4),
                    SizedBox(height: 15),

                    // Children count section
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Children",
                              style: AppFontFamily.HeadingStyle14(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "2-12 years",
                              style: AppFontFamily.HeadingWhite414(
                                color: AppColors.blueLight,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (childrenCount > 0) childrenCount--;
                              updatePassengerInfo();
                            });
                          },
                          child: Image.asset(
                            childrenCount > 0
                                ? "assets/images/minus2.png"
                                : "assets/images/minus.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          childrenCount.toString().padLeft(2, '0'),
                          style: AppFontFamily.HeadingStyle14(),
                        ),
                        SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            setState(() {
                              childrenCount++;
                              updatePassengerInfo();
                            });
                          },
                          child: Image.asset(
                            "assets/images/add.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color: AppColors.grey4),
                    SizedBox(height: 15),

                    // Infant count section
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Infants",
                              style: AppFontFamily.HeadingStyle14(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "0-2 years",
                              style: AppFontFamily.HeadingWhite414(
                                color: AppColors.blueLight,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (infantCount > 0) infantCount--;
                              updatePassengerInfo();
                            });
                          },
                          child: Image.asset(
                            infantCount > 0
                                ? "assets/images/minus2.png"
                                : "assets/images/minus.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          infantCount.toString().padLeft(2, '0'),
                          style: AppFontFamily.HeadingStyle14(),
                        ),
                        SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            setState(() {
                              infantCount++;
                              updatePassengerInfo();
                            });
                          },
                          child: Image.asset(
                            "assets/images/add.png",
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color: AppColors.grey4),
                    SizedBox(height: 15),

                    // Select Button
                    CustomButton(
                      width: Get.width,
                      text: "Select",
                      isEnabled:
                          adultCount > 0 ||
                          childrenCount > 0 ||
                          infantCount > 0,
                      onTap: () {
                        if (adultCount > 0 ||
                            childrenCount > 0 ||
                            infantCount > 0) {
                          Navigator.pop(context);
                          // Optionally, pass passengerInfo back to parent widget
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showFromWere() {
    TextEditingController searchController = TextEditingController();
    List<String> locations = [
      'Mumbai, India',
      'Ahmedabad, India',
      'New York, USA',
      'Colombo, Sri Lanka',
      'Jeddah, Saudi Arabia',
    ];
    List<String> filteredLocations = List.from(locations);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        String? selectedLocation; // Track selected location

        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
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
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "From Where?",
                            style: AppFontFamily.HeadingStyle618(),
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
                      const SizedBox(height: 18),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search city..',
                          hintStyle: AppFontFamily.HeadingStyle14(),
                          prefixIcon: Image.asset(
                            "assets/images/search.png",
                            scale: 2.5,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey4),
                          ),
                        ),
                        onChanged: (value) {
                          setModalState(() {
                            filteredLocations =
                                locations
                                    .where(
                                      (loc) => loc.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                                    )
                                    .toList();
                            print(
                              'Filtered Locations: $filteredLocations',
                            ); // Debugging line
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: List.generate(filteredLocations.length, (
                          index,
                        ) {
                          final location = filteredLocations[index];
                          final isSelected = selectedLocation == location;

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      selectedLocation =
                                          location; // Update selected location
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/location.png",
                                              width: 11,
                                              height: 14,
                                              color:
                                                  isSelected
                                                      ? AppColors.pink
                                                      : AppColors.blueLight,
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              location,
                                              style:
                                                  AppFontFamily.HeadingStyle14(
                                                    color:
                                                        isSelected
                                                            ? AppColors.pink
                                                            : AppColors
                                                                .blueLight,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        if (isSelected)
                                          Icon(
                                            Icons.check,
                                            color: AppColors.pink,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (index != filteredLocations.length - 1)
                                const Divider(color: AppColors.grey4),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        width: Get.width,
                        isEnabled: selectedLocation != null,
                        text: "Select",
                        onTap:
                            selectedLocation != null
                                ? () {
                                  setModalState(() {
                                    fromLocation = selectedLocation!;
                                  });
                                  Navigator.pop(
                                    context,
                                  ); // Close modal after selection
                                }
                                : () {},
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _showToWhere() {
    TextEditingController searchController = TextEditingController();
    List<String> locations = [
      'Mumbai, India',
      'Ahmedabad, India',
      'New York, USA',
      'Colombo, Sri Lanka',
      'Jeddah, Saudi Arabia',
    ];
    List<String> filteredLocations = List.from(locations);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        String? selectedLocation; // Track selected location

        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
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
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "To Where?",
                            style: AppFontFamily.HeadingStyle618(),
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
                      const SizedBox(height: 18),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search city..',
                          hintStyle: AppFontFamily.HeadingStyle14(),
                          prefixIcon: Image.asset(
                            "assets/images/search.png",
                            scale: 2.5,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey4),
                          ),
                        ),
                        onChanged: (value) {
                          setModalState(() {
                            filteredLocations =
                                locations
                                    .where(
                                      (loc) => loc.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                                    )
                                    .toList();
                            print(
                              'Filtered Locations: $filteredLocations',
                            ); // Debugging line
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: List.generate(filteredLocations.length, (
                          index,
                        ) {
                          final location = filteredLocations[index];
                          final isSelected = selectedLocation == location;

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      selectedLocation =
                                          location; // Update selected location
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/location.png",
                                              width: 11,
                                              height: 14,
                                              color:
                                                  isSelected
                                                      ? AppColors.pink
                                                      : AppColors.blueLight,
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              location,
                                              style:
                                                  AppFontFamily.HeadingStyle14(
                                                    color:
                                                        isSelected
                                                            ? AppColors.pink
                                                            : AppColors
                                                                .blueLight,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        if (isSelected)
                                          Icon(
                                            Icons.check,
                                            color: AppColors.pink,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (index != filteredLocations.length - 1)
                                const Divider(color: AppColors.grey4),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        width: Get.width,
                        isEnabled: selectedLocation != null,
                        text: "Select",
                        onTap:
                            selectedLocation != null
                                ? () {
                                  setModalState(() {
                                    fromLocation = selectedLocation!;
                                  });
                                  Navigator.pop(
                                    context,
                                  ); // Close modal after selection
                                }
                                : () {},
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _selectNumberOfNights() {
    List<int> nightsList = List.generate(5, (index) => index + 1);
    int? tempSelectedNights = selectedNights; // Store temporary selection

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Number of nights",
                        style: AppFontFamily.HeadingStyle618(),
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
                  const SizedBox(height: 18),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: nightsList.length,
                    itemBuilder: (context, index) {
                      int night = nightsList[index];
                      bool isSelected = tempSelectedNights == night;

                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setModalState(() {
                                tempSelectedNights = night;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "$night Nights",
                                    style: AppFontFamily.HeadingStyle14(
                                      color:
                                          isSelected
                                              ? AppColors.pink
                                              : AppColors.blueLight,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (isSelected)
                                    const Icon(
                                      Icons.check,
                                      color: AppColors.pink,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Divider(
                            color: AppColors.grey4,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          ),
                          const SizedBox(height: 5),
                        ],
                      );
                    },
                  ),

                  CustomButton(
                    width: Get.width,
                    isEnabled: tempSelectedNights != null,
                    text: "Select",
                    onTap: () {
                      if (tempSelectedNights != null) {
                        setState(() {
                          selectedNights = tempSelectedNights!;
                          _numberOfNightsController.text = "$selectedNights";
                        });
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
