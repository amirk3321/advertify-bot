import 'dart:io';

import 'package:advertify_bot/core/custom_exceptions.dart';
import 'package:advertify_bot/features/ads_copy_generator/data/model/ads_copy_generator_data.dart';
import 'package:advertify_bot/features/ads_copy_generator/data/model/ads_generator_model.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/entities/ads_copy_entity.dart';
import 'package:advertify_bot/features/ads_copy_generator/domain/usecases/ads_copy_generator_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'ads_copy_generator_state.dart';

class AdsCopyGeneratorCubit extends Cubit<AdsCopyGeneratorState> {
  final AdsCopyGeneratorUseCase adsCopyGeneratorUseCase;
  AdsCopyGeneratorCubit({required this.adsCopyGeneratorUseCase}) : super(AdsCopyGeneratorInitial());


  Future<void> getAdsCopy({required AdsCopyEntity adsCopyEntity}) async {
    emit(AdsCopyGeneratorLoading());
    try {
      final textCompletionModelData = await adsCopyGeneratorUseCase.call(adsCopyEntity);
      emit(AdsCopyGeneratorLoaded(adsCopyGenerator: textCompletionModelData));
    } on SocketException catch (e) {
      emit(AdsCopyGeneratorFailure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(AdsCopyGeneratorFailure(errorMsg: e.message));
    }
  }
}
