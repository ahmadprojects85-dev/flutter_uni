import 'package:flutter/material.dart';
import '../models/payment.dart';


class PaymentTile extends StatelessWidget {
  final Payment payment;

  const PaymentTile({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(iconFor(payment.category)),
      ),
      title: Text(payment.title),
      subtitle: Text(payment.category),
      trailing: Text(
        formatIqd(payment.amount),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

IconData iconFor(String category){
  switch(category){
    case 'Generator':
      return Icons.power;
    case 'Mains':
      return Icons.electrical_services;
    case 'Fuel':
      return Icons.local_gas_station;
    case 'Repairs':
      return Icons.build;
      default:
        return Icons.payment;
  }
}