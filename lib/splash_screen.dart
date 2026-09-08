import 'dart:async';

import 'package:ecomart/home_page.dart';
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())
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
        backgroundColor: Colors.green.shade300,
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