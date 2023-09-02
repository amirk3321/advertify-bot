

import 'dart:convert';

import 'package:advertify_bot/core/custom_exceptions.dart';
import 'package:advertify_bot/features/ads_copy_generator/data/model/ads_generator_model.dart';
import 'package:advertify_bot/features/ads_copy_generator/data/remote_data_source/ads_copy_generator_remote_data_source.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/entities/ads_copy_entity.dart';
import 'package:advertify_bot/features/global/provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AdsCopyGeneratorRemoteDataSourceImpl implements AdsCopyGeneratorRemoteDataSource{

  final http.Client httpClient;

  AdsCopyGeneratorRemoteDataSourceImpl({required this.httpClient});



  @override
  Future<AdsCopyGenerator> getAdsCopy(AdsCopyEntity adsCopyEntity)async {
    const String _endPoint = "completions";

    // Map<String, dynamic> rowParams = {
    //   "model":"text-davinci-003",
    //   "prompt":"Create 50 words of advertising copy for ${adsCopyEntity.productName}, which can be described as ${adsCopyEntity.productDescription} aimed at ${adsCopyEntity.targetMarket}.",
    //   "max_tokens": 100,
    // };

    Map<String, dynamic> rowParams = {
      "model":"text-davinci-003",
      "prompt":"""
      Use a product name, a product description and a target market to create advertising copy for a product.
      ###
      product name: Flask Tie
      product description: A tie with a pouch to hold liquids and a straw to drink through
      product target market: office workers
      advertising copy: Are you tired of having to worry about how much to drink throughout the day? With the Flask Tie, you can stay hydrated on-the-go! Our unique tie features a pouch that enables you to securely hold and sip your favorite drinks with the built-in straw! The water cooler is history! Long live Flask Tie!
      ###
      product name: SolarSwim
      product description: Swimming costumes for all genders with solar cells to charge your devices while you sunbathe.
      product target market: Aimed at young adults
      advertising copy: Don't miss a beat while you're having fun in the sun! SolarSwim is the perfect choice for the tech-savvy, on-the-go millennial. Our innovative swimming costumes come with integrated solar cells that allow you to charge and access your devices while you're at the beach or pool. Enjoy your summer break with SolarSwim! 
      ###
      product name: ${adsCopyEntity.productName}
      product description: ${adsCopyEntity.productDescription}
      product target market: ${adsCopyEntity.targetMarket}
      advertising copy: 
      """,
      "max_tokens": 100,
    };

    final encodedParams = json.encode(rowParams);

    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encodedParams,
      headers: headerBearerOption(dotenv.get('OPENAI_KEY',fallback: "")),
    );

    if (response.statusCode == 200) {
      return AdsCopyGenerator.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "GPT Server Exception");
    }
  }

}