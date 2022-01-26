import 'package:get/get.dart';
import 'package:meta_vest_sample/core/data/response.dart';

class RankingController extends GetxController {
  List<ApiResponse> list = <ApiResponse>[];

  @override
  void onInit() {
    load();
    super.onInit();
  }

  void load() {
    var loadingList = [for (var i = 0; i < 10; i += 1) i]
        .map((e) => ApiResponse.init());

    _updateValue(loadingList.toList());

    Future<List<ApiResponse>>.delayed(const Duration(seconds: 1), () {
      return _result();
    }).then((value) => _updateValue(value));
  }

  List<ApiResponse> _result() {
    return [for (var i = 0; i < 10; i += 1) i]
        .map((i) => ApiResponse.success(MyModel(text: '$i')))
        .toList();
  }

  void _updateValue(List<ApiResponse> newList) {
    list.clear();
    list.addAll(newList);
    update();
  }
}

// @freezed
// class MyModel with _$MyModel {
//   factory MyModel({
//     required String data,
//   }) = MyModel;
//
//   factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);
// }
class MyModel {
  late String text;

  MyModel({text});

  MyModel.from(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}
