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

  void _removeExpense(int expenseIndex) {
    final reomvedExpense = registeredExpenses[expenseIndex];
    setState(() {
      registeredExpenses.remove(registeredExpenses[expenseIndex]);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpenses.insert(expenseIndex, reomvedExpense);
            });
          },
        ),
      ),
    );
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
              child: registeredExpenses.isEmpty
                  ? Center(child: Text('No expenses found. Start adding some!'))
                  : ExpensesList(
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
