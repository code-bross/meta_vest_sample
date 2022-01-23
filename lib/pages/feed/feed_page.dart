import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final FeedController controller = Get.put(FeedController());
    return const Scaffold(body: Center(child: Text('feed')));
  }
}
