import 'package:flutter/material.dart';
import 'package:quickwash/Homepages/bottom_navigation_bar.dart';
import 'package:quickwash/auth/loginorsignup.dart';
import 'package:quickwash/images.dart';
import 'package:quickwash/on%20boarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Homepages/home_page.dart';
import 'main.dart';

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override

  loggedinCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    loggedin = prefs.getBool('login')??false;
    Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>loggedin==false?  loginorsignupPage():bottomNavigation(),));
    });

  }

  void initState(){


    loggedinCheck();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: w*2.2,
        width: w*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: w*0.6,
              width: w*0.6,
              // color: Colors.yellow,
              child: Image.asset(Pictures.quickwash),
            )
          ],
        ),
      ),

    );
  }
}

