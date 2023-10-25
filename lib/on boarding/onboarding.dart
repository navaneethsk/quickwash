import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quickwash/Homepages/home_page.dart';
import 'package:quickwash/auth/login_page.dart';
import 'package:quickwash/themes.dart';
import 'package:quickwash/images.dart';


import '../Homepages/bottom_navigation_bar.dart';
import '../main.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            height: w*2,
            width: w*1,
            child: IntroductionScreen(
              dotsDecorator: DotsDecorator(
                activeColor: Themes.blue1,
                activeShape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(w*0.05)
                ),
                activeSize: Size(w*0.1, w*0.015)
              ),
              pages: [
                PageViewModel(
                  titleWidget: Text("On site",
                    style: TextStyle(
                        fontSize: w*0.08,
                        color: Themes.primaryColor,
                        fontWeight: FontWeight.w800
                    ),),

                  decoration: PageDecoration(
                    titlePadding: EdgeInsets.only(top: w*0.2,bottom: w*0.02),
                      bodyPadding: EdgeInsets.only(top: w*0.2),
                      bodyAlignment:Alignment.center
                  ),
                  bodyWidget: Container(
                    width: w*1,
                    height: w*0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Pictures.picture1),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("You can  book  slot with location",
                              style: TextStyle(
                                  fontSize: w*0.055,
                                  color: Themes.primaryColor,
                                  fontWeight: FontWeight.w400
                              ),),
                            Text("our service get your door step",
                              style: TextStyle(
                                  fontSize: w*0.055,
                                  color: Themes.primaryColor,
                                  fontWeight: FontWeight.w400
                              ),)
                          ],
                        ),
                      ],

                    ),
                  )
                ),
                PageViewModel(
                    titleWidget: Text("Self visit",
                      style: TextStyle(
                          fontSize: w*0.08,
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w800
                      ),),
                    decoration: PageDecoration(
                        titlePadding: EdgeInsets.only(top: w*0.2,bottom: w*0.05),
                        bodyPadding: EdgeInsets.only(top: w*0.05),
                        bodyAlignment:Alignment.center
                    ),
                    bodyWidget: Container(

                      width: w*1,
                      height: w*1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w*1,
                              padding: EdgeInsets.only(right: w*0.07),
                              child: Image.asset(Pictures.picture2)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("You can  book a slot and go at",
                                style: TextStyle(
                                    fontSize: w*0.055,
                                    color: Themes.primaryColor,
                                    fontWeight: FontWeight.w400
                                ),),
                              Text("workstation",
                                style: TextStyle(
                                    fontSize: w*0.055,
                                    color: Themes.primaryColor,
                                    fontWeight: FontWeight.w400
                                ),)
                            ],
                          ),
                        ],

                      ),
                    )
                ),
                PageViewModel(

                    titleWidget: Text("Pickup and drop",
                      style: TextStyle(
                          fontSize: w*0.08,
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w800
                      ),),
                    decoration: PageDecoration(
                        titlePadding: EdgeInsets.only(top: w*0.2),
                        bodyPadding: EdgeInsets.only(top: w*0.2),
                        bodyAlignment:Alignment.center
                    ),
                    bodyWidget: Container(
                      width: w*1,
                      height: w*0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: w*0.55,
                              child: Image.asset(Pictures.picture3)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("You can choose pickup &  Drop ",
                                style: TextStyle(
                                    fontSize: w*0.055,
                                    color: Themes.primaryColor,
                                    fontWeight: FontWeight.w400
                                ),),
                              Text("facility",
                                style: TextStyle(
                                    fontSize: w*0.055,
                                    color: Themes.primaryColor,
                                    fontWeight: FontWeight.w400
                                ),)
                            ],
                          ),
                        ],

                      ),
                    )
                ),
              ],
              showNextButton: false,
              showDoneButton: true,
              showSkipButton: true,
              done: Text("Done",
                style: TextStyle(
                    color: Themes.blue1,
                    fontSize: w*0.04,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Themes.primaryColor,
                    decorationThickness: w*0.006,
                    letterSpacing: w*0.003
                ),),
              onDone: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => bottomNavigation(),));
              },
              skip: Text("Skip",
                style: TextStyle(
                    color: Themes.blue1,
                    fontSize: w*0.04,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: Themes.primaryColor,
                    decorationThickness: w*0.006,
                    letterSpacing: w*0.003
                ),),

            ),
          ),
        ],
      )
    );
  }
}
