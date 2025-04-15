import 'package:flutter/material.dart';
import '../data/models/budget_model.dart';

class BudgetCard extends StatelessWidget {
  final BudgetModel budget;

  BudgetCard({required this.budget});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(budget.category,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Limit: \$${budget.limit} - Spent: \$${budget.spent}"),
        trailing: budget.spent > budget.limit
            ? Icon(Icons.warning, color: Colors.red)
            : Icon(Icons.check, color: Colors.green),
      ),
    );
  }
}
