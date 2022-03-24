import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch_search/branch_search_controller.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';
import 'package:meta_vest_sample/pages/my_room/my_room_controller.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_controller.dart';
import 'package:meta_vest_sample/pages/vote/vote_controller.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FeedController>(() => FeedController());
    Get.lazyPut<RankingController>(() => RankingController());
    Get.lazyPut<MyRoomController>(() => MyRoomController());
    Get.lazyPut<BranchSearchController>(() => BranchSearchController());
    Get.lazyPut<VoteController>(() => VoteController());
  }
}
