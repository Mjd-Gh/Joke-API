import 'package:flutter/material.dart';
import 'package:jokes_api/widgets/main_widget.dart';

String joke = '';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainWidget(),
    );
  }
}
