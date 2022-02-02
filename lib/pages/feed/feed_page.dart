import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/feed_model.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';
import 'package:pie_chart/pie_chart.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GetBuilder<FeedController>(
        builder: (controller) => Scaffold(
                body: ListView.separated(
              shrinkWrap: true,
              itemCount: controller.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Feed(controller.items[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )));
  }
}

class Feed extends StatelessWidget {
  final FeedModel _model;

  Feed(this._model);

  @override
  Widget build(context) {
    return InkWell(
      child: Container(
          child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            _Header(_model),
            Row(
              children: [
                Image.network(
                  _model.imageUrl,
                  width: 120,
                  height: 120,
                ),
                _ContentText(_model)
              ],
            )
          ],
        ),
      )),
      onTap: () => _bottomSheet(),
    );
  }

  void navigateToMyRoom() {}

  void _bottomSheet() {
    switch (Random.secure().nextInt(3)) {
      case 0:
        _robotBottomSheet();
        break;
      case 1:
        _birdBottomSheet();
        break;
      case 2:
        _ownerRiskSheet();
        break;
    }
  }

  void _robotBottomSheet() {
    Get.bottomSheet(Wrap(children: [
      ConstrainedBox(
          constraints: BoxConstraints(minHeight: 400),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    Image.network(
                        "https://w.namu.la/s/c9b951140de72f66425f2f5523cd2a4aa0a796a5c67e4c8363782e249d58f9d4fbbd977b1c6fd8d0fcecf5ee70a146619ee15c502a074c547f931384a97d69e545c812a594659981193b546f627eedae"),
                    SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '잃었습니까? 휴먼',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          color: Colors.black45,
                        )),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: PieChart(
                      dataMap: {
                        '신한 금융지주': 1000,
                        '카카오': 500,
                        '네이버': 200,
                      },
                      chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                          chartValueBackgroundColor: Colors.transparent,
                          chartValueStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ),
                Text(
                  '수익률 1,236%',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                ElevatedButton(
                    onPressed: () {
                      navigateToMyRoom();
                    },
                    child: Text('AI 투자 따라하기'))
              ],
            ),
          ))
    ]));
  }

  void _birdBottomSheet() {
    Get.bottomSheet(Wrap(children: [
      ConstrainedBox(
          constraints: BoxConstraints(minHeight: 400),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    Image.network(
                        "https://ogq-sticker-global-cdn-z01.afreecatv.com/sticker/17a2cb602341126/7.png"),
                    SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '2년전에 샀으면?',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          color: Colors.black45,
                        )),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: PieChart(
                      dataMap: {
                        '신한 금융지주': 1000,
                        '카카오': 500,
                        '네이버': 200,
                      },
                      chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                          chartValueBackgroundColor: Colors.transparent,
                          chartValueStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ),
                Text(
                  '수익률 13,112%',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                ElevatedButton(
                    onPressed: () {
                      navigateToMyRoom();
                    },
                    child: Text('고수의 투자 포트폴리오 보러가기'))
              ],
            ),
          ))
    ]));
  }

  void _ownerRiskSheet() {
    Get.bottomSheet(Wrap(children: [
      ConstrainedBox(
          constraints: BoxConstraints(minHeight: 400),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    Image.network(
                        "https://images.chosun.com/resizer/S0GjYiA3S5hfvJK8UglVnB2b0To=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/KVU7FBR2Y4R7RPBH5HWZXK4R6U.jpg"),
                    SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '오너 리스크 멸공발언!',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          color: Colors.black45,
                        )),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: PieChart(
                      dataMap: {
                        '신세계': 1000,
                        '이마트': 500
                      },
                      chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                          chartValueBackgroundColor: Colors.transparent,
                          chartValueStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ),
                Text(
                  '수익률 -12%',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                ElevatedButton(
                    onPressed: () {
                      navigateToMyRoom();
                    },
                    child: Text('시장가 매도'))
              ],
            ),
          ))
    ]));
  }
}

class _Header extends StatelessWidget {
  final FeedModel _model;

  _Header(this._model);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Text(_model.name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  _model.getDateString(),
                  style: TextStyle(fontSize: 12),
                ))
          ],
        ));
  }
}

class _ContentText extends StatelessWidget {
  final FeedModel _model;

  _ContentText(this._model);

  Widget _getTag(String text) {
    return Flexible(child: _Tag(text));
  }

  List<Widget> _getTagList() =>
      _model.tags.map((text) => _getTag(text)).toList();

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: _getTagList()),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              _model.content,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
            )),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              _model.transaction,
              style: TextStyle(fontSize: 14, color: Colors.blueAccent),
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }
}

class _Tag extends StatelessWidget {
  final String _text;

  _Tag(this._text);

  final _style = TextStyle(fontSize: 14, color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return Text(_text, maxLines: 1, style: _style, textAlign: TextAlign.start);
  }
}
