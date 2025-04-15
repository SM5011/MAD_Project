import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/controllers/transaction_controller.dart';
import 'package:money_tracker/widgets/balance_card.dart';
import 'package:money_tracker/widgets/transaction_card.dart';

class HomeScreen extends StatelessWidget {
  // ✅ Now Get.find() will work because the controller is initialized in main.dart
  final TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade700, Colors.purple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          BalanceCard(),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: 2)
                ],
              ),
              child: Obx(() {
                if (transactionController.transactions.isEmpty) {
                  return Center(
                      child: Text("No Transactions Yet!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)));
                }

                return ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  itemCount: transactionController.transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionCard(
                        transaction: transactionController.transactions[index]);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
