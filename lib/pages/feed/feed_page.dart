import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/pages/feed/feed_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GetBuilder<FeedController>(
        builder: (controller) => Scaffold(
                body: ListView.separated(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Feed();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            )));
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text('계좌에 봄날이 올까',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        '5분전',
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              )),
          Row(
            children: [
              Image.network(
                'https://pbs.twimg.com/media/EGL70oUVAAAwhzz.png',
                width: 120,
                height: 120,
              ),
              Column(
                children: [
                  Text(
                    '#달걀파동 #양계업 #농장대표',
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        '특란 1알에 150원대 가격이 농장을 ',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        '@풀무원 매도 150주 (2022/01/17 인증)',
                        style:
                            TextStyle(fontSize: 14, color: Colors.blueAccent),
                        textAlign: TextAlign.start,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
