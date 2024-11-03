import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/welcome_screen.dart';

import '../utility/app_strings.dart';

class IntroductionController extends GetxController {
  // RxInt to hold the current index of the introduction screen
  final RxInt currentIndex = 0.obs;

  // PageController to handle swiping between introduction screens
  final PageController pageController = PageController();

  // Called when the controller is initialized
  @override
  void onInit() {
    super.onInit();
  }

  // Navigates to the WelcomeScreen when the skip button is pressed
  void skipButton() {
    Get.to(const WelcomeScreen());
  }

  // Handles the next button press
  void nextButton() {
    // Check if we haven't reached the last screen
    if (currentIndex.value < AppString.introductionScreenImages.length - 1) {
      // Update the current index
      currentIndex.value++;

      // Animate the page controller to the next page with smooth transition
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    } else {
      // If it's the last screen, navigate to WelcomeScreen
      Get.to(const WelcomeScreen());
    }
  }

  // Handles the back button press
  void backButton() {
    // Check if we're not on the first screen
    if (currentIndex.value > 0) {
      // Update the current index
      currentIndex.value--;

      // Animate the page controller to the previous page with smooth transition
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }
}