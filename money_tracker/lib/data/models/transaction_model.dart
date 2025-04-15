class TransactionModel {
  String id;
  String type;
  String category;
  double amount;
  DateTime date;
  String description;

  TransactionModel({
    required this.id,
    required this.type,
    required this.category,
    required this.amount,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'category': category,
        'amount': amount,
        'date': date.toIso8601String(),
        'description': description,
      };

  factory TransactionModel.fromJson(Map<String, dynamic> json, String id) =>
      TransactionModel(
        id: id,
        type: json['type'],
        category: json['category'],
        amount: (json['amount'] as num).toDouble(),
        date: DateTime.parse(json['date']),
        description: json['description'],
      );
}
