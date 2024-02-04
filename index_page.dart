import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexPage extends StatefulWidget{
  const IndexPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  bool misFirst = false;

  @override
  void initState() {
    super.initState();
    readCacheData();
  }

  void readCacheData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirst = prefs.getBool("flutter_x_is_first");
    if(isFirst == null || isFirst == false){
      prefs.setBool("flutter_x_is_first", true);
    }else{
      prefs.setBool("flutter_x_is_first", false);
    }
    misFirst = isFirst!;setState(() {});
    // print("读取数据 $isFirst");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: <Widget>[
      buildAWelcomePageBackground(),
      buildCountdownProgressBar(),
      Positioned(bottom: 40,left: 0,right: 0,
        child: Row( mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(child:Image.asset(
              "images/3.jpg", width: 33,height: 33,fit: BoxFit.cover
            )),
            const SizedBox(width: 14),
            const Text("欢迎进入 LYG 的记账本")
          ]
        )
      ),
    ]));
  }

  buildAWelcomePageBackground() {
    if(misFirst){
      return Container();
    } else {
      return Image.asset("images/3.jpg");
    }
  }

  buildCountdownProgressBar() {
    if(misFirst){
      return Positioned(child: Center(
        child: SizedBox(
          child: Stack(children: const <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(child: Padding(padding: EdgeInsets.only(top: 70.0),
              child: Text("Loading...",style: TextStyle(fontSize: 20)
            )))
          ])
        )
      ));
    }else {
      return Container();
    }
  }
}