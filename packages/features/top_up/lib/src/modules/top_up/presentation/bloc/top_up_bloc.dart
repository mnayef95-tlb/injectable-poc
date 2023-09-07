import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/domain/usecase/get_top_up_config_usecase.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_event.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_state.dart';

@prodEnvironment
@injectable
class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  final GetTopUpConfigUsecase _getTopUpConfigUsecase;

  TopUpBloc(
    this._getTopUpConfigUsecase,
  ) : super(TopUpLoadingState()) {
    on<TopUpInitEvent>(_onInit);
  }

  Future<void> _onInit(TopUpInitEvent event, Emitter<TopUpState> emit) async {
    try {
      emit(TopUpIdleState(config: await _getTopUpConfigUsecase()));
    } catch (e) {
      emit(TopUpErrorState());
    }
  }
}
