import 'package:astrotak/ui/screen/Tab-1/controller/home_controller.dart';
import 'package:astrotak/ui/screen/Tab-2/controller/talk_to_astrologer_controller.dart';
import 'package:astrotak/ui/screen/base_screen/controller/base_controller.dart';
import 'package:get/get.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<BaseController>(() => BaseController(), fenix: true);
    Get.lazyPut<TalkToAstrologerController>(() => TalkToAstrologerController(),
        fenix: true);
  }
}
