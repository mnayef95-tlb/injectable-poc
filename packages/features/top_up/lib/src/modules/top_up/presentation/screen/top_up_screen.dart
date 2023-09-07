import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_bloc.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_event.dart';
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_state.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  late TopUpBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = locator();
    _bloc.add(TopUpInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopUpBloc, TopUpState>(
      bloc: _bloc,
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      listener: _listener,
      builder: _builder,
    );
  }

  bool _buildWhen(TopUpState previous, TopUpState current) {
    return current is TopUpLoadingState ||
        current is TopUpIdleState ||
        current is TopUpErrorState;
  }

  bool _listenWhen(TopUpState previous, TopUpState current) {
    return false;
  }

  Future<void> _listener(BuildContext context, TopUpState state) async {}

  Widget _builder(BuildContext context, TopUpState state) {
    final Widget body;
    if (state is TopUpIdleState) {
      body = Text("Idle", style: Theme.of(context).textTheme.headlineLarge);
    } else if (state is TopUpErrorState) {
      body = Text("Error", style: Theme.of(context).textTheme.headlineLarge);
    } else {
      body = Text("Loading", style: Theme.of(context).textTheme.headlineLarge);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top up"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Center(child: body),
      ),
    );
  }
}
