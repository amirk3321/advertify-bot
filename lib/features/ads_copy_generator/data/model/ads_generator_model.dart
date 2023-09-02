


import 'package:advertify_bot/features/ads_copy_generator/data/model/ads_copy_generator_data.dart';


class AdsCopyGenerator {
  final num created;
  final List<AdsGeneratorData> choices;

  AdsCopyGenerator({required this.created, required this.choices});

  factory AdsCopyGenerator.fromJson(Map<String, dynamic> json) {
    final textCompletionItems = json['choices'] as List;
    List<AdsGeneratorData> choices = textCompletionItems
        .map((singleItem) => AdsGeneratorData.fromJson(singleItem))
        .toList();

    return AdsCopyGenerator(
      choices: choices,
      created: json['created'],
    );
  }
}