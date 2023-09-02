

import 'package:advertify_bot/features/ads_copy_generator/data/model/ads_generator_model.dart';
import 'package:advertify_bot/features/ads_copy_generator/data/remote_data_source/ads_copy_generator_remote_data_source.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/entities/ads_copy_entity.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/repositories/ads_copy_generator_repository.dart';

class AdsCopyGeneratorRepositoryImpl implements AdsCopyGeneratorRepository{

  final AdsCopyGeneratorRemoteDataSource remoteDataSource;

  AdsCopyGeneratorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AdsCopyGenerator> getAdsCopy(AdsCopyEntity adsCopyEntity) async =>
      remoteDataSource.getAdsCopy(adsCopyEntity);

}