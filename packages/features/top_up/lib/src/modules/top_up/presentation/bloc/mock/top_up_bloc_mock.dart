import 'package:di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_bloc.dart';

@testEnvironment
@Singleton(as: TopUpBloc)
class MockTopUpBloc with Mock implements TopUpBloc {}
