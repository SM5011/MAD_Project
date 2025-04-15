class BudgetModel {
  String id;
  String category;
  double limit;
  double spent;
  DateTime createdAt;

  BudgetModel({
    required this.id,
    required this.category,
    required this.limit,
    required this.spent,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'category': category,
        'limit': limit,
        'spent': spent,
        'createdAt': createdAt.toIso8601String(),
      };

  factory BudgetModel.fromJson(Map<String, dynamic> json, String id) =>
      BudgetModel(
        id: id,
        category: json['category'],
        limit: (json['limit'] as num).toDouble(),
        spent: (json['spent'] as num).toDouble(),
        createdAt: DateTime.parse(json['createdAt']),
      );
}
