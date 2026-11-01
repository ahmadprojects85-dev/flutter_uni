// A single money payment in GenTrack.
class Payment {
  final String title;
  final int amount; // in Iraqi dinar (IQD)
  final String category;
  final DateTime date;

  Payment({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  @override
  String toString() => '$title ($category): ${formatIqd(amount)}';
}

// Sample data until users can add their own payments.
final List<Payment> samplePayments = [
  Payment(title: 'Ampere fee', amount: 8000,
      category: 'Generator', date: DateTime(2026, 10, 12)),
  Payment(title: 'Mains bill', amount: 1500,
      category: 'Mains', date: DateTime(2026, 10, 12)),
  Payment(title: 'Diesel', amount: 35000,
      category: 'Fuel', date: DateTime(2026, 10, 10)),
  Payment(title: 'Electrician', amount: 12000,
      category: 'Repairs', date: DateTime(2026, 10, 9)),
  Payment(title: 'Ampere fee', amount: 8000,
      category: 'Generator', date: DateTime(2026, 10, 12)),
  Payment(title: 'Mains bill', amount: 1500,
      category: 'Mains', date: DateTime(2026, 10, 12)),
  Payment(title: 'Diesel', amount: 35000,
      category: 'Fuel', date: DateTime(2026, 10, 10)),
  Payment(title: 'Electrician', amount: 12000,
      category: 'Repairs', date: DateTime(2026, 10, 9)),
  Payment(title: 'Ampere fee', amount: 8000,
      category: 'Generator', date: DateTime(2026, 10, 12)),
  Payment(title: 'Mains bill', amount: 1500,
      category: 'Mains', date: DateTime(2026, 10, 12)),
  Payment(title: 'Diesel', amount: 35000,
      category: 'Fuel', date: DateTime(2026, 10, 10)),
  Payment(title: 'Electrician', amount: 12000,
      category: 'Repairs', date: DateTime(2026, 10, 9)),
];
// Adds up the amounts of all payments in the list.
int totalOf(List<Payment> payments) {
  int total = 0;
  for (final e in payments) {
    total += e.amount;
  }
  return total;
}

// 35000 -> 'IQD 35,000'
String formatIqd(int amount) {
  final digits = amount.toString();
  String result = '';
  for (int i = 0; i < digits.length; i++) {
    final left = digits.length - i; // digits still to write
    if (i > 0 && left % 3 == 0) {
      result += ',';
    }
    result += digits[i];
  }
  return 'IQD $result';
}