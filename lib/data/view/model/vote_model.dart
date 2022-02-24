import 'package:polls/polls.dart';

class VoteModel {
  final String title;
  final double value;

//<editor-fold desc="Data Methods">

  const VoteModel({
    required this.title,
    required this.value,
  });

//<ed@override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VoteModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          value == other.value);

  @override
  int get hashCode => title.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'VoteModel{' + ' title: $title,' + ' value: $value,' + '}';
  }

  VoteModel copyWith({
    String? title,
    double? value,
  }) {
    return VoteModel(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'value': this.value,
    };
  }

  factory VoteModel.fromMap(Map<String, dynamic> map) {
    return VoteModel(
      title: map['title'] as String,
      value: map['value'] as double,
    );
  }

//</editor-fold> itor-fold desc="Data Methods">

}

extension VoteModelExtension on VoteModel {
  List toPollsModel() => Polls.options(title: title, value: value);
}
