import 'package:bloc_test/bloc_test.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/shared/di/injection.module.dart';
import 'package:top_up/src/modules/top_up/domain/entity/top_up_config.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_bloc.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_state.dart';
import 'package:top_up/src/modules/top_up/presentation/screen/top_up_screen.dart';

void main() {
  late TopUpBloc bloc;
  setUp(() async {
    TopUpPackageModule().init(GetItHelper(GetIt.instance, Environment.test));
    bloc = locator();
  });

  testWidgets(
      'Given TopUpLoadingState When render TopUpScreen Then show loading',
      (tester) async {
    whenListen<TopUpState>(
      bloc,
      Stream.fromIterable([]),
      initialState: TopUpLoadingState(),
    );
    await pumpWidget(tester);
    await tester.pump();

    expect(find.text("Loading"), findsOneWidget);
  });

  testWidgets('Given TopUpErrorState When render TopUpScreen Then show error',
      (tester) async {
    whenListen<TopUpState>(
      bloc,
      Stream.fromIterable([]),
      initialState: TopUpErrorState(),
    );
    await pumpWidget(tester);
    await tester.pumpAndSettle();

    expect(find.text("Error"), findsOneWidget);
  });

  testWidgets('Given TopUpIdleState When render TopUpScreen Then show idle',
      (tester) async {
    whenListen<TopUpState>(
      bloc,
      Stream.fromIterable([]),
      initialState: TopUpIdleState(config: topUpConfig),
    );
    await pumpWidget(tester);
    await tester.pumpAndSettle();

    expect(find.text("Idle"), findsOneWidget);
  });

  tearDown(() {
    locator.reset();
  });
}

Future<void> pumpWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: const TopUpScreen(),
    ),
  );
}

const topUpConfig = TopUpConfig(
  topUpSuggestions: [],
  minTopUpAmount: 10,
  maxTopUpAmount: 100,
);
