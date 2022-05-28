class Transaction {
  final int id;
  final String title;
  final double amount;
  final String date;

  Transaction({
    this.id = 0,
    required this.title,
    required this.amount,
    required this.date,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'date': date,
    };
  }
}
