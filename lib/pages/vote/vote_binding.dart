import 'package:get/get.dart';
import 'vote_controller.dart';

class VoteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoteController>(() => VoteController());
  }
}