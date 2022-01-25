import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';
import 'package:meta_vest_sample/routes/app_pages.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final FeedController controller = Get.put(FeedController());
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: _onPressed,
      child: const Text('move to ranking'),
    )));
  }

  void _onPressed() {
    Get.toNamed(Routes.Ranking, arguments: {'use_appbar': true, 'close_mode' : true});
  }
}
