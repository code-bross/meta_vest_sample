import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/vote_model.dart';
import 'package:meta_vest_sample/extensions/widget_extensions.dart';
import 'package:meta_vest_sample/pages/vote/vote_controller.dart';
import 'package:polls/polls.dart';
import '../../core/lang/locale_keys.g.dart';
import '../../data/view/model/comment_model.dart';

class VotePage extends StatelessWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(body: Center(child: _PollView()));
  }
}

class _PollView extends GetView<VoteController> {
  String user = "king@mail.com";
  Map usersWhoVoted = {
    'sam@mail.com': 3,
    'mike@mail.com': 4,
    'john@mail.com': 1,
    'kenny@mail.com': 1
  };
  String creator = "eddy@mail.com";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoteController>(builder: (controller) {
      return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Image.network(
                    "https://images.chosun.com/resizer/S0GjYiA3S5hfvJK8UglVnB2b0To=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/KVU7FBR2Y4R7RPBH5HWZXK4R6U.jpg"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: _voteView(),
                ),
                _CommentView()
              ],
            )),
          ));
    });
  }

  Widget _voteYet() => Polls(
        children: controller.items.map((e) => e.toPollsModel()).toList(),
        question: Text('오너 리스크 멸공 발언!\n베어들의 생각은?'),
        currentUser: this.user,
        creatorID: this.creator,
        voteData: usersWhoVoted,
        onVoteBackgroundColor: Colors.blue,
        leadingBackgroundColor: Colors.blue,
        backgroundColor: Colors.white,
        onVote: (index) {
          controller.choice(index);
        },
      );

  Widget _voted() => Polls.viewPolls(
      children: controller.items.map((e) => e.toPollsModel()).toList(),
      question: Text('오너 리스크 멸공 발언!\n베어들의 생각은?'));

  Widget _voteView() {
    if (!controller.isVoted) {
      return _voteYet();
    } else {
      return Container(
        margin: EdgeInsets.only(right: 8, left: 8,),
        child: _voted(),
      );
    }
  }
}

class _CommentView extends GetView<VoteController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoteController>(builder: (controller) {
      return _comments(controller.comments);
    });
  }

  final TextStyle _textStyle1 = const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

  Widget _comments(List<CommentModel> items) => Wrap(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 150,
            ),
            child: Container(
              color: Colors.transparent,
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 36,
                        child: Text(
                          LocaleKeys.comment.tr,
                          style: _textStyle1,
                        ).padding(EdgeInsets.all(8)).align(Alignment.topLeft)),
                    ..._rows(items)
                  ],
                ).align(Alignment.topLeft),
              ),
            ),
          )
        ],
      );

  List<Widget> _rows(List<CommentModel> items) {
    return items.map((e) => _row(e)).toList();
  }

  Widget _row(CommentModel comment) {
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(comment.imageUrl),
            ).padding(EdgeInsets.only(bottom: 4)),
            Text(comment.name)
          ],
        ),
        Text(comment.content).padding(EdgeInsets.only(left: 8)).expanded()
      ],
    ).padding(EdgeInsets.all(8));
  }
}
