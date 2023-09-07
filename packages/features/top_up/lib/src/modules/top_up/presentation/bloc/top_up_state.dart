import 'package:top_up/src/modules/top_up/domain/entity/top_up_config.dart';

abstract class TopUpState {}

class TopUpLoadingState extends TopUpState {}

class TopUpIdleState extends TopUpState {
  final TopUpConfig config;

  TopUpIdleState({
    required this.config,
  });
}

class TopUpErrorState extends TopUpState {}
