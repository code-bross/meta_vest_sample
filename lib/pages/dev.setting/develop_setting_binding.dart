import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/dev.setting/develop_setting_controller.dart';

class DevelopSettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DevelopSettingController>(() => DevelopSettingController());
  }
}