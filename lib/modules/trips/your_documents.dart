import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunday/utils/custom_button.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';
import 'documents_details.dart';

class YourDocuments extends StatefulWidget {
  const YourDocuments({super.key});

  @override
  State<YourDocuments> createState() => _YourDocumentsState();
}

class _YourDocumentsState extends State<YourDocuments> {
  List<PlatformFile> uploadedFiles = [];
  bool isButtonEnabled = false; // Track button state

  // Dummy data for documents
  List<Map<String, String>> documents = [
    {"title": "Hotel & Sightseeing Voucher", "size": "0.6 MB"},
    {"title": "Payment Receipts", "size": "4.6 MB"},
    {"title": "Flight Tickets", "size": "2.5 MB"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorOverlays(),
          SafeArea(
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
                          scale: 2.5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: Get.width / 1.4,
                        child: Text(
                          "Your Documents",
                          style: AppFontFamily.HeadingStyle20(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => DocumentsDetails());
                        },
                        child: Image.asset(
                          "assets/images/phone.png",
                          scale: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDocumentList("30 Sundays documents", documents),

                        if (uploadedFiles.isNotEmpty)
                          _buildDocumentList(
                            "Uploaded documents",
                            uploadedFiles.map((file) {
                              return {
                                "title": file.name,
                                "size":
                                    "${(file.size / 1024).toStringAsFixed(2)} KB",
                              };
                            }).toList(),
                          ),
                        // Show uploaded files if available
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomButton(
          text: "Upload documents",
          onTap: () => _showFilePickerBottomSheet(context),
        ),
      ),
    );
  }

  Widget _buildDocumentList(String title, List<dynamic> docs) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.grey4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppFontFamily.HeadingStyle618()),
          const SizedBox(height: 15),
          if (docs.isEmpty)
            const Text("No documents uploaded yet.")
          else
            ...docs.map(
              (doc) => Column(
                children: [
                  Row(
                    children: [
                      uploadedFiles.any((file) => file.name == doc['title'])
                          ? Container(
                            height: 20,
                            width: 20,
                            color: Colors.white,

                            child: Image.asset(
                              "assets/images/file.png",
                              height: 32,
                              width: 32,
                              fit: BoxFit.contain,
                            ),
                          )
                          : Image.asset(
                            "assets/images/doc2.png",
                            height: 32,
                            width: 32,
                            fit: BoxFit.contain,
                          ),

                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doc['title'] ?? '',
                              style: AppFontFamily.smallStyle16(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              doc['size'] ?? '',
                              style: AppFontFamily.HeadingWhite414(
                                color: AppColors.blueLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (uploadedFiles.any(
                            (file) => file.name == doc['title'],
                          )) {
                            setState(() {
                              uploadedFiles.removeWhere(
                                (file) => file.name == doc['title'],
                              );
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('File deleted: ${doc['title']}'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('This is a predefined document.'),
                              ),
                            );
                          }
                        },
                        child: Image.asset(
                          uploadedFiles.any((file) => file.name == doc['title'])
                              ? "assets/images/delete.png"
                              : "assets/images/download.png",
                          height: 20,
                          width: 20,
                          color:
                              uploadedFiles.any(
                                    (file) => file.name == doc['title'],
                                  )
                                  ? AppColors.pink
                                  : null,
                        ),
                      ),
                    ],
                  ),
                  if (doc != docs.last) ...[
                    const SizedBox(height: 10),
                    Divider(color: AppColors.gray, thickness: 1),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _showFilePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                          "Upload your files",
                          style: AppFontFamily.HeadingStyle618(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Image.asset(
                          "assets/images/close.png",
                          scale: 2.8,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Please select the document you want to upload.",
                    style: AppFontFamily.HeadingStyle14(),
                  ),

                  const SizedBox(height: 20),
                  ...uploadedFiles.map(
                    (file) => Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.grey4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.grey4),
                            ),
                            child: Image.asset(
                              "assets/images/upload.png",
                              scale: 2.8,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  file.name,
                                  style: AppFontFamily.smallStyle16(
                                    color: AppColors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${(file.size / 1024).toStringAsFixed(2)} KB",
                                  style: AppFontFamily.HeadingWhite414(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                uploadedFiles.remove(file);
                              });

                              documents.addAll(
                                uploadedFiles.map((file) {
                                  return {
                                    "title": file.name,
                                    "size":
                                        "${(file.size / 1024).toStringAsFixed(2)} KB",
                                  };
                                }).toList(),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('File removed: ${file.name}'),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/images/close.png",
                              scale: 3,
                              color: AppColors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => _pickFile(),
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
                              "Select file",
                              style: AppFontFamily.HeadingStyle518(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),

                  ElevatedButton(
                    onPressed: uploadedFiles.isNotEmpty ? _submitFiles : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pink,
                      disabledBackgroundColor: AppColors.lightPink,
                      // padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: AppFontFamily.HeadingStyle518(
                        color: AppColors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        uploadedFiles.addAll(result.files); // Add files to the list
      });
      Get.back(); // Close the bottom sheet
      // Close the bottom sheet
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File uploaded: ${result.files.first.name}')),
      );
    }
  }

  _submitFiles() {
    // Handle file submission logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Files submitted successfully')),
    );
    // You can also navigate to another screen or perform any action
  }
}
