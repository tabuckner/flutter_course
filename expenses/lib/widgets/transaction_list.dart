import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.6,
      child: this.transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      height: constraints.maxHeight * .6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  elevation: 6,
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.all(4),
                      child: FittedBox(
                        child: CircleAvatar(
                          radius: 30,
                          child: Text('\$${this.transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      this.transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(this.transactions[index].date),
                    ),
                    trailing: mediaQuery.size.width > 460
                        ? FlatButton.icon(
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            onPressed: () => this
                                .deleteTransaction(this.transactions[index].id),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => this
                                .deleteTransaction(this.transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
