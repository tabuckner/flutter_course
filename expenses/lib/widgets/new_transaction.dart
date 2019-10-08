import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onAddTransaction;

  NewTransaction(this.onAddTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () {
                this.onAddTransaction(
                  this.titleController.text,
                  double.parse(this.amountController.text),
                );
              },
              textColor: Colors.lightBlue,
            )
          ],
        ),
      ),
    );
  }
}
