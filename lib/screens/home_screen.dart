import 'package:flutter/material.dart';
import 'package:daily_activities/models/payment.dart';
import 'package:daily_activities/widgets/payment_tile.dart';
import 'package:daily_activities/widgets/category_chips.dart';
import 'package:daily_activities/widgets/payment_list.dart';
import 'package:daily_activities/widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Payment> _payments = [...samplePayments];

  String _category = 'All';

  @override
  void initState() {
    super.initState();
  }

  void _selectCategory(String category) {
    setState(() {
      _category = category;
    });
  }

  void _addPayment() {
    setState(() {
      _payments.insert(
        0,
        Payment(
          title: 'fuze',
          amount: 2000,
          category: 'generator',
          date: DateTime.now(),
        ),
      );
    });
  }

  void _deletepayment(Payment payment) {
    setState(() {
      _payments.remove(payment);
    });
  }

  List<Payment> _filtered() {
    if (_category == 'All') return _payments;

    final result = <Payment>[];

    for (final e in _payments) {
      if (e.category == _category) result.add(e);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final visible = _filtered();

    final chips = CategoryChips(
      selected: _category,
      onSelected: _selectCategory,
    );

    final card = SummaryCard(
      total: totalOf(visible),
      count: visible.length,
    );

    final list = PaymentList(
      payments: visible,
      ondelete: _deletepayment,
    );

    debugPrint(MediaQuery.of(context).size.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gen Track'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 151, 139, 5),
        foregroundColor: const Color.fromARGB(255, 137, 53, 53),
        actions: [
          IconButton(
            onPressed: () {
              print('Settings Tapped');
              debugPrint('Settings tapped');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          debugPrint(constraints.maxWidth.toString());

          if (constraints.maxWidth < 900) {
            return Column(
              children: [
                card,
                chips,
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
                Expanded(
                  child: list,
                ),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 360,
                child: Column(
                  children: [card, chips],
                ),
              ),
              Expanded(child: list),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addPayment,
        child: const Icon(Icons.add),
      ),
    );
  }
}