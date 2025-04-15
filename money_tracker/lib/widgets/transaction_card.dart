import 'package:flutter/material.dart';
import '../data/models/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              transaction.type == "income" ? Colors.green : Colors.red,
          child: Icon(
              transaction.type == "income"
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              color: Colors.white),
        ),
        title: Text(transaction.category,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(transaction.description),
        trailing: Text("\$${transaction.amount}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
