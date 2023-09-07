import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:injectable_poc/src/di/injection.dart';
import 'package:top_up/top_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(env: Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Injectable Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (_) {
          return const TopUpScreen();
        },
      },
      initialRoute: "/",
    );
  }
}
