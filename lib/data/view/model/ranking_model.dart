class RankingModel {
  final int rank;
  final double earningRate;
  final double sharpeRate;
  final String imageUrl;
  RankingModel(this.rank, this.earningRate, this.sharpeRate, this.imageUrl);
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