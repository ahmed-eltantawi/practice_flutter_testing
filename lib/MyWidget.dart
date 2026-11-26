import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text(subtitle)),
      ),
    );
  }
}
