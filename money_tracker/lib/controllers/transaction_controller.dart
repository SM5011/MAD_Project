import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/transaction_model.dart';

class TransactionController extends GetxController {
  var transactions = <TransactionModel>[].obs;

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedCategory = "Food".obs;
  final categories =
      ["Food", "Travel", "Bills", "Salary", "Shopping", "Other"].obs;

  final _db = FirebaseFirestore.instance.collection('transactions');

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() async {
    final snapshot = await _db.get();
    transactions.assignAll(snapshot.docs
        .map((doc) => TransactionModel.fromJson(doc.data(), doc.id))
        .toList());
  }

  void addTransaction() async {
    double amount = double.tryParse(amountController.text) ?? 0;
    var transaction = TransactionModel(
      id: '',
      type: 'expense',
      category: selectedCategory.value,
      amount: amount,
      date: DateTime.now(),
      description: descriptionController.text,
    );
    final docRef = await _db.add(transaction.toJson());
    transaction.id = docRef.id;
    transactions.add(transaction);
  }

  void deleteTransaction(String id) async {
    await _db.doc(id).delete();
    transactions.removeWhere((t) => t.id == id);
  }
}
