import 'package:get/get.dart';

import 'time_line_controller.dart';

class TimeLineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeLineController>(() {
      return TimeLineController();
    });
  }
}
