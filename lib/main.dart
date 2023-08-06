import 'package:flutter/material.dart';
import 'package:reatividade_value_notifier_state_pattern/my_page.dart';
import 'package:reatividade_value_notifier_state_pattern/value_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyPage(
        controller: NameController(),
      ),
    );
  }
}
