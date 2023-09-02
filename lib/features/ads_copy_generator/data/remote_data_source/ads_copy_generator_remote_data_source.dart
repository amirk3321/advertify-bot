
import 'package:advertify_bot/features/ads_copy_generator/data/model/ads_generator_model.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/entities/ads_copy_entity.dart';

abstract class AdsCopyGeneratorRemoteDataSource {


  Future<AdsCopyGenerator> getAdsCopy(AdsCopyEntity adsCopyEntity);
}