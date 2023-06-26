import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseDI.initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getThemeData(),
      home: const HomeScreen(),
    );
  }
}
