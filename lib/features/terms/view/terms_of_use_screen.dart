import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/theme/app_svg_images.dart';
import '../../../core/widgets/system_button_widget.dart';

@RoutePage()
class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

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
                      'TERMS OF USE',
                      style: GoogleFonts.rubikMonoOne(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          '''
Effective Date: \nOctober 11, 2025

Welcome to Chicken Eggs (“we”, “our”, or “the App”). These Terms of Use govern your access and use of the Chicken Eggs game. By downloading or using the app, you agree to these terms.

1. Acceptance of Terms
By accessing or using Chicken Eggs, you agree to comply with and be bound by these Terms of Use. If you do not agree, please do not use the app.

2. License to Use
We grant you a personal, non-transferable, limited, and revocable license to use Chicken Eggs for entertainment purposes only. You may not copy, modify, distribute, or reverse engineer any part of the app.

3. User Conduct
You agree not to:
- Interfere with or disrupt the game or its servers.
- Use cheats, automation tools, or exploits.
- Upload or transmit harmful content, malware, or offensive material.

4. Intellectual Property
All content, graphics, sounds, and code within Chicken Eggs are the property of the developer and are protected by applicable intellectual property laws.

5. In-App Purchases and Virtual Items
Any virtual items or rewards earned or purchased in Chicken Eggs have no real-world value and cannot be exchanged or refunded.

6. Disclaimer of Warranties
The app is provided “as is,” without warranties of any kind. We do not guarantee that the game will be uninterrupted, secure, or error-free.

7. Limitation of Liability
To the maximum extent permitted by law, we are not liable for any damages resulting from your use or inability to use Chicken Eggs.

8. Termination
We reserve the right to terminate or suspend your access to the app at any time if you violate these terms.

9. Updates and Changes
We may update these Terms of Use from time to time. Continued use of the app after such updates means you accept the revised terms.

10. Contact Us
If you have questions about these Terms of Use, please contact us at:
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
