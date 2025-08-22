import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(this.registeredExpenses, {super.key});

  final List<Expense> registeredExpenses;

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
        return (ExpenseItem(widget.registeredExpenses[index]));
      },
    );
  }
}
