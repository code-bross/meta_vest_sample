import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch/branch_controller.dart';

class BranchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BranchController>(() {
      return BranchController();
    });
  }
}
