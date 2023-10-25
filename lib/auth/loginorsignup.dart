import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickwash/Homepages/bottom_navigation_bar.dart';
import 'package:quickwash/auth/login_page.dart';
import 'package:quickwash/auth/signup_page.dart';
import 'package:quickwash/themes.dart';
import 'package:quickwash/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Homepages/home_page.dart';
import '../main.dart';

class loginorsignupPage extends StatefulWidget {
  const loginorsignupPage({super.key});

  @override
  State<loginorsignupPage> createState() => _loginorsignupPageState();
}

class _loginorsignupPageState extends State<loginorsignupPage> {
  signInWithGoogle() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('login', true);

    GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential=GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken:googleAuth?.idToken
    );

    UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);
    currentUsername=userCredential.user?.displayName;
    currentUserEmail=userCredential.user?.email;
    currentUserNumber=userCredential.user?.phoneNumber;
    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bottomNavigation(),), (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(w*0.05),
        height: w*2.1,
        width: w*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: w*0.1,),
            Container(
              height:w*0.45 ,
              width: w*0.9,
              // color: Colors.red,
              child: Image.asset(Pictures.logincar),
            ),
            SizedBox(
              height: w*0.48,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Here’s where",
                            style: TextStyle(
                                color: Themes.primaryColor,
                                fontSize: w*0.075,
                                fontWeight: FontWeight.w800

                            ),),
                          Text("We shine",
                            style: TextStyle(
                                color: Themes.primaryColor,
                                fontSize: w*0.075,
                                fontWeight: FontWeight.w800

                            ),),

                        ],
                      ),
                    ),
                    Container(
                      width: w*0.9,
                      child: Column(
                        children: [
                          Text("Book your easy",
                            style: TextStyle(
                                color: Themes.primaryColor,
                                fontSize: w*0.05
                            ),),
                          Text("be the shiny rockstar on the road",
                            style: TextStyle(
                                color: Themes.primaryColor,
                                fontSize: w*0.05
                            ),)
                        ],
                      ),
                    ),
                  ],
                ),
            ),


            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));
                  },
                  child: Container(
                    width: w*0.4,
                    height: w*0.13,
                    decoration: BoxDecoration(
                      color: Themes.primaryColor,
                      borderRadius: BorderRadius.circular(w*0.08),
                      border: Border.all(color: Themes.secondaryColor)
                    ),
                    child: Center(
                      child: Text("Login",
                      style: TextStyle(
                        fontSize: w*0.065,
                        color: Themes.secondaryColor,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ),
                SizedBox(width: w*0.07,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage(),));
                  },
                  child: Container(
                    width: w*0.4,
                    height: w*0.13,
                    decoration: BoxDecoration(
                        color: Themes.secondaryColor,
                        borderRadius: BorderRadius.circular(w*0.08),
                      border: Border.all(color: Themes.primaryColor)
                    ),
                    child: Center(
                        child:
                        Text("Sign up",
                        style: TextStyle(
                          color: Themes.primaryColor,
                          fontSize: w*0.065,
                          fontWeight: FontWeight.w500
                        ),)),
                  ),
                ),

              ],
            ),
            Text("OR",
              style:TextStyle(
                  fontSize: w*0.05,
                  color: Themes.primaryColor,
                fontWeight: FontWeight.w600
              ) ,),
            InkWell(
              onTap: () {
                signInWithGoogle();
              },
              child: Container(
                height: w*0.1,
                width: w*0.1,
                child: Image.asset(Pictures.googleIcon),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
