import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: colorfulTheme,
      home: const Home(),
    );
  }
}
