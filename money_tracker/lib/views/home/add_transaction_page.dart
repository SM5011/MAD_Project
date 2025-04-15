import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/controllers/transaction_controller.dart';

class AddTransactionPage extends StatelessWidget {
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Transaction")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: transactionController.amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Amount")),
            TextField(
                controller: transactionController.descriptionController,
                decoration: InputDecoration(labelText: "Description")),
            DropdownButton<String>(
              value: transactionController.selectedCategory.value,
              items: transactionController.categories.map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) =>
                  transactionController.selectedCategory.value = value!,
            ),
            ElevatedButton(
                onPressed: transactionController.addTransaction,
                child: Text("Add")),
          ],
        ),
      ),
    );
  }
}
