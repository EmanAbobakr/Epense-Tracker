import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpenses = [];

  void _saveSubmitedExpenseData(Expense newExpense) {
    setState(() {
      registeredExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove(expense);
    });
  }

  void _onAddExpenseClicked() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _saveSubmitedExpenseData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _onAddExpenseClicked, icon: Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Expenses"),
            Expanded(
              child: ExpensesList(
                registeredExpenses: registeredExpenses,
                onDismiss: _removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
