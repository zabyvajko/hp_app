import 'package:flutter/material.dart';
import 'package:hp_app/router/router.dart';
import 'package:hp_app/theme/theme.dart';

class HpApp extends StatelessWidget {
  const HpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry Potter',
      theme: darkTheme,
      routes: routes,
    );
  }
}
