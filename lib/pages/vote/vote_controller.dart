import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/comment_model.dart';
import 'package:meta_vest_sample/data/view/model/vote_model.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';

class VoteController extends GetxController {
  List<VoteModel>? _items;

  List<VoteModel> get items {
    _items ??= _generateItems();
    return _items ?? _generateItems();
  }

  List<CommentModel>? _comments;

  List<CommentModel> get comments {
    _comments ??= _generateComments();
    return _comments ?? _generateComments();
  }

  var isVoted = false;

  List<VoteModel> _generateItems() => DummyGenerate<List<VoteModel>>().generate;

  List<CommentModel> _generateComments() => DummyGenerate<List<CommentModel>>().generate;

  void choice(int index) {
    var newItem = items[index - 1].copyWith(value: items[index - 1].value + 1);
    _items?[index - 1] = newItem;
    isVoted = true;
    update();
  }
}
