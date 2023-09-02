


import 'package:advertify_bot/features/ads_copy_generator/ads_copy_generator_injection_container.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {


  final http.Client httpClient = http.Client();


  sl.registerLazySingleton<http.Client>(() => httpClient);

  await adsCopyGeneratorInjectionContainer();

}