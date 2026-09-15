import 'dart:async';
import 'package:ecomart/main_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState(){
    super.initState();
    _timer = Timer(Duration(seconds: 10), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage())
      );
    });
  }

  @override
  void dispose(){
    super.dispose();

    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.green.shade50,
        body: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 280,
              height: 280,
            )
        )
    );
  }
}