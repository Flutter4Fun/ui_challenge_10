import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Jakarta',
        scaffoldBackgroundColor: AppColors.bgColor,
        brightness: Brightness.dark,
      ),
    );
  }
}
