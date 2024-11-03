import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/splash_screen_controller.dart';
import 'package:todo_list/utility/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBlack,
      appBar: null,
      body: Center(
        child: _body(),
      ),

    );
  }

  // Custom body widget
  Widget _body() {
    // Responsive media query
    double responsiveWidth = MediaQuery
        .of(context)
        .size
        .width;
    double responsiveHeight = MediaQuery
        .of(context)
        .size
        .height;
    // SizeBox return
    return SizedBox(
      width: responsiveWidth * 0.25,
      height: responsiveHeight * 0.25,
      child: Image.asset('assets/images/app_logo.png', fit: BoxFit.contain,),
    );
  }

}