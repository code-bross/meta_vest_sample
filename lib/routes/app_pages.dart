import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/dev.setting/develop_setting_binding.dart';
import 'package:meta_vest_sample/pages/dev.setting/develop_setting_page.dart';
import 'package:meta_vest_sample/pages/dev.setting/timeline/time_line_binding.dart';
import 'package:meta_vest_sample/pages/dev.setting/timeline/time_line_page.dart';
import 'package:meta_vest_sample/pages/feed/feed_binding.dart';
import 'package:meta_vest_sample/pages/feed/feed_page.dart';
import 'package:meta_vest_sample/pages/home/home_binding.dart';
import 'package:meta_vest_sample/pages/home/home_page.dart';
import 'package:meta_vest_sample/pages/my_room/my_room_binding.dart';
import 'package:meta_vest_sample/pages/my_room/my_room_page.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_binding.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_page.dart';
import 'package:meta_vest_sample/pages/vote/vote_binding.dart';
import 'package:meta_vest_sample/pages/vote/vote_page.dart';

abstract class Routes {
  static const String Home = '/home';
  static const String Feed = '/feed';
  static const String Search = '/search';
  static const String Ranking = '/ranking';
  static const String MyRoom = '/my_room';
  static const String Vote = '/vote';
  static const String DevelopSetting = '/develop-setting';
  static const String TimeLine = '/time-line';
}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.Home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.Feed,
        page: () => const FeedPage(),
        binding: FeedBinding()),
    GetPage(
        name: Routes.Ranking,
        page: () => const RankingPage(),
        binding: RankingBinding()),
    GetPage(
        name: Routes.MyRoom,
        page: () => const MyRoomPage(),
        binding: MyRoomBinding()),
    GetPage(
        name: Routes.Vote,
        page: () => const VotePage(),
        binding: VoteBinding()),
    GetPage(
        name: Routes.DevelopSetting,
        page: () => const DevelopSettingPage(),
        binding: DevelopSettingBinding()),
    GetPage(
        name: Routes.TimeLine,
        page: () => const TimeLinePage(),
        binding: TimeLineBinding()),
  ];
}
