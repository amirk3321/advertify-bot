import 'dart:io';

import 'package:advertify_bot/features/ads_copy_generator/presentation/cubit/ads_copy_generator_cubit.dart';
import 'package:advertify_bot/features/app/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'features/ads_copy_generator/presentation/pages/ads_copy_generate_page.dart';
import 'injection_container.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env", mergeWith: {
    'TEST_VAR': '5',
  });

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdsCopyGeneratorCubit>(
          create: (_) => di.sl<AdsCopyGeneratorCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Advertify Bot',

        theme: ThemeData(brightness: Brightness.dark,useMaterial3: true),
        initialRoute: '/',
        routes: {
          "/": (context) {
            return const SplashScreen(
              child: AdsCopyGeneratePage(),
            );
          }
        },
      ),
    );
  }
}
