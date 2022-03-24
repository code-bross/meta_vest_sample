import 'package:get/get.dart';
import 'branch_search_controller.dart';

class BranchSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BranchSearchController>(() {
      return BranchSearchController();
    });
  }
}
