import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
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
    _controller = VideoPlayerController.networkUrl(Uri.parse(
// 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
'https://cdnl.iconscout.com/lottie/premium/thumb/financial-statement-5403831-4510589.mp4'
    ))..initialize().then((_) { setState(() {}); });
    /*_controller = VideoPlayerController.file(
      File('assets/Bookkeeping.mp4')
    )..initialize().then((_) { setState(() {}); });*/
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
        child: Scaffold(
          body: Center(
            child: _controller.value.isInitialized ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ) : Container(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () { setState(() {
              _controller.setPlaybackSpeed(_controller.value.isPlaying ?  0.0 : 4.0);
              _controller.value.isPlaying
              ? _controller.pause() : _controller.play();
            }); },
            child: const Icon(Icons.play_arrow
// _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            )
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          backgroundColor: Colors.lightGreen[200]!,
          //)//Color(!),
        )
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}