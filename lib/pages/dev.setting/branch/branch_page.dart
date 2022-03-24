import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch/branch_controller.dart';
import 'package:timelines/timelines.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({Key? key}) : super(key: key);

  Widget _body(BuildContext context, KtMap<String, KtList<Feed>> map) {
    return SingleChildScrollView(
        child: FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0,
              color: Color(0xff989898),
              indicatorTheme: IndicatorThemeData(
                position: 0,
                size: 20.0,
              ),
              connectorTheme: ConnectorThemeData(
                thickness: 2.5,
              ),
            ),
            builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemCount: map.size,
                contentsBuilder: (_, index) {
                  var key = map.keys.toList()[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          key,
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black),
                        ),
                        _InnerTimeline(
                            parentIndex: index,
                            feeds: map[key] ?? KtList.empty()),
                      ],
                    ),
                  );
                })));
  }

  @override
  Widget build(context) {
    return GetBuilder<BranchController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text('씨에스윈드'),
              ),
              body: _body(context, controller.group),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => {controller.add()},
              ),
            ));
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.parentIndex,
    required this.feeds,
  });

  final int parentIndex;

  final KtList<Feed> feeds;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == feeds.size + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                size: 10.0,
                position: 0.5,
              ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) => !isEdgeIndex(index)
              ? Indicator.outlined(
                  borderWidth: 0,
                  backgroundColor: feeds[index - 1].header.predictionType ==
                          PredictionType.Bull
                      ? Colors.red
                      : Colors.blue,
                  color: feeds[index - 1].header.predictionType ==
                          PredictionType.Bull
                      ? Colors.red
                      : Colors.blue)
              : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            var feed = feeds[index - 1];
            return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () => feed.comment?.let((_) {
                    return Get.find<BranchController>()
                        .expand(parentIndex, feed);
                  }),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(feed.timeString()),
                          feed.header.contentType == ContentType.Comment
                              ? Container(
                                  child: Text(
                                    feed.header.contentType.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  margin: EdgeInsets.only(left: 4),
                                  padding: EdgeInsets.all(4),
                                )
                              : Container(
                                  child: Text(feed.header.contentType.name),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(left: 4),
                                  padding: EdgeInsets.all(4),
                                ),
                          feed.header.predictionType == PredictionType.Bear
                              ? Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                )
                              : Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.red,
                                ),
                          feed.header.tags.isNotEmpty
                              ? Row(
                                  children: feed.header.tags
                                      .map((e) => Text(
                                            e,
                                            style: TextStyle(fontSize: 11),
                                          ))
                                      .toList(),
                                )
                              : Container()
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            child: Text(
                              feed.content,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          feed.expand && feed.comment != null
                              ? Column(children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(top: 4, right: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      child: Text(
                                        feed.comment?.comment ?? '',
                                        textAlign: TextAlign.left,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.thumb_up_alt_outlined),
                                        Text(feed.comment?.thumbsUpcount
                                                .toString() ??
                                            ''),
                                        Icon(
                                            Icons.chat_bubble_outline_outlined),
                                        Text(feed.comment?.commentCount
                                                .toString() ??
                                            ''),
                                      ],
                                    ),
                                    alignment: Alignment.centerRight,
                                  )
                                ])
                              : Container()
                        ],
                      )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ));
          },
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: feeds.size + 2,
        ),
      ),
    );
  }
}
