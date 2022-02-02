import '../../core/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum RankingType { EarningRate, PortpolioSubsribeCount, FollowCount }

extension RankingTypeNames on RankingType {
  String name() {
    switch (this) {
      case RankingType.EarningRate:
        return tr(LocaleKeys.earning_rate);
      case RankingType.PortpolioSubsribeCount:
        return tr(LocaleKeys.port_polio_subscriber_increase);
      case RankingType.FollowCount:
        return tr(LocaleKeys.follower_increase);
    }
  }
}
