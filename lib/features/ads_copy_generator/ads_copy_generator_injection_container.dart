



import 'package:advertify_bot/features/ads_copy_generator/data/remote_data_source/ads_copy_generator_remote_data_source.dart';
import 'package:advertify_bot/features/ads_copy_generator/data/remote_data_source/ads_copy_generator_remote_data_source_impl.dart';
import 'package:advertify_bot/features/ads_copy_generator/data/repositories/ads_copy_generator_repository_impl.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/repositories/ads_copy_generator_repository.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/usecases/ads_copy_generator_usecase.dart';
import 'package:advertify_bot/features/ads_copy_generator/presentation/cubit/ads_copy_generator_cubit.dart';
import 'package:advertify_bot/injection_container.dart';

Future<void> adsCopyGeneratorInjectionContainer() async{

  //Futures bloc
  sl.registerFactory<AdsCopyGeneratorCubit>(
        () => AdsCopyGeneratorCubit(
      adsCopyGeneratorUseCase: sl.call(),
    ),
  );

  //UseCase
  sl.registerLazySingleton<AdsCopyGeneratorUseCase>(() => AdsCopyGeneratorUseCase(
    repository: sl.call(),
  ));
  //repository
  sl.registerLazySingleton<AdsCopyGeneratorRepository>(
          () => AdsCopyGeneratorRepositoryImpl(
        remoteDataSource: sl.call(),
      ));
  //remote data
  sl.registerLazySingleton<AdsCopyGeneratorRemoteDataSource>(
          () => AdsCopyGeneratorRemoteDataSourceImpl(
        httpClient: sl.call(),
      ));
}