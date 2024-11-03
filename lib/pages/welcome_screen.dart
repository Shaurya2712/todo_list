import 'package:flutter/material.dart';
import 'package:todo_list/controller/welcome_screen_controller.dart';
import 'package:todo_list/utility/app_colors.dart';
import 'package:todo_list/utility/app_strings.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final WelcomeController _welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBlack,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          _welcomeController.backButton();
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.appWhite,) ),
        backgroundColor: AppColors.appBlack,
      ),
      body:_body(),
    );
  }

  Widget _body(){

    final responsiveWidth = MediaQuery.of(context).size.width;
    final responsiveHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: responsiveHeight*0.04,),
        Column(
          children: [
            SizedBox(
              height: responsiveHeight * 0.1 ,
              width: responsiveWidth,
              child: const Text(
                textAlign: TextAlign.center,
                AppString.welcomeScreenTitle,
                style: TextStyle(color: AppColors.appWhite, fontSize: 33.0),),
            ),
            SizedBox(
              height: responsiveHeight * 0.05 ,
              width: responsiveWidth,
              child: const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: const Text(
                  textAlign: TextAlign.center,
                  AppString.welcomeScreenDescription,
                  style: TextStyle(color: AppColors.appGray, fontSize: 15.0),),
              ),
            ),
          ],

        ),
        const Spacer(),
        Column(
          children: [
            SizedBox(
              height: responsiveHeight * 0.1 ,
              width: responsiveWidth ,
              child: TextButton(onPressed: (){
              }, child: Container(
                  width: responsiveWidth*0.9,
                  height:responsiveHeight * 0.07 ,
                  decoration: BoxDecoration(
                    color: AppColors.appPurple,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(child: Text(AppString.login.toUpperCase(), style: const TextStyle(color: AppColors.appWhite),)))),
            ),
            SizedBox(
              height: responsiveHeight * 0.1 ,
              width: responsiveWidth,
              child: TextButton(
                  onPressed: (){},
                  child: Container(
                    width: responsiveWidth*0.9,
                    height:responsiveHeight * 0.07 ,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: AppColors.appPurple, // Set your border color here
                      width: 1.0, // Set the width of the border
                    ),
                  ),
                  child: Center(child: Text(AppString.createAccount.toUpperCase(), style: const TextStyle(color: AppColors.appWhite),)))),
            ),
          ],
        ),
        SizedBox(height: responsiveHeight*0.03,)
      ],
    );

  }
}
