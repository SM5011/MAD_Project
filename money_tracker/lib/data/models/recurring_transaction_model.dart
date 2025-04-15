class RecurringTransactionModel {
  String id;
  double amount;
  String description;
  String interval;
  DateTime nextDate;

  RecurringTransactionModel({
    required this.id,
    required this.amount,
    required this.description,
    required this.interval,
    required this.nextDate,
  });

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'description': description,
        'interval': interval,
        'nextDate': nextDate.toIso8601String(),
      };

  factory RecurringTransactionModel.fromJson(
          Map<String, dynamic> json, String id) =>
      RecurringTransactionModel(
        id: id,
        amount: (json['amount'] as num).toDouble(),
        description: json['description'],
        interval: json['interval'],
        nextDate: DateTime.parse(json['nextDate']),
      );
}
