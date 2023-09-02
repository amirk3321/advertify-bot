part of 'ads_copy_generator_cubit.dart';

abstract class AdsCopyGeneratorState extends Equatable {
  const AdsCopyGeneratorState();
}

class AdsCopyGeneratorInitial extends AdsCopyGeneratorState {
  @override
  List<Object> get props => [];
}

class AdsCopyGeneratorLoading extends AdsCopyGeneratorState {
  @override
  List<Object> get props => [];
}
class AdsCopyGeneratorLoaded extends AdsCopyGeneratorState {
  final AdsCopyGenerator adsCopyGenerator;

  const AdsCopyGeneratorLoaded({required this.adsCopyGenerator});
  @override
  List<Object> get props => [];
}

class AdsCopyGeneratorFailure extends AdsCopyGeneratorState {
  final String? errorMsg;

  AdsCopyGeneratorFailure({this.errorMsg});
  @override
  List<Object> get props => [];
}