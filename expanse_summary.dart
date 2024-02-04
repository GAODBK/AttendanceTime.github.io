import 'package:LYG_JZB/bar_graph.dart';
import 'package:LYG_JZB/date_time_helper.dart';
import 'package:LYG_JZB/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpanseSummary extends StatelessWidget {

  final DateTime startOfWeek;

  const ExpanseSummary({
    super.key,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    String sunday=convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday=convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday=convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday=convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday=convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday=convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday=convertDateTimeToString(startOfWeek.add( const Duration(days: 6)));


    return Consumer<ExpenseDate>(
      builder: (context,value,child) => Column(children:[
        // 这里修改Weekly Total的Padding
        Padding(padding: const EdgeInsets.only(top: 33,left: 20,bottom: 5),
          child: Row(children: [
            const Text("周开销: ",style: TextStyle(fontSize: 24)),
            Text("${calculateTotal(value, sunday, monday, tuesday, wednesday,
              thursday, friday, saturday)} 元",style: const TextStyle(fontSize: 24))
          ])
        ),
        SizedBox(
          height: 240,
          child: MyBarGraph(
            maxY: getMaxValue(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),//getMaxValue(),
            sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
            monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
            tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
            wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
            thuAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
            friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
            satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
          )
        )
      ]),
    );
  }

  double getMaxValue(
      ExpenseDate value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday
      ) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    values.sort();
    return values.last * 1.1 == 0 ? 100 : values.last *1.1;
  }

  String calculateTotal(
      ExpenseDate value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday ) {

    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    double total = 0;
    for(int i=0;i<values.length;i++){
      total+=values[i];
    }
    return total.toStringAsFixed(2);
  }
}