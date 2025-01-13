import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // UI Debugging
  /// log Widgets rebulds
  debugPrintRebuildDirtyWidgets = true;

  /// debug Widgets by painting a box around its bounds
  debugPaintSizeEnabled = true;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
