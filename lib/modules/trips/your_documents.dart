import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sunday/modules/trips/preview_image.dart';

import '../../controllers/document_controller.dart';
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
  var uploadedFiles = <PlatformFile>[].obs;
  bool isButtonEnabled = false;

  final DocumentController controller = Get.put(DocumentController());

  @override
  void initState() {
    super.initState();
    controller.fetchDocuments();
  }

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
                          scale: 2.3,
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
                          scale: 2.3,
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
                        Obx(() {
                          if (controller.isLoading.value) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.pink,
                              ),
                            );
                          } else if (controller.categories.isEmpty) {
                            return const Text("No documents available.");
                          } else {
                            return _buildDocumentList(
                              "30 Sundays documents",
                              controller.categories,
                            );
                          }
                        }),

                        Obx(() {
                          if (uploadedFiles.isNotEmpty) {
                            return _buildDocumentList(
                              "Uploaded documents",
                              uploadedFiles.map((file) {
                                return {
                                  "title": file.name,
                                  "size":
                                      "${(file.size / 1024).toStringAsFixed(2)} KB",
                                };
                              }).toList(),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      /*  bottomNavigationBar: Material(
        elevation: 8, // Optional shadow
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          side: BorderSide(color: AppColors.grey4, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomButton(
            text: "Upload documents",
            onTap: () => _showFilePickerBottomSheet(context),
          ),
        ),
      ),*/
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
          Text(
            title,
            style: AppFontFamily.HeadingStyle618().copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          if (docs.isEmpty)
            const Text("No documents available.")
          else
            ...List.generate(docs.length, (index) {
              final item = docs[index];
              String category =
                  item['category']?.toString()?.trim()?.toLowerCase() ?? '';
              List<dynamic> categoryDocs = item['docs'] ?? [];

              if (category.isEmpty || categoryDocs.isEmpty) {
                return const SizedBox();
              }

              String imageAsset = "assets/images/docs.png";
              if (category == "payment" || category == "vouchers") {
                imageAsset = "assets/images/docs2.png";
              } else if (category == "passport") {
                imageAsset = "assets/images/flights2.png";
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(categoryDocs.length, (docIndex) {
                    final doc = categoryDocs[docIndex];
                    final String link = doc['link'] ?? '';
                    final String tag = doc['tag'] ?? '';

                    final isLastCategory = index == docs.length - 1;
                    final isLastDoc = docIndex == categoryDocs.length - 1;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PreviewImage(imageUrl: link));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Image.asset(
                                uploadedFiles.any((file) => file.name == tag)
                                    ? "assets/images/file.png"
                                    : imageAsset,
                                height: 32,
                                width: 32,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                item['category'] ?? '',
                                style: AppFontFamily.smallStyle16(
                                  color: AppColors.primary,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  /*   if (uploadedFiles.any(
                                    (file) => file.name == tag,
                                  )) {
                                    uploadedFiles.removeWhere(
                                      (file) => file.name == tag,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('File deleted: $tag'),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'This is a predefined document.',
                                        ),
                                      ),
                                    );
                                  }*/
                                },
                                child: Image.asset(
                                  uploadedFiles.any((file) => file.name == tag)
                                      ? "assets/images/delete.png"
                                      : "assets/images/download.png",
                                  height: 20,
                                  width: 20,
                                  color:
                                      uploadedFiles.any(
                                            (file) => file.name == tag,
                                          )
                                          ? AppColors.pink
                                          : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!(isLastCategory && isLastDoc)) ...[
                          const SizedBox(height: 8),
                          Divider(color: AppColors.gray, thickness: 1),
                          const SizedBox(height: 8),
                        ],
                      ],
                    );
                  }),
                ],
              );
            }),
        ],
      ),
    );
  }

  Future<void> downloadImage(String imageUrl, String fileName) async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      print("Storage permission denied");
      return;
    }

    try {
      final dir = await getExternalStorageDirectory();
      final savePath = "${dir!.path}/$fileName";

      await Dio().download(imageUrl, savePath);
      print("Download complete: $savePath");

      // Optional: show a message
      // You can use Get.snackbar or ScaffoldMessenger here.
    } catch (e) {
      print("Download failed: $e");
    }
  }

  /*
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
                            uploadedFiles.removeWhere(
                              (file) => file.name == doc['title'],
                            );
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
*/

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
                              uploadedFiles.remove(file);
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
      uploadedFiles.addAll(result.files);
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File uploaded: ${result.files.first.name}')),
      );
    }
  }

  _submitFiles() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Files submitted successfully')),
    );
  }
}
