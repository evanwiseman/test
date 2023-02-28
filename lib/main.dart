import 'package:flutter/material.dart';
import 'package:test/theme.dart';
import 'package:test/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      title: 'Test',
      home: HomeScreen(),
    );
  }
}
