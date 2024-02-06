import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_page.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp>
  with SingleTickerProviderStateMixin {

  void onONEPressed() => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const HomePage()));

  @override
  Widget build(BuildContext context)=>Scaffold(
    body: Container( width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/NB_lottie.json'),
          const SizedBox(height: 120),
          MaterialButton(
            onPressed: onONEPressed,//showDoneDialog
            child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                ClipOval(child: Image.asset(
                  "assets/3.jpg", width: 33, height: 33, fit: BoxFit.cover
                )),
                const Text(" Let's go",style: TextStyle(
                  fontStyle: FontStyle.italic,fontSize: 27
                )),
                const Icon(Icons.chevron_right_outlined, size: 30)
              ]
            ),
          ),
        ]
      ),
    ),
  );
}