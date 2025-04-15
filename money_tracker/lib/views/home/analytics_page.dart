import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import '../../controllers/transaction_controller.dart';

class AnalyticsPage extends StatelessWidget {
  final TransactionController transactionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Analytics")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Spending Distribution",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(child: PieChart(_buildPieChartData())),
          ],
        ),
      ),
    );
  }

  PieChartData _buildPieChartData() {
    final transactions = transactionController.transactions;
    final categoryTotals = <String, double>{};

    for (var transaction in transactions) {
      if (transaction.type == "expense") {
        categoryTotals[transaction.category] =
            (categoryTotals[transaction.category] ?? 0) + transaction.amount;
      }
    }

    return PieChartData(
      sections: categoryTotals.entries.map((entry) {
        return PieChartSectionData(
          title: entry.key,
          value: entry.value,
          color: Colors.primaries[
              categoryTotals.keys.toList().indexOf(entry.key) %
                  Colors.primaries.length],
          radius: 80,
        );
      }).toList(),
    );
  }
}
