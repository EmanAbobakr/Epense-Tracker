import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    required this.registeredExpenses,
    required this.onDismiss,
    super.key,
  });

  final List<Expense> registeredExpenses;
  final void Function(Expense expense) onDismiss;

  @override
  State<StatefulWidget> createState() {
    return _ExpensesListState();
  }
}

class _ExpensesListState extends State<ExpensesList> {
  // final List<Expense> _registeredExpenses = [
  //   Expense(
  //     title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //     category: Category.clothes,
  //   ),
  //   Expense(
  //     title: 'Groceries',
  //     amount: 16.53,
  //     date: DateTime.now(),
  //     category: Category.food,
  //   ),
  //   Expense(
  //     title: 'Gym Membership',
  //     amount: 29.99,
  //     date: DateTime.now(),
  //     category: Category.leisure,
  //   ),
  //   Expense(
  //     title: 'Utilities',
  //     amount: 89.99,
  //     date: DateTime.now(),
  //     category: Category.work,
  //   ),
  //   Expense(
  //     title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //     category: Category.clothes,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.registeredExpenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(widget.registeredExpenses[index]),
          onDismissed: (direction) {
            widget.onDismiss(widget.registeredExpenses[index]);
          },
          child: (ExpenseItem(widget.registeredExpenses[index])),
        );
      },
    );
  }
}
