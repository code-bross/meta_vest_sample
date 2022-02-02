import 'package:get/get.dart';
import 'package:meta_vest_sample/data/view/model/ranking_model.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';
import 'package:meta_vest_sample/pages/ranking/ranking_type.dart';

class RankingController extends GetxController {

  final List<RankingType> _types = [
    RankingType.EarningRate,
    RankingType.PortpolioSubsribeCount,
    RankingType.FollowCount,
  ];

  Map<RankingType, List<RankingModel>>? _items;
  Map<RankingType, List<RankingModel>> _generateItems() {
    return Map.fromIterable(_types,
        key: (key) => key,
        value: (_) => DummyGenerate<List<RankingModel>>().generate);
  }

  Map<RankingType, List<RankingModel>> get items {
    _items ??= _generateItems();
    return _items ?? _generateItems();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
