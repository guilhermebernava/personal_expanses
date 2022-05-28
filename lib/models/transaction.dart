class Transaction {
  final int id;
  final String title;
  final double amout;
  final DateTime date;

  Transaction({
    this.id = 0,
    required this.title,
    required this.amout,
    required this.date,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      title: map['title'],
      amout: map['amout'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amout,
      'date': date,
    };
  }
}
