import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/introduction_screen_controller.dart';
import 'package:todo_list/utility/app_colors.dart';
import 'package:todo_list/utility/app_strings.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  // Instance of the IntroductionController obtained using GetX dependency injection
  final IntroductionController _controller = Get.put(IntroductionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color
      backgroundColor: AppColors.appBlack,

      // Create an app bar with black background and a skip button
      appBar: AppBar(
        backgroundColor: AppColors.appBlack,
        leading: TextButton(
          onPressed: () => _controller.skipButton(), // Call skip button function on press
          child: Text(
            AppString.skip.toUpperCase(),
            style: const TextStyle(color: AppColors.appWhitePrimary),
          ),
        ),
      ),

      // Build the body of the screen
      body: _carousal(),

      // Remove the floating action button
      floatingActionButton: null,
    );
  }

  // Widget responsible for building the carousel and its contents
  Widget _carousal() {
    final responsiveWidth = MediaQuery.of(context).size.width;
    final responsiveHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // Image carousel with page indicator
        SizedBox(
          height: responsiveHeight * 0.45,
          width: responsiveWidth,
          child: PageView.builder(
            onPageChanged: (index) => _controller.currentIndex.value = index, // Update current index on page change
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            controller: _controller.pageController, // Use controller for animation
            itemCount: AppString.introductionScreenImages.length, // Number of slides
            itemBuilder: (context, index) => SizedBox(
              height: responsiveHeight * 0.45,
              width: responsiveWidth,
              child: Image.asset(AppString.introductionScreenImages[index]), // Display image from list
            ),
          ),
        ),

        SizedBox(height: responsiveHeight * 0.01), // Add some space

        // Row of dots for page indicators based on current index
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < AppString.introductionScreenImages.length; i++)
              _imageIndicator(_controller.currentIndex.value == i, responsiveHeight, responsiveWidth),
          ],
        )),

        SizedBox(height: responsiveHeight * 0.01), // Add some space

        // Display title based on current index (Obx for reactivity)
        Obx(() => SizedBox(
          height: responsiveHeight * 0.1,
          width: responsiveWidth,
          child: Center(
            child: Text(
              AppString.introductionScreenTitles[_controller.currentIndex.value],
              style: const TextStyle(color: AppColors.appWhite, fontSize: 30.0),
            ),
          ),
        )),

        SizedBox(height: responsiveHeight * 0.03), // Add some space

        // Display description based on current index (Obx for reactivity)
        Obx(() => SizedBox(
          height: responsiveHeight * 0.1,
          width: responsiveWidth * 0.9,
          child: Text(
            textAlign: TextAlign.center,
            AppString.introductionScreenDescriptions[_controller.currentIndex.value],
            style: const TextStyle(color: AppColors.appGray, fontSize: 17.0, ),
          ),
        )),

        SizedBox(height: responsiveHeight * 0.08), // Add some space

        // Build navigation buttons based on current index (Obx for reactivity)
        Obx(() => _navigateButton(responsiveHeight, responsiveWidth)),
      ],
    );
  }

  // Widget to build the page indicator dots
  Widget _imageIndicator(bool isSelected, double height, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: height * 0.005,
        width: width * 0.08,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          color: isSelected ? AppColors.appWhite : AppColors.appGray,
        ),
      ),
    );
  }

  // Widget to build the back and next buttons
  Widget _navigateButton(double height, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => _controller.backButton(), // Call back button function on press
            child: _controller.currentIndex.value == 0
                ? const SizedBox.shrink() // Hide back button on first screen
                : Text(AppString.back.toUpperCase(), style: const TextStyle(color: AppColors.appWhitePrimary)),
          ),
          TextButton(
            onPressed: () => _controller.nextButton(), // Call next button function on press
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: AppColors.appPurple,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                  _controller.currentIndex.value == AppString.introductionScreenImages.length - 1
                      ? AppString.getStarted.toUpperCase() // Display "Get Started" on last screen
                      : AppString.next.toUpperCase(),
                  style: const TextStyle(color: AppColors.appWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}