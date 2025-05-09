import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_font_family.dart';
import '../../utils/custom_widget.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({super.key});

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
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
                          scale: 2.5,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: Get.width / 1.4,
                        child: Text(
                          "Term & Conditions",
                          style: AppFontFamily.HeadingStyle20(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                      top: 24,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.grey4),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ListView(
                          children: [
                            _buildTile(
                              'Scope of Agreement',
                              'This User Agreement ("Agreement") outlines the terms and conditions under which Brance Technologies Private Limited ("Brance") and its brand 30 Sundays provide services to individuals ("User") who intend to purchase or inquire about any products and/or services offered by Brance, whether through our website 30sundays.club or any other customer interface channels, including but not limited to our sales personnel, offices, call centers, advertisements, and information campaigns. Each of Brance and the User is individually referred to as a "party," and collectively as the "parties."',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Acceptance of Terms',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Right to Terminate Access',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Additional Terms for Specific Services',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Compliance with Service Provider Policies',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Unconditional Acceptance of Terms',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Precedence of Terms',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Third-Party Account Access',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Confidential Information',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Use of Website/ App/ Whatsapp',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Users Duties',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Insurance Responsibility',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Circumstances Beyond Control (Force Majeure)',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),

                            _buildDivider(),
                            _buildTile(
                              'Data Download and Security',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Customer Feedback and Communication',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Intellectual Property Rights',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Visa Requirements',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Indemnity',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Right to Decline Service',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Cancellation Due to Invalid Information',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Severability Clause',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Section Headings',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Relationship Between Parties',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Information Updates',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Changes to Terms',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Governing Law and Jurisdiction',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Users Responsibilities Under the Agreement',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Use of Customer Images',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Definitions',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Dispute Resolution',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Privacy Policy',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'User Behavior',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Forbidden Activities',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'External Links',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),

                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Termination of Access',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),

                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Entire Agreement',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),

                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Non-Waiver',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Assignment',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Refund & Cancellation Policy',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                            SizedBox(height: 8),
                            _buildDivider(),
                            _buildTile(
                              'Contact Details',
                              'By availing services from Brance, Users confirm that they have read, comprehended, and expressly agreed to the terms and conditions of this Agreement, which govern all transactions and services provided by Brance. This Agreement is binding and defines all rights and obligations of both the User and Brance concerning any services offered by Brance.',
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildTile(String title, String content) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 16),
      childrenPadding: EdgeInsets.symmetric(horizontal: 16),
      iconColor: AppColors.grey2,
      collapsedIconColor: AppColors.grey2,
      title: Text(
        title,
        style: AppFontFamily.HeadingStyle514(
          color: AppColors.primary,
          fontSize: 15.4,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        Text(
          content,
          style: AppFontFamily.BoldStyle(color: AppColors.grey2, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.grey4,
      indent: 16,
      endIndent: 16,
    );
  }
}
