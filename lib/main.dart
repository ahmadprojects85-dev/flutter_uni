import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'models/payment.dart';

void main() {
  // Printed in the Debug Console when the app starts.
  for (final e in samplePayments) {
    print(e);
  }
  print('Total: ${formatIqd(totalOf(samplePayments))}');
  runApp(const GenTrackApp());
}

class GenTrackApp extends StatelessWidget {
  const GenTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    final total = totalOf(samplePayments);
    return MaterialApp(
      title: 'GenTrack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: HomeScreen(),
    );
  }
}