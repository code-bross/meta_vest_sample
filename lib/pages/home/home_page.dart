import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/core/lang/locale_keys.g.dart';
import 'package:meta_vest_sample/pages/feed/feed_page.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_page.dart';
import 'package:meta_vest_sample/pages/search/search_page.dart';
import 'package:meta_vest_sample/routes/app_pages.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Widget> tabs = <Widget>[FeedPage(), RankingPage()];

    List<BottomNavigationBarItem> _bottomItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: const Icon(Icons.home), label: tr(LocaleKeys.home)),
      BottomNavigationBarItem(
          icon: const Icon(Icons.emoji_events), label: tr(LocaleKeys.ranking)),
    ];

    PreferredSizeWidget _appBar = AppBar(
        title: Text(tr(LocaleKeys.app_name)),
        leading: IconButton(
          icon: const Icon(Icons.insights),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ]);

    return GetBuilder<HomeController>(
      builder: (controller){
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: tabs,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.black,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: controller.tabIndex,
              onTap: _onTap,
              items: _bottomItems),
          appBar: _appBar,
        );
      },
    );
  }

  void _onTap(index) {
    Get.find<HomeController>().changeTabIndex(index);
  }
}
