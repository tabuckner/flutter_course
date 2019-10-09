import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
