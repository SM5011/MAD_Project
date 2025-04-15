import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/budget_model.dart';

class BudgetController extends GetxController {
  var budgets = <BudgetModel>[].obs;

  final amountController = TextEditingController();
  final categoryController = TextEditingController();

  final _db = FirebaseFirestore.instance.collection('budgets');

  @override
  void onInit() {
    super.onInit();
    loadBudgets();
  }

  void loadBudgets() async {
    final snapshot = await _db.get();
    budgets.assignAll(snapshot.docs
        .map((doc) => BudgetModel.fromJson(doc.data(), doc.id))
        .toList());
  }

  void addBudget() async {
    double limit = double.tryParse(amountController.text) ?? 0;
    var budget = BudgetModel(
      id: '',
      category: categoryController.text,
      limit: limit,
      spent: 0.0, // Assuming the user hasn't spent anything yet
      createdAt: DateTime.now(),
    );
    final docRef = await _db.add(budget.toJson());
    budget.id = docRef.id;
    budgets.add(budget);
  }

  void deleteBudget(String id) async {
    await _db.doc(id).delete();
    budgets.removeWhere((b) => b.id == id);
  }
}
