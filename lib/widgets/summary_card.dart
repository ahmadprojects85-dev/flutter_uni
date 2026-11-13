import 'package:flutter/material.dart';
import '../models/payment.dart';

class SummaryCard extends StatelessWidget {
  final int total;
  final int count;

  const SummaryCard({
    super.key,
    required this.total,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.secondaryContainer,
      ),
      child: Row(
        children: [
          Icon(
            Icons.bolt,
            size: 40,
            color: colorScheme.onSecondaryContainer,
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Paid',
                style: text.bodyMedium?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              Text(
                formatIqd(total),
                style: text.headlineLarge?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              Text('$count payments'),
            ],
          ),
        ],
      ),
    );
  }
}