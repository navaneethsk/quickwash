import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickwash/Homepages/bottom_navigation_bar.dart';
import 'package:quickwash/Homepages/service_pages.dart';
import 'package:quickwash/auth/otpPage.dart';
import 'package:quickwash/splashScreen.dart';
var w;
var h;
int ?count;
var currentUsername;
var currentUserEmail;
var currentUserId;
var currentUserNumber;

bool loggedin = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override

  @override
  Widget build(BuildContext context) {
      w=MediaQuery.of(context).size.width;
      h=MediaQuery.of(context).size.height;
    return  GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.muktaVaaniTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home:splashPage(),
      ),
    );
  }
}
