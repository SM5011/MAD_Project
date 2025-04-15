import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/budget_controller.dart';
import '../../controllers/transaction_controller.dart';
import '../../widgets/budget_card.dart';
import '../../widgets/transaction_card.dart';

class TrackPage extends StatelessWidget {
  final BudgetController budgetController = Get.put(BudgetController());
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Track Finances")),
      body: Column(
        children: [
          Text("Budgets",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: budgetController.budgets.length,
                itemBuilder: (context, index) {
                  return BudgetCard(budget: budgetController.budgets[index]);
                },
              );
            }),
          ),
          Text("Recent Transactions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: transactionController.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(
                      transaction: transactionController.transactions[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
