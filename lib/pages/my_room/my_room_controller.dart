import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/my_room_model.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';

class MyRoomController extends GetxController
    with SingleGetTickerProviderMixin {
  MyRoomModel item = DummyGenerate<MyRoomModel>().generate;
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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
