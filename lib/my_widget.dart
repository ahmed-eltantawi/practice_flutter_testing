import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  final String title;
  final String subtitle;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key('MyWidget'),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Column(children: [Text(subtitle), Text(subtitle), ?icon]),
        ),
      ),
    );
  }
}
