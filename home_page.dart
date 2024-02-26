import 'package:LYG_JZB/bookkeeping/expanse_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'expense_data.dart';
import 'expense_item.dart';
import 'expense_title.dart';
import '../Calc/PopupItemLauncher.dart';
import '../Calc/CalculatorI_tem.dart';
class Bookkeeping extends StatefulWidget{
  const Bookkeeping({super.key});
  @override
  State<Bookkeeping> createState() => _BookkeepingState();
}

class _BookkeepingState extends State<Bookkeeping> {

  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();
  late ExpenseItem newExpense;
  late CalculatorItem calculatorItem;
  List<Map> keyboard = keyboardList;

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseDate>(context, listen: false).prepareData();
  }

  Expanded dataSheet(ExpenseDate value) {
    return Expanded(child: ListView.builder(
      shrinkWrap: true,
      itemCount: value.getAllExpenseList().length,
      itemBuilder: (context, index) => ExpenseTitle(
        name: value.getAllExpenseList()[index].name,
        amount: value.getAllExpenseList()[index].amount,
        dateTime: value.getAllExpenseList()[index].dateTime,
        deleteTapped: (context) =>
          deleteExpense(value.getAllExpenseList()[index]),
        setTapped: (context) =>
          settingExpense(value.getAllExpenseList()[index]),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<ExpenseDate>(

        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(children: <Widget>[

              ExpanseSummary(startOfWeek: value.startWeekDate()),

              dataSheet(value),
            ]),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton:addExpenseButton(),
          );
        }
      )
    );
  }

  FloatingActionButton addExpenseButton() {
    return FloatingActionButton.extended(
      onPressed: addNewExpense,
      label: const Text('Add Expense'),
      icon: const Icon(Icons.add_chart),
      backgroundColor: Colors.lightGreen[700],
      foregroundColor: Colors.white
    );
  }

  bool decimalPointClicked = false;
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
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: const Text("保存"),
          ),
          MaterialButton(
            onPressed: cancel,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
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

      newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now(),
      );
      clear();
    }else{
      return;
    }
  }
  void cancel() {
    Navigator.pop(context);
  }

  void showDoneDialog() => showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      )
    ),
    builder: (BuildContext context)=>Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Lottie.asset('assets/OK.json',width: 200,
          repeat: false ),//使动画只播放一次而不是循环播放
        FloatingActionButton.extended(
          onPressed:()=>{
            Provider.of<ExpenseDate>(context, listen: false)
              .addNewExpense(newExpense),
            Navigator.pop(context)
          },
          label: const Text('    完成     '),
          heroTag: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          backgroundColor: Colors.green[300],
          foregroundColor: Colors.white
        ),
      ]
    )
  );
  void deleteExpense(ExpenseItem item){
    Provider.of<ExpenseDate>(context, listen: false).deleteExpense(item);
  }
  void clear(){
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  settingExpense(ExpenseItem item){
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )
      ),
      builder: (BuildContext context)=>Column(
        children: [
          Lottie.asset('assets/OK.json', repeat: false)
        ],
      )
    );
  }
}