import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/payment.dart';
import 'package:flutter_application_1/widget/payment_tile.dart';
import 'package:flutter_application_1/widget/summary_card.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenTrack'),
        centerTitle: true,
        backgroundColor: Colors.purple,
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
          SummaryCard(total: totalOf(samplePayments)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Recent Payments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Expanded(child: ListView(children: [

          for (final e in samplePayments)
            PaymentTile(payment: e)

          ],))
        ],
      ),
    );
  }
}