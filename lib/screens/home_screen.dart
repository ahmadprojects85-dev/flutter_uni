import 'package:flutter/material.dart';
import 'package:daily_activities/models/payment.dart';
import 'package:daily_activities/widgets/payment_tile.dart';
import 'package:daily_activities/widgets/summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenTrack'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              print('Settings Tapped');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummaryCard(total: totalOf(samplePayments), count: samplePayments.length),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Payments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => print('See all tapped'),
                  child: const Text('See all'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (final e in samplePayments)
                  PaymentTile(payment: e),
              ],
            ),
          ),
        ],
      ),
    );
  }
}