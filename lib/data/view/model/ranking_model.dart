class RankingModel {
  final int rank;
  final double earningRate;
  final double sharpeRate;
  final String imageUrl;
  final Map<String, double> investedInfoMap;

//<editor-fold desc="Data Methods">

  const RankingModel({
    required this.rank,
    required this.earningRate,
    required this.sharpeRate,
    required this.imageUrl,
    required this.investedInfoMap,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RankingModel &&
          runtimeType == other.runtimeType &&
          rank == other.rank &&
          earningRate == other.earningRate &&
          sharpeRate == other.sharpeRate &&
          imageUrl == other.imageUrl &&
          investedInfoMap == other.investedInfoMap);

  @override
  int get hashCode =>
      rank.hashCode ^
      earningRate.hashCode ^
      sharpeRate.hashCode ^
      imageUrl.hashCode ^
      investedInfoMap.hashCode;

  @override
  String toString() {
    return 'RankingModel{' +
        ' rank: $rank,' +
        ' earningRate: $earningRate,' +
        ' sharpeRate: $sharpeRate,' +
        ' imageUrl: $imageUrl,' +
        ' investedInfoMap: $investedInfoMap,' +
        '}';
  }

  RankingModel copyWith({
    int? rank,
    double? earningRate,
    double? sharpeRate,
    String? imageUrl,
    Map<String, double>? investedInfoMap,
  }) {
    return RankingModel(
      rank: rank ?? this.rank,
      earningRate: earningRate ?? this.earningRate,
      sharpeRate: sharpeRate ?? this.sharpeRate,
      imageUrl: imageUrl ?? this.imageUrl,
      investedInfoMap: investedInfoMap ?? this.investedInfoMap,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rank': this.rank,
      'earningRate': this.earningRate,
      'sharpeRate': this.sharpeRate,
      'imageUrl': this.imageUrl,
      'investedInfoMap': this.investedInfoMap,
    };
  }

  factory RankingModel.fromMap(Map<String, dynamic> map) {
    return RankingModel(
      rank: map['rank'] as int,
      earningRate: map['earningRate'] as double,
      sharpeRate: map['sharpeRate'] as double,
      imageUrl: map['imageUrl'] as String,
      investedInfoMap: map['investedInfoMap'] as Map<String, double>,
    );
  }

//</editor-fold>
}

extension RankingModelExtension on RankingModel{

  String _formated(double number) => number.toStringAsFixed(2);

 String earningRateString(){
   if(earningRate > 0) {
     return '+${_formated(earningRate)}%';
   }
   else{
     return '${_formated(earningRate)}%';
   }
 }
 String sharpeRateString(){
   if(sharpeRate > 0) {
     return '+${_formated(sharpeRate)}%';
   }
   else{
     return '${_formated(sharpeRate)}%';
   }
 }
}