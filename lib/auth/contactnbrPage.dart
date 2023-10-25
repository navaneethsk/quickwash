import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickwash/auth/otpPage.dart';
import 'package:quickwash/on%20boarding/onboarding.dart';
import 'package:quickwash/themes.dart';

import '../main.dart';
import 'login_page.dart';
class contactnbrPage extends StatefulWidget {
  final int count;
  const contactnbrPage({super.key, required this.count});

  @override
  State<contactnbrPage> createState() => _contactnbrPageState();
}

class _contactnbrPageState extends State<contactnbrPage> {
  TextEditingController numberController=TextEditingController();
  RegExp phone_validation = RegExp(r"[0-9]{10}$");
  FocusNode _focusNode = FocusNode();
  late Color color1;
  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        color1= _focusNode.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    return Scaffold(
      backgroundColor: Themes.secondaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(w*0.05),
          height: w*2.1,
          width: w*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: w*0.23,),
              Container(
                height: w*0.3,
                width: w*1,
                child: Column(
                  children: [
                    Text("Welcome ",
                      style: TextStyle(
                          fontSize: w*0.08,
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w800
                      ),),
                    Text("Please enter your contact number",
                      style: TextStyle(
                          color: Themes.primaryColor,
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w400
                      ),),
                    Text("We will send an OTP",
                      style: TextStyle(
                          color: Themes.primaryColor,
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w400
                      ),)
                  ],
                ),
              ),
              Container(
                height: w*0.7,
                width: w*1,
                // color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: numberController,
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(!phone_validation.hasMatch(value!)){
                          return "Enter valid number";
                        }else{
                          return null;
                        }
                      },
                      focusNode: _focusNode,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w*0.04,
                          color: Themes.primaryColor
                      ),
                      decoration: InputDecoration(
                          labelText: "Contact number",
                          labelStyle: TextStyle(
                              fontSize: w*0.05,
                              color: _focusNode.hasFocus?Themes.primaryColor:Themes.grey1
                          ),
                          hintText: "Enter your number",
                          hintStyle: TextStyle(
                            color: Themes.grey1,
                            fontSize: w*0.04,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.02),
                              borderSide: BorderSide(
                                  color: Themes.primaryColor
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.02),
                              borderSide: BorderSide(
                                  color: Themes.primaryColor
                              )
                          )
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        if(numberController.text!="") {
                            FirebaseFirestore.instance.collection('user').doc('user${widget.count}').update(
                              {
                                'number': numberController.text
                              }
                            ).then((value) {
                              FirebaseFirestore.instance.collection('settings').doc('settings').update(
                                {
                                  'user':FieldValue.increment(1)
                                }
                              ).then((value) {

                                currentUserNumber=numberController.text;
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => onBoarding(),), (route) => false);
                              });
                            });

                          

                        }
                      },
                      child: Container(
                        width: w*0.44,
                        height: w*0.13,
                        decoration: BoxDecoration(
                            color: Themes.primaryColor,
                            borderRadius: BorderRadius.circular(w*0.08),
                            border: Border.all(color: Themes.secondaryColor)
                        ),
                        child: Center(
                          child: Text("Continue",
                            style: TextStyle(
                                fontSize: w*0.065,
                                color: Themes.secondaryColor,
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ),
                    ),


                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                    style: TextStyle(
                        fontSize: w*0.035,
                        color: Themes.grey1,
                        fontWeight: FontWeight.w400
                    ),),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => loginPage(),));
                    },
                    child: Text("Sign in",
                      style: TextStyle(
                          fontSize: w*0.035,
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: Themes.primaryColor,
                          decorationThickness: w*0.01
                      ),),
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
