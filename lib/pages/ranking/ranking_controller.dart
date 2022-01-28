import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:meta_vest_sample/core/lang/locale_keys.g.dart';
import 'package:meta_vest_sample/data/view/model/ranking_model.dart';
import 'package:meta_vest_sample/dummy/DummyTypes.dart';

class RankingController extends GetxController {
  final List<String> _headers = [
    tr(LocaleKeys.earning_rate),
    tr(LocaleKeys.port_polio_subscriber_increase),
    tr(LocaleKeys.follower_increase)
  ];

  Map<String, List<RankingModel>>? _items;

  Map<String, List<RankingModel>> _generateItems() {
    return Map.fromIterable(_headers,
        key: (key) => key,
        value: (_) => DummyGenerate<List<RankingModel>>().generate);
  }

  Map<String, List<RankingModel>> get items {
    _items ??= _generateItems();
    return _items ?? _generateItems();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
