import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip_button.dart';

/// Onboarding screen to introduce users to the app.
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for managing onboarding logic and state.
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: MImages.onBoardingImage1,
                title: MTexts .onBoardingTitle1,
                subTitle: MTexts .onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage2,
                title: MTexts .onBoardingTitle2,
                subTitle: MTexts .onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage3,
                title: MTexts .onBoardingTitle3,
                subTitle: MTexts .onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const MOnBoardingSkipButton(),

          /// Dot Navigation SmoothPageIndicator
          const MOnBoardingDotNavigation(),

          /// Circular Button
          const MOnBoardingNextButton (),
        ],
      ),
    );
  }
}
