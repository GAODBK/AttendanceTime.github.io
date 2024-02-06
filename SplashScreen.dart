import 'package:flutter/material.dart';
import 'index_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool misFirst = false;

  void readCacheData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirst = prefs.getBool("flutter_x_is_first");
    if (isFirst == null || isFirst == false) {
      prefs.setBool("flutter_x_is_first", true);
    } else {
      prefs.setBool("flutter_x_is_first", false);
    }
    misFirst = isFirst!;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const VideoApp())
      );//VideoApp HomePage
    });
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
          children:<Widget>[
            Lottie.asset('assets/Bookkeeping.mp4'),
            const Text("Book keeping", style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.white,
              fontSize: 30)
            ),
          ]
        )
      )
    );
  }

  buildCountdownProgress() {
    if (misFirst) {
      return Positioned( left: 0, right: 0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(child: Image.asset(
             "images/3.jpg", width: 33, height: 33, fit: BoxFit.cover
            )),
            const Text(" Welcome bookkeeping book", style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.white,
              fontSize: 26)
            )
          ]
        )
      );
    }else{
      return Container();
    }
  }
}
