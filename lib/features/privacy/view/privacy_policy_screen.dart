import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/theme/app_svg_images.dart';
import '../../../core/widgets/system_button_widget.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundLoading),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 12,
            right: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SystemButtonWidget(
                      iconAsset: AppSvgImages.iconBack,
                    ),
                    onTap: () {
                      context.router.replace(const MenuRoute());
                    },
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: 32,
            right: 32,
            bottom: 40,
            child: Container(
              width: 300,
              padding: const EdgeInsets.only(left: 24, top: 0, right: 24,bottom: 12),
              decoration: BoxDecoration(
                color: const Color(0xCC7A025A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFF6CD8), width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    Text(
                      'PRIVACY POLICY',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          '''
Effective Date: \nOctober 11, 2025

At Chicken Eggs (“we”, “our”, or “the App”), your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information when you use our game.

1. Information We Collect
- Device Information: Your device type, operating system, and app version.
- Usage Data: How you interact with the app, e.g., levels completed, scores, and game settings.
- Optional Information: If you contact us or participate in support, we may collect your email address or other contact info.
We do NOT collect personal data like your full name, phone number, or location without your consent.

2. How We Use Your Information
- Improve and maintain the game.
- Track scores and progress in the app.
- Respond to your support requests.
- Analyze usage trends to enhance user experience.

3. Sharing Your Information
We do not sell, trade, or rent your personal information to third parties. We may share non-personal, aggregated data with our analytics providers to improve the game.

4. Data Storage and Security
We take reasonable measures to protect your information from unauthorized access, loss, or misuse. However, no method of electronic storage is 100% secure, so we cannot guarantee absolute security.

5. Third-Party Services
Our app may include third-party services such as analytics or advertising SDKs. These third parties may collect information as described in their own privacy policies.

6. Children’s Privacy
Chicken Eggs is suitable for all ages. We do not knowingly collect personal information from children under 13. If we discover that a child under 13 has provided personal information, we will delete it immediately.

7. Changes to This Privacy Policy
We may update this Privacy Policy from time to time. We encourage you to review it periodically. Changes are effective immediately upon posting.

8. Contact Us
If you have questions about this Privacy Policy, please contact us at:
Email: support@chickeneggsapp.com
''',
                          style: GoogleFonts.rubikMonoOne(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
