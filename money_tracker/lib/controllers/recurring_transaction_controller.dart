import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/recurring_transaction_model.dart';

class RecurringTransactionController extends GetxController {
  var recurringTransactions = <RecurringTransactionModel>[].obs;

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final intervalController = TextEditingController();

  final _db = FirebaseFirestore.instance.collection('recurring_transactions');

  @override
  void onInit() {
    super.onInit();
    loadRecurringTransactions();
  }

  void loadRecurringTransactions() async {
    final snapshot = await _db.get();
    recurringTransactions.assignAll(snapshot.docs
        .map((doc) => RecurringTransactionModel.fromJson(doc.data(), doc.id))
        .toList());
  }

  void addRecurringTransaction() async {
    double amount = double.tryParse(amountController.text) ?? 0;
    var rt = RecurringTransactionModel(
      id: '',
      amount: amount,
      description: descriptionController.text,
      interval: intervalController.text,
      nextDate: DateTime.now().add(Duration(days: 30)),
    );
    final docRef = await _db.add(rt.toJson());
    rt.id = docRef.id;
    recurringTransactions.add(rt);
  }

  void deleteRecurringTransaction(String id) async {
    await _db.doc(id).delete();
    recurringTransactions.removeWhere((t) => t.id == id);
  }
}
