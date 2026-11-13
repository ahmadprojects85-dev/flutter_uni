import 'package:flutter/material.dart';
import 'package:daily_activities/screens/home_screen.dart';
import 'package:daily_activities/theme/app_theme.dart';
import 'models/payment.dart';

void main() {
  runApp(const GenTrackApp());
}

class GenTrackApp extends StatelessWidget {
  const GenTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GenTrack',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}