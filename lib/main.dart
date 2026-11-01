import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const Homescreen(),
    );
  }
}