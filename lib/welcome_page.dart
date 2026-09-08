import 'package:ecomart/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:ecomart/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome to Ecomart!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Shop sustainably, save earth",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/welcome.png")
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: <Widget>[
                      MaterialButton(
                        minWidth: double.infinity,
                          height: 60,
                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text(
                          "Login",
                           style: TextStyle(
                             fontWeight: FontWeight.w600,
                             fontSize: 18
                           ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                        },
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text(
                          "Sign-up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
          ),
       ),
    );
  }
}