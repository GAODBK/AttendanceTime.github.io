import 'package:LYG_JZB/expense_data.dart';
import 'package:LYG_JZB/index_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'SplashScreen.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent, // 状态栏颜色
    statusBarIconBrightness: Brightness.dark, // 状态栏图标颜色
  ));
  await Hive.initFlutter();
  await Hive.openBox("expense_database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ExpenseDate(),
      builder: (context,child)=>const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: VideoApp()//,SplashScreen()
      )
    );
  }
}
