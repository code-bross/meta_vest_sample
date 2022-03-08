import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:timeline_list/timeline_model.dart';

class TimeLineController extends GetxController {
  List<TimelineModel> items = [
    TimelineModel(
        Flexible(
            child: Row(children: [
          Column(
            children: [
              CircleAvatar(
                child: Text(
                  'B',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.redAccent,
              ),
              Text('43')
            ],
          ),
          Flexible(
              child: BubbleSpecialThree(
            text: '우크라니 전쟁으로 인해 원유 공급망 차질 불가피...',
            color: Colors.redAccent,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
          )),
        ])),
        position: TimelineItemPosition.left,
        iconBackground: Colors.redAccent,
        icon: Icon(Icons.arrow_upward, color: Colors.white,)),
    TimelineModel(
        Row(
          children: [
            Flexible(
                child: BubbleSpecialThree(
              text: "[NEWS] 러시아 우크라이나 침공! - 글로벌뉴스",
              color: Colors.grey,
              tail: false,
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            )),

            SizedBox(
                width: 38,
                child: Flexible(
                  child: Text('10:30 AM'),
                ))
          ],
        ),
        position: TimelineItemPosition.left,
        iconBackground: Colors.white,
        icon: Icon(Icons.newspaper)),
    TimelineModel(
        Flexible(
            child: Row(
          children: [
            Flexible(
                child: BubbleSpecialThree(
              text: "러시아 전쟁은 일어나지 않을것, 원유 공급망은 건재해....",
              color: Colors.blueAccent,
              tail: true,
              isSender: false,
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            )),
            Column(
              children: [
                CircleAvatar(
                  child: Text('A'),
                ),
                Text('99')
              ],
            )
          ],
        )),
        position: TimelineItemPosition.right,
        iconBackground: Colors.blueAccent,
        icon: Icon(Icons.arrow_downward, color: Colors.white,)),

    TimelineModel(
        Row(
          children: [
            Flexible(
                child: BubbleSpecialThree(
                  text: "[NEWS] 러시아 군사작전 시작하나? - 글로벌뉴스",
                  color: Colors.grey,
                  tail: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                )),

            SizedBox(
                width: 38,
                child: Flexible(
                  child: Text('7:21 AM'),
                )),
          ],
        ),
        position: TimelineItemPosition.left,
        iconBackground: Colors.white,
        icon: Icon(Icons.newspaper)),
    TimelineModel(
        Flexible(
            child: Row(children: [
              Column(
                children: [
                  CircleAvatar(
                    child: Text(
                      'B',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                  Text('43')
                ],
              ),
              Flexible(
                  child: BubbleSpecialThree(
                    text: '전문가들 전쟁 발발 확률 70%이상...',
                    color: Colors.redAccent,
                    tail: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ])),
        position: TimelineItemPosition.left,
        iconBackground: Colors.redAccent,
        icon: Icon(Icons.arrow_upward, color: Colors.white,)),

    TimelineModel(
        Row(
          children: [
            SizedBox(
                width: 38,
                child: Flexible(
                  child: Text('5:45 AM'),
                )),
            Flexible(
                child: BubbleSpecialThree(
                  text: "[NEWS] OPEC 증산결정 - 글로벌뉴스",
                  color: Colors.grey,
                  tail: false,
                  isSender: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
        position: TimelineItemPosition.right,
        iconBackground: Colors.white,
        icon: Icon(Icons.newspaper)),

    TimelineModel(
        Flexible(
            child: Row(
              children: [
                Flexible(
                    child: BubbleSpecialThree(
                      text: "OPEC에서 증산 결정시 원유가격 폭락 예정...",
                      color: Colors.blueAccent,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                Column(
                  children: [
                    CircleAvatar(
                      child: Text('A'),
                    ),
                    Text('99')
                  ],
                )
              ],
            )),
        position: TimelineItemPosition.right,
        iconBackground: Colors.blueAccent,
        icon: Icon(Icons.arrow_downward, color: Colors.white,)),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
