import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta_vest_sample/pages/dev.setting/branch/branch_controller.dart';
import 'package:timelines/timelines.dart';

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.feeds,
  });

  final List<_Feed> feeds;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == feeds.length + 1;
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
          indicatorBuilder: (_, index) =>
              !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 2.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            var feed = feeds[index - 1];
            return Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(feed.timeString()),
                      feed.header.contentType == _ContentType.Comment
                          ? Container(
                              child: Text(
                                feed.header.title,
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              margin: EdgeInsets.only(left: 4),
                              padding: EdgeInsets.all(4),
                            )
                          : Container(
                              child: Text(feed.header.title),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 4),
                              padding: EdgeInsets.all(4),
                            ),
                      feed.header.predictionType == _PredictionType.Bear
                          ? Icon(
                              Icons.arrow_drop_up,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                              color: Colors.blue,
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
                      child: Container(
                    child: Text(
                      feed.content,
                    ),
                    alignment: Alignment.centerLeft,
                  ))
                ],
              ),
            );
          },
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: feeds.length + 2,
        ),
      ),
    );
  }
}

class BranchPage extends StatelessWidget {
  const BranchPage({Key? key}) : super(key: key);

  Widget _body(BuildContext context) {
    var processes = [
      _Content(
        '2/23',
        messages: [
          _Feed(
              DateTime.utc(2022, 2, 23, 14, 23),
              '씨에스윈드, 종속회사 ASM Industries 지분 추가 취득 결정',
              _Header('국내뉴스', _ContentType.News, _PredictionType.Bear, [])),
        ],
      ),
      _Content(
        '2/22',
        messages: [
          _Feed(DateTime.utc(2022, 2, 23, 14, 23), '전운에 씨에스윈드, 부각되네.....',
              _Header('국내뉴스', _ContentType.News, _PredictionType.Bear, [])),
          _Feed(DateTime.utc(2022, 2, 23, 14, 21), '러시아 리스크 풍력주 기회',
              _Header('해외뉴스', _ContentType.News, _PredictionType.Bull, [])),
          _Feed(
              DateTime.utc(2022, 2, 23, 11, 09),
              '평단 5.6 주주입니다. 상방으로 가려면...',
              _Header('코멘트', _ContentType.Comment, _PredictionType.Bull,
                  ['#주주인증'])),
        ],
      )
    ];

    return FixedTimeline.tileBuilder(
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
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: TextStyle(
                          color: Colors.white, backgroundColor: Colors.black),
                    ),
                    _InnerTimeline(feeds: processes[index].messages),
                  ],
                ),
              );
            }));
  }

  @override
  Widget build(context) {
    return GetBuilder<BranchController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text('씨에스윈드'),
              ),
              body: _body(context),
            ));
  }
}

class _Content {
  const _Content(
    this.name, {
    this.messages = const [],
  });

  final String name;
  final List<_Feed> messages;
}

class _Feed {
  const _Feed(this.createdAt, this.content, this.header);

  final DateTime createdAt; // final DateTime createdAt;
  final String content;
  final _Header header;

  @override
  String toString() {
    return '${timeString()} $content';
  }

  String timeString() => DateFormat('HH:mm').format(createdAt);
}

class _Header {
  const _Header(this.title, this.contentType, this.predictionType, this.tags);

  final String title;
  final _ContentType contentType;
  final _PredictionType predictionType;
  final List<String> tags;
}

enum _PredictionType { Bull, Bear }

enum _ContentType { News, Comment }
