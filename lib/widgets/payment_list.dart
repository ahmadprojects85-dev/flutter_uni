import 'package:flutter/material.dart';
import 'package:daily_activities/models/payment.dart';
import 'package:daily_activities/widgets/payment_tile.dart';

class PaymentList extends StatelessWidget {
  final List<Payment> payments;
  final ValueChanged<Payment> ondelete;

  const PaymentList({
    super.key,
    required this.payments,
    required this.ondelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Payments',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  debugPrint('See all tapped');
                },
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            children: [
              for (final e in payments)
                PaymentTile(
                  payment: e,
                  ondelete: () => ondelete(e),
                ),
            ],
          ),
        ),
      ],
    );
  }
}