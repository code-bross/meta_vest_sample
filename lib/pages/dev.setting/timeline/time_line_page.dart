import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:timeline_list/timeline.dart';

import 'time_line_controller.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  Widget _timeline(TimeLineController controller) =>
      Timeline(children: controller.items, position: TimelinePosition.Center);

  @override
  Widget build(context) {
    return GetBuilder<TimeLineController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(title: Text('원유'),),
              body: _timeline(controller),
            ));
  }
}
