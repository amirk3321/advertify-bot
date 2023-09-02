

class AdsGeneratorData{
  final String text;
  final num index;
  final String finish_reason;

  AdsGeneratorData({required this.text,required this.index,required this.finish_reason});


  factory AdsGeneratorData.fromJson(Map<String,dynamic> json){

    return AdsGeneratorData(
      text: json['text'],
      index: json['index'],
      finish_reason: json['finish_reason'],
    );
  }
}