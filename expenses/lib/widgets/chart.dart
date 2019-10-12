import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        final Transaction transaction = recentTransactions[i];
        final bool dayMatches = transaction.date.day == weekDay.day;
        final bool monthMatches = transaction.date.month == weekDay.month;
        final bool yearMatches = transaction.date.year == weekDay.year;

        if (dayMatches && monthMatches && yearMatches) {
          totalSum += transaction.amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get weeklySpending {
    return groupedTransactionValues.fold(0.0, (aggregator, next) {
      return aggregator + next['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                this.weeklySpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / this.weeklySpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
