import 'package:darq/darq.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/core/lang/locale_keys.g.dart';
import 'package:meta_vest_sample/data/view/model/my_room_model.dart';
import 'package:meta_vest_sample/pages/feed/feed_page.dart';
import 'package:meta_vest_sample/pages/my_room/my_room_controller.dart';
import 'package:pie_chart/pie_chart.dart';

class MyRoomPage extends StatelessWidget {
  const MyRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRoomController>(builder: (controller) {
      if (Get.parameters['profile'] == null) {
        controller.updatOwn();
      }
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(controller.item),
            _AliasSection(controller.item),
            _InterestSection(controller.item),
            _TabSection(controller)
          ],
        )),
      );
    });
  }
}

class _Header extends StatelessWidget {
  final MyRoomModel _model;

  const _Header(this._model);

  final _textStyle = const TextStyle(
      fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            child: Text(
              _model.title,
              style: _textStyle,
            ),
            padding: const EdgeInsets.all(16),
          ),
          alignment: Alignment.topLeft,
        ),
        Row(children: [
          _Avatar(_model),
          Column(
            children: [
              _PairedText(Tuple2(tr(LocaleKeys.id), _model.id)),
              _PairedText(
                  Tuple2(tr(LocaleKeys.follower), _model.followCountString())),
              _PairedText(Tuple2(
                  tr(LocaleKeys.following), _model.followingCountString())),
            ],
          )
        ])
      ],
    );
  }
}

class _PairedText extends StatelessWidget {
  var firstTextStyle = const TextStyle(fontSize: 12, color: Colors.grey);
  var secondTextStyle = const TextStyle(
      fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);

  final Tuple2<String, String> _tuple;

  _PairedText(this._tuple);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 12),
        child: Container(
            alignment: Alignment.topLeft,
            child: Row(children: [
              Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Text(
                    _tuple.item0,
                    style: firstTextStyle,
                    textAlign: TextAlign.start,
                  )),
              Text(
                _tuple.item1,
                style: secondTextStyle,
              )
            ])));
  }
}

class _Avatar extends StatelessWidget {
  final MyRoomModel _model;

  _Avatar(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.network(
                  _model.profileImageUrl,
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          foregroundImage:
                              NetworkImage(_model.selectAliasImageUrl)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.purple,
                        child: Padding(
                          child: Text(
                            _model.selectAliasName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(4),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _AliasSection extends StatelessWidget {
  final MyRoomModel _model;

  _AliasSection(this._model);

  final _textStyle = const TextStyle(
      fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Text(
                tr(LocaleKeys.get_badges),
                style: _textStyle,
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _model.aliasImageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black87,
                              child: CircleAvatar(
                                  radius: 19,
                                  foregroundImage: NetworkImage(
                                      _model.aliasImageUrls[index]))));
                    }))
          ],
        ));
  }
}

class _InterestSection extends StatelessWidget {
  final MyRoomModel _model;

  _InterestSection(this._model);

  final _textStyle = const TextStyle(
      fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);
  final _tagTextStyle = const TextStyle(
      fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Text(
                tr(LocaleKeys.interest_indicator),
                style: _textStyle,
              ),
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 8),
            SizedBox(
                height: 16,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _model.interestIndicators.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            '#${_model.interestIndicators[index]}',
                            style: _tagTextStyle,
                          ));
                    }))
          ],
        ));
  }
}

class _TabSection extends StatelessWidget {
  final MyRoomController controller;

  _TabSection(this.controller);

  Widget _tabBar() => Align(
      alignment: Alignment.center,
      child: TabBar(
        controller: controller.tabController,
        indicatorColor: Colors.teal,
        indicatorWeight: 1,
        labelColor: Colors.teal,
        unselectedLabelColor: Colors.black54,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            text: tr(LocaleKeys.analysis),
          ),
          Tab(
            text: tr(LocaleKeys.post),
          ),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tabBar(),
        Container(
          child: getBody(),
        ),
      ],
    );
  }

  void _onPressed() {
    Get.showSnackbar(
        GetSnackBar(message: '구현되어있지 않습니다.', duration: Duration(seconds: 1)));
  }

  PieChart _pieChart() => PieChart(
      dataMap: controller.item.myRoomAnalyticsModel.investedInfoMap,
      colorList: const [
        Colors.redAccent,
        Colors.lightGreen,
        Colors.lightBlue,
        Colors.lime,
        Colors.orange,
        Colors.purple,
        Colors.pink,
        Colors.amber,
        Colors.brown,
        Colors.cyan,
      ],
      chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: true,
          chartValueBackgroundColor: Colors.transparent,
          chartValueStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )));

  Widget getBody() {
    switch (controller.selectTabIndex) {
      case 0:
        return Column(children: [
          _pieChart(),
          Padding(
              padding: EdgeInsets.all(24),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _onPressed,
                      child: Text(tr(LocaleKeys.portfolio_subscribe)))))
        ]);
      case 1:
        return Container(
            child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.feedList.length,
          itemBuilder: (BuildContext context, int index) {
            return Feed(controller.feedList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ));
      default:
        return Text('');
    }
  }
}
