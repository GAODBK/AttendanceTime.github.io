import 'package:LYG_JZB/bookkeeping/hive_database.dart';
import 'package:LYG_JZB/bookkeeping/home_page.dart';
import 'package:flutter/material.dart';
import 'date_time_helper.dart';
import 'expense_item.dart';

class ExpenseDate extends ChangeNotifier {
  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  final db=HiveDatabase();
  void prepareData() {
    if(db.readData().isNotEmpty){
      overallExpenseList = db.readData();
    }
  }

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }

  void setExpense(ExpenseItem expense) {
    //print("delete: ${expense.name}, ${expense.amount}, ${expense.dateTime}");

    notifyListeners();
    db.saveData(overallExpenseList);
  }

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:return "Monday";
      case 2:return "Tuesday";
      case 3:return "Wednesday";
      case 4:return "Thursday";
      case 5:return "Friday";
      case 6:return "Saturday";
      case 7:return "Sunday";
      default:return "";
    }
  }

  DateTime startWeekDate() {
    DateTime? startOfWeek;

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == "Sunday") {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
                        // 每日费用汇总表
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;

        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}