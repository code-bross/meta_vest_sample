import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/ranking_model.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';

class RankingController extends GetxController {
  final List<String> _headers = ['수익률', '포트폴리오 구독자수 증가', '팔로워수 증가'];
  Map<String, List<RankingModel>>? _items;

  Map<String, List<RankingModel>> _generateItems() {
    return Map.fromIterable(_headers, key: (key) => key, value: (_) => DummyGenerate<List<RankingModel>>().generate);
  }

  Map<String, List<RankingModel>> get items{
    _items ??= _generateItems();
    print('print items');
    print(_items);
    return _items ?? _generateItems();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
