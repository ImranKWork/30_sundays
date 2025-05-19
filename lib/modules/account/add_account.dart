import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_widget.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  // Tracking the check status for each of the three customize items.
  List<bool> customizeChecks = [false, false, false];

  // Tracking the check status for each trip item.
  List<bool> tripItemChecks = [false, false, false];

  // Button enabled only when phone number is exactly 10 digits and all customize items are checked.
  bool isButtonEnabled = false;

  // Update the button state when either the phone number or customize checks change.
  void _updateButtonState() {
    final isPhoneValid = _phoneController.text.trim().length == 10;
    final isCustomizeAllChecked = customizeChecks.every(
      (element) => element == true,
    );

    setState(() {
      // The button is enabled only when the phone number is valid and all customize items are checked.
      isButtonEnabled = isPhoneValid && isCustomizeAllChecked;
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 4),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            "assets/images/back_arrow.png",
                            scale: 2.3,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Add your partner",
                          style: AppFontFamily.HeadingStyle20(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPhoneInput(),
                          const SizedBox(height: 20),
                          Text(
                            "Full access to:",
                            style: AppFontFamily.HeadingStyle20(),
                          ),
                          const SizedBox(height: 20),
                          _buildCustomizeSection(),
                          const SizedBox(height: 20),
                          _buildTripsSection(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          text: "Add partner",
          isEnabled: isButtonEnabled,
          onTap: () {
            // Call validate() to display any error borders/messages.
            if (_formKey.currentState!.validate()) {
              // Your submit logic here.
              print("Add partner clicked");
            }
          },
        ),
      ),
    );
  }

  // Build the phone number input field with a validator.
  Widget _buildPhoneInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phone number",
            style: AppFontFamily.smallStyle16(color: AppColors.primary),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: _inputDecoration("Enter phone no."),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone number is required";
              } else if (value.trim().length != 10) {
                return "Phone number must be exactly 10 digits";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  // Build the Customize section with a list of required items.
  Widget _buildCustomizeSection() {
    final titles = [
      "The Best Of Bali: One Where You Don't Miss Anything",
      "Bali Adventure: Surf, Explore, and Relax",
      "Luxury Retreat: Pamper Yourself in Paradise",
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customize section",
            style: AppFontFamily.smallStyle16(color: AppColors.primary),
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            separatorBuilder:
                (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    color: AppColors.grey4,
                    thickness: 1,
                    height: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    customizeChecks[index] = !customizeChecks[index];
                  });
                  _updateButtonState();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      customizeChecks[index]
                          ? "assets/images/check.png"
                          : "assets/images/uncheck.png",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: Get.width / 1.4,
                      child: Text(
                        titles[index],
                        style: AppFontFamily.HeadingStyle14(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Build the optional Trips section.
  Widget _buildTripsSection() {
    final tripTitle = "Trips section";
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tripTitle,
            style: AppFontFamily.smallStyle16(color: AppColors.primary),
          ),
          const SizedBox(height: 20),
          _tripItem("The Best Of Bali: One Where You Don't Miss Anything", 0),
          const SizedBox(height: 15),
          Divider(color: AppColors.grey4),
          const SizedBox(height: 15),
          _tripItem("Bali Adventure: Surf, Explore, and Relax", 1),
          const SizedBox(height: 15),
          Divider(color: AppColors.grey4),
          const SizedBox(height: 15),
          _tripItem("Luxury Retreat: Pamper Yourself in Paradise", 2),
        ],
      ),
    );
  }

  // Build each trip item (for the trips section display).
  Widget _tripItem(String title, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              tripItemChecks[index] = !tripItemChecks[index];
            });
            _updateButtonState();
          },
          child: Image.asset(
            tripItemChecks[index]
                ? "assets/images/check.png"
                : "assets/images/uncheck.png",
            height: 20,
            width: 20,
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: Get.width / 1.4,
          child: Text(
            title,
            style: AppFontFamily.HeadingStyle14(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // Common BoxDecoration for containers.
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.grey4),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppFontFamily.HeadingStyle14(),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.grey4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.grey4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
