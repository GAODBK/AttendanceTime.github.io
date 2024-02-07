import 'package:LYG_JZB/expanse_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'expense_data.dart';
import 'expense_item.dart';
import 'expense_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseDate>(context, listen: false).prepareData();
  }

  void addNewExpense() {
    showDialog(context: context,
      builder: (context)=>AlertDialog(
        title: const Text("添加新的消费"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
              decoration: const InputDecoration(labelText: "消费名目"),
            ),
            TextField(
              controller: newExpenseAmountController,
              decoration: const InputDecoration(labelText: "消费价格"),
              keyboardType: TextInputType.number
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
            child: const Text("保存"),
          ),
          MaterialButton(
            onPressed: cancel,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
            child:const Text("取消"),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        )
      )
    );
  }

  void save() {
    if(newExpenseNameController.text.isNotEmpty
        && newExpenseAmountController.text.isNotEmpty){
      Navigator.pop(context);
      showDoneDialog();
      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now(),
      );
      Provider.of<ExpenseDate>(context, listen: false)
        .addNewExpense(newExpense);
    }else{
      return;
    }
  }

  void showDoneDialog() => showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context)=>Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/OK.json',width: 200),
        FilledButton(
          onPressed: ()=>{Navigator.pop(context)},
          child: const Text("完成")
        )
      ]
    )
  );

  void cancel() {
    Navigator.pop(context);
  }

  void clear(){
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  void deleteExpense(ExpenseItem item){
    Provider.of<ExpenseDate>(context, listen: false).deleteExpense(item);
  }

  void SettingExpense(ExpenseItem item){
    // Provider.of<ExpenseDate>(context, listen: false).Setting(item);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDate>(
      builder: (context, Value, child) => Scaffold(
        // 这是程序的背景颜色
        backgroundColor: Colors.grey[50],
        floatingActionButton:Padding(
          padding: const EdgeInsets.only(bottom:20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
              onPressed: addNewExpense,
              label: const Text('Add Expense'),
              icon: const Icon(Icons.add_chart),
              heroTag: BorderRadius.circular(12.0),
              backgroundColor: Colors.lightGreen[700],
              foregroundColor: Colors.white,
              elevation: 6.0,
              highlightElevation: 12.0,
              disabledElevation: 0.0,
            )
          ),
        ),
        body: Column(children: [
          Padding(padding: const EdgeInsets.all(4),//这是整个 数据图 的边框 padding
            child: ExpanseSummary(startOfWeek: Value.startWeekDate())
          ),
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: Value.getAllExpenseList().length,
            itemBuilder: (context, index) => ExpenseTitle(
              name: Value.getAllExpenseList()[index].name,
              amount: Value.getAllExpenseList()[index].amount,
              dateTime: Value.getAllExpenseList()[index].dateTime,
              deleteTapped: (context) =>
                deleteExpense(Value.getAllExpenseList()[index]),
              setTapped: (context) =>
                SettingExpense(Value.getAllExpenseList()[index]),
              )
            )
          )
        ])
      )
    );
  }
}