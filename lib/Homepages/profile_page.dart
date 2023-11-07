import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickwash/images.dart';
import 'package:url_launcher/url_launcher.dart';
import '../auth/loginorsignup.dart';
import '../main.dart';
import '../themes.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  launchWhatsApp() async {
  String phone= "+918848155101";
  String message="Hello test ";

  String encodedMessage=Uri.encodeComponent(message);
  String whatsappUrl="https://wa.me/$phone?text=$encodedMessage";

  if(await canLaunch(whatsappUrl)){
    await launch(whatsappUrl);
  }else{

  }

}

  signOut() async {
    await GoogleSignIn().signOut().then((value) {
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => loginorsignupPage(),), (route) => false);
    });
  }

  List data=[
  {
    "icon":SvgPicture.asset(Pictures.recentOrders),
    "text":"Recent orders",
    "textStyle":TextStyle(
        color: Themes.primaryColor,
        fontWeight: FontWeight.w400,
        fontSize: w*0.05
    ),
  },
    {
      "icon":SvgPicture.asset(Pictures.addVehicle),
      "text":"Added vehicles",
      "textStyle":TextStyle(
          color: Themes.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: w*0.05
      ),
    },
    {
      "icon":SvgPicture.asset(Pictures.payment),
      "text":"Payments",
      "textStyle":TextStyle(
          color: Themes.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: w*0.05
      ),
    },
    {
      "icon":SvgPicture.asset(Pictures.activeRequest),
      "text":"Active requests",
      "textStyle":TextStyle(
          color: Themes.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: w*0.05
      ),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle:true ,
        title: Text("Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: w*0.056,
              color: Themes.primaryColor,
              letterSpacing: w*0.002
          ),),
      ),
      body: SingleChildScrollView(
        child: Container(

    width: w*1,
    padding: EdgeInsets.only(left: w*0.06,right: w*0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(w*0.03),
              height: w*0.45,
              width: w*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w*0.02),
                border: Border.all(color: Themes.primaryColor)
              ),
              child: Row(
                children: [
                  CircleAvatar(
                   backgroundColor: Themes.secondaryColor,
                    radius: w*0.15,
                    child: Image.asset(Pictures.profileImage,fit: BoxFit.contain),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: w*0.5,
                        height: w*0.25,
                        // color: Colors.teal,
                        padding: EdgeInsets.only(left: w*0.02,top: w*0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentUsername.toString(),
                            style: TextStyle(
                              fontSize: w*0.05,
                              fontWeight: FontWeight.w700,
                              color: Themes.primaryColor
                            ),),
                            Text(currentUserEmail.toString(),
                              style: TextStyle(
                                color: Themes.grey4,

                              ),),
                            Text("+91 $currentUserNumber",
                              style: TextStyle(
                                color: Themes.grey4,

                              ),)
                          ],
                        ),
                      ),
                      Container(
                        width: w*0.4,
                        height: w*0.13,
                        decoration: BoxDecoration(
                            color: Themes.primaryColor,
                            borderRadius: BorderRadius.circular(w*0.08),
                            border: Border.all(color: Themes.secondaryColor)
                        ),
                        child: Center(
                          child: Text("Edit profile",
                            style: TextStyle(
                                fontSize: w*0.05,
                                color: Themes.secondaryColor,
                                fontWeight: FontWeight.w600,
                              letterSpacing: w*0.001
                            ),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: w*0.08,),
            ListView.separated(
              physics:NeverScrollableScrollPhysics(),
              itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.all(w*0.02),
                      height: w*0.15,
                      width: w*1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w*0.5,
                            child: Row(
                              children: [
                                Container(
                                  height: w*0.07,
                                  width: w*0.07,
                                  padding: EdgeInsets.all(w*0.008),
                                  child: data[index]["icon"],
                                ),
                                SizedBox(width: w*0.03,),
                                Text(data[index]["text"],
                                  style: data[index]["textStyle"],)
                              ],
                            ),
                          ),
                          Container(
                            height: w*0.06,
                            width: w*0.06,
                            padding: EdgeInsets.all(w*0.01),
                            child:SvgPicture.asset(Pictures.profileArrow) ,
                          ),


                        ],
                      )
                  );
                },
                separatorBuilder: (context, index) {
                return Divider(
                  color: Themes.dividerGrey,
                );
                },
            ),
            Divider(
              thickness: w*0.004,
              color: Themes.primaryColor,
            ),
            Container(
              height: w*1,
              width: w*1,
              child: Column(
                children: [
              Container(
              padding: EdgeInsets.all(w*0.02),
                height: w*0.15,
                width: w*1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: w*0.5,
                      child: Row(
                        children: [
                          Container(
                            height: w*0.07,
                            width: w*0.07,
                            padding: EdgeInsets.all(w*0.008),
                            child: SvgPicture.asset(Pictures.faq),
                          ),
                          SizedBox(width: w*0.03,),
                          Text("FAQ",
                            style: TextStyle(
                                color: Themes.profileGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: w*0.05
                            ),)
                        ],
                      ),
                    ),
                    Container(
                      height: w*0.06,
                      width: w*0.06,
                      padding: EdgeInsets.all(w*0.01),
                      // color: Colors.yellowAccent,
                      child:SvgPicture.asset(Pictures.profileArrow2) ,
                    ),


                  ],
                )
            ),
                  Divider(
                    color: Themes.dividerGrey,
                  ),
                  Container(
                      padding: EdgeInsets.all(w*0.02),
                      height: w*0.15,
                      width: w*1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w*0.5,
                            child: Row(
                              children: [
                                Container(
                                  height: w*0.07,
                                  width: w*0.07,
                                  padding: EdgeInsets.all(w*0.008),
                                  child: SvgPicture.asset(Pictures.share),
                                ),
                                SizedBox(width: w*0.03,),
                                Text("Share",
                                  style: TextStyle(
                                      color: Themes.profileGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.05
                                  ),)
                              ],
                            ),
                          ),
                          Container(
                            height: w*0.06,
                            width: w*0.06,
                            padding: EdgeInsets.all(w*0.01),
                            child:SvgPicture.asset(Pictures.profileArrow2) ,
                          ),


                        ],
                      )
                  ),
                  Divider(
                    color: Themes.dividerGrey,
                  ),
                  Container(
                      padding: EdgeInsets.all(w*0.02),
                      height: w*0.15,
                      width: w*1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w*0.5,
                            child: Row(
                              children: [
                                Container(
                                  height: w*0.07,
                                  width: w*0.07,
                                  padding: EdgeInsets.all(w*0.008),
                                  child: SvgPicture.asset(Pictures.rateUs),
                                ),
                                SizedBox(width: w*0.03,),
                                Text("Rate us",
                                  style: TextStyle(
                                      color: Themes.profileGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: w*0.05
                                  ),)
                              ],
                            ),
                          ),
                          Container(
                            height: w*0.06,
                            width: w*0.06,
                            padding: EdgeInsets.all(w*0.01),
                            // color: Colors.yellowAccent,
                            child:SvgPicture.asset(Pictures.profileArrow2) ,
                          ),


                        ],
                      )
                  ),
                  Divider(
                    color: Themes.dividerGrey,
                  ),
                  InkWell(
                    onTap: () {
                    launchWhatsApp();
                    },
                    child: Container(
                        padding: EdgeInsets.all(w*0.02),
                        height: w*0.15,
                        width: w*1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: w*0.5,
                              child: Row(
                                children: [
                                  Container(
                                    height: w*0.15,
                                    width: w*0.15,
                                    padding: EdgeInsets.all(w*0.008),
                                    child: Image.asset(Pictures.whatsappIcon),
                                  ),
                                  SizedBox(width: w*0.03,),
                                  Text("WhatsApp",
                                    style: TextStyle(
                                        color: Themes.green,
                                        fontWeight: FontWeight.w400,
                                        fontSize: w*0.05
                                    ),)
                                ],
                              ),
                            ),
                            Container(
                              height: w*0.06,
                              width: w*0.06,
                              padding: EdgeInsets.all(w*0.01),
                              // color: Colors.yellowAccent,
                              child:SvgPicture.asset(Pictures.profileArrow2) ,
                            ),


                          ],
                        )
                    ),
                  ),
                  SizedBox(height: w*0.04,),
                  InkWell(
                    onTap: () {
                      signOut();
                    },
                    child: Container(
                        padding: EdgeInsets.all(w*0.02),
                        height: w*0.15,
                        width: w*1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: w*0.5,
                              child: Row(
                                children: [
                                  Container(
                                    height: w*0.07,
                                    width: w*0.07,
                                    padding: EdgeInsets.all(w*0.008),
                                    child: SvgPicture.asset(Pictures.logOut),
                                  ),
                                  SizedBox(width: w*0.03,),
                                  Text("Log out",
                                    style: TextStyle(
                                        color: Themes.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: w*0.05
                                    ),)
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),

        ),
      ),
    );
  }
}
