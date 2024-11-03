import 'package:get/get.dart';
import 'package:todo_list/pages/introduction_screen.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed( const Duration(seconds: 2),(){
      Get.off(()=> const IntroductionScreen() );
    });
  }

}