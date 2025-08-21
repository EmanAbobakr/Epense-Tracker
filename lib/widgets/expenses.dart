import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [Icon(Icons.add)],
      ),
      body: Center(
        child: const Column(
          children: [
            Text("Expenses"),
            Expanded(child: ExpensesList()),
          ],
        ),
      ),
    );
  }
}
