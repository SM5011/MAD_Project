import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';

class BalanceCard extends StatelessWidget {
  final TransactionController transactionController = Get.find();

  @override
  Widget build(BuildContext context) {
    double totalIncome = 0, totalExpense = 0;

    for (var transaction in transactionController.transactions) {
      if (transaction.type == "income") {
        totalIncome += transaction.amount;
      } else {
        totalExpense += transaction.amount;
      }
    }

    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Total Balance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("\$${totalIncome - totalExpense}",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Income: \$${totalIncome}",
                    style: TextStyle(color: Colors.green)),
                Text("Expenses: \$${totalExpense}",
                    style: TextStyle(color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
