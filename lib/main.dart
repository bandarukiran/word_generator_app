import 'package:flutter/material.dart';
import './appColors.dart';
import './word_generator.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: AppColors.primary,
          accentColor: AppColors.textPrimary,
          backgroundColor: AppColors.background,
          scaffoldBackgroundColor: AppColors.background,
      ),
      home: WordGenerator(title: 'Words Listing'),
    );
  }
}


