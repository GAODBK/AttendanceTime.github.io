import 'package:LYG_JZB/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  bool misFirst = false;

  void readCacheData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirst = prefs.getBool("flutter_x_is_first");
    if(isFirst == null || isFirst == false){
      prefs.setBool("flutter_x_is_first", true);
    }else{
      prefs.setBool("flutter_x_is_first", false);
    }
    misFirst = isFirst!;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.edit, color: Colors.white, size: 120),
            buildCountdownProgress(),
            theCoverLogo()
          ]
        )
      )
    );
  }

  buildCountdownProgress() {
    if(misFirst){
      return Positioned(left: 0,right: 0,
        child: Row( mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(child:Image.asset(
              "images/3.jpg", width: 33,height: 33,fit: BoxFit.cover
            )),
            const Text(" 欢迎进入 LYG 的记账本", style: TextStyle(
                fontSize: 15, color: Colors.white))
          ]
        )
      );
    } else {
      return Container();
    }
  }

  theCoverLogo() {
    if(misFirst){
      return Container();
    }else{
      return const Text("Book keeping", style: TextStyle(
        fontStyle: FontStyle.italic, color: Colors.white, fontSize: 30));
    }
  }
}