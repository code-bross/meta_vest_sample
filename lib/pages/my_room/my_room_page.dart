import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';

class MyRoomPage extends StatelessWidget {
  const MyRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Header(),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'My Room',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.topLeft,
        ),
        Row(children: [
          _Avatar(),
          Column(
            children: [
              _PairedText(),
              _PairedText(),
              _PairedText(),
            ],
          )
        ])
      ],
    );
  }
}

class _PairedText extends StatelessWidget {
  var firstTextStyle = TextStyle(fontSize: 12, color: Colors.grey);

  var secondTextStyle =
      TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 12),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.only(right: 24),
              child: Text(
                'ID',
                style: firstTextStyle,
              )),
          Text(
            '계좌에 봄날이 올까',
            style: secondTextStyle,
          )
        ]));
  }
}

class _Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.network(
                  DummyType().getMimojiUrl(),
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        foregroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/22/22791.png')),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.purple,
                        child: Padding(
                          child: Text(
                            '테크덕후',
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.all(4),
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
