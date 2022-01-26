
import 'package:get/get.dart';

import 'my_room_controller.dart';

class MyRoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRoomController>(() {
      return MyRoomController();
    });
  }
}
