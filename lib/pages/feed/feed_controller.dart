import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/feed_model.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';

class FeedController extends GetxController{
  List<FeedModel>? _items;
  List<FeedModel> get items{
    _items??=DummyGenerate<List<FeedModel>>().generate;
    return _items ?? DummyGenerate<List<FeedModel>>().generate;
  }


  @override
  void onInit() {
    super.onInit();
  }

}