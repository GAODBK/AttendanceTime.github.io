import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ExpenseTitle extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  final void Function(BuildContext context) deleteTapped;
  final void Function(BuildContext context) setTapped;

  const ExpenseTitle({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.deleteTapped,
    required this.setTapped
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(8.0),
            ),
            SlidableAction(
              onPressed: setTapped,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit_note,
              label: 'Settings',
              borderRadius: BorderRadius.circular(8.0),
            )
          ]
        ),
        child: Padding(padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreen[200]!),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              title: Text('$name 花费 $amount'),
              subtitle: Text(DateFormat('yy/MM/dd HH:mm', 'en_US')
               .format(dateTime.toUtc().add(const Duration(hours: 8)))),
              trailing: const Icon(Icons.chevron_right),
            )
          )
        )
        /*这里只替换上方的Padding，用于更换程序的 数据框
        child: Card( elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0),
            ),*/
      )
    );
  }
}