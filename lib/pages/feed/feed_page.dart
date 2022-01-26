import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';
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
          _Header(),
          Row(
            children: [
              Image.network(
                DummyType().getMimojiUrl(),
                width: 120,
                height: 120,
              ),
              _ThirdText()
            ],
          )
        ],
      ),
    ));
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Text( DummyType().name(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  DummyType().getTime(),
                  style: TextStyle(fontSize: 12),
                ))
          ],
        ));
  }
}

class _ThirdText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Flexible(child: _Tag()),
          Flexible(child: _Tag()),
          Flexible(child: _Tag())
        ]),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              DummyType().getContent(),
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
            )),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              DummyType().transaction(),
              style: TextStyle(fontSize: 14, color: Colors.blueAccent),
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }
}

class _Tag extends StatelessWidget {
  var _style = TextStyle(fontSize: 14, color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return Text(DummyType().hashTag(),
        maxLines: 1,
        style: _style, textAlign: TextAlign.start);
  }
}

class _Model {
  final String name;
  final DateTime time;
  final List<String> tags;
  final String content;
  final String description;
  final String imageUrl;

  _Model(this.name, this.time, this.tags, this.content, this.description,
      this.imageUrl);
}
