


import 'package:advertify_bot/features/ads_copy_generator/data/model/ads_generator_model.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/entities/ads_copy_entity.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/repositories/ads_copy_generator_repository.dart';

class AdsCopyGeneratorUseCase{
  final AdsCopyGeneratorRepository repository;

  AdsCopyGeneratorUseCase({required this.repository});


  Future<AdsCopyGenerator> call(AdsCopyEntity adsCopyEntity)async{
    return repository.getAdsCopy(adsCopyEntity);
  }
}