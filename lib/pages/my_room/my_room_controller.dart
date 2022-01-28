import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/feed_model.dart';
import 'package:meta_vest_sample/data/view/model/my_room_model.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';
import 'package:meta_vest_sample/pages/feed/feed_page.dart';

class MyRoomController extends GetxController
    with SingleGetTickerProviderMixin {
  MyRoomModel item = DummyGenerate<MyRoomModel>().generate;
  List<FeedModel> _feedList = DummyGenerate<List<FeedModel>>().generate;
  List<FeedModel> get feedList => _feedList.take(3).toList();

  TabController? _tabController;
  ScrollController? _scrollController;

  TabController get tabController {
    _tabController ??= TabController(length: 2, vsync: this);
    return _tabController ?? TabController(length: 2, vsync: this);
  }

  ScrollController get scrollController {
    _scrollController ??= ScrollController();
    return _scrollController ?? ScrollController();
  }

  int selectTabIndex = 0;

  @override
  void onInit() {
    tabController.addListener(() {
      print(tabController.index);
      _updateTabIndex(tabController.index);
    });
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _updateTabIndex(int index){
    selectTabIndex = index;
    update();
  }
}
