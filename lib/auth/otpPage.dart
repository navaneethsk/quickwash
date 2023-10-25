import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quickwash/themes.dart';

import '../main.dart';
import '../on boarding/onboarding.dart';
import 'login_page.dart';
class otpPage extends StatefulWidget {
  final String phoneNumber;
  const otpPage({super.key, required this.phoneNumber});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  var verify="";
  var smsCode="";
  getOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91 ${widget.phoneNumber}",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (verificationId, forceResendingToken) {
        verify=verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  void initState() {
    getOtp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    Text("Please enter your OTP",
                      style: TextStyle(
                          color: Themes.primaryColor,
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w400
                      ),),

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

                    Pinput(
                      length: 6,
                      onChanged: (value) {
                        smsCode=value;
                      },
                      keyboardType: TextInputType.number,
                      obscuringCharacter: "*",
                      defaultPinTheme: PinTheme(
                          width: w*0.15,
                          height: w*0.15,
                          textStyle: TextStyle(
                            color: Themes.primaryColor,
                            fontSize: w*0.1,
                            fontWeight: FontWeight.w600
                          ),
                          decoration: BoxDecoration(
                              color:Themes.otpBoxWhite,
                              borderRadius: BorderRadius.circular(w*0.03),
                          )
                      ),
                      focusedPinTheme:PinTheme(
                          width: w*0.15,
                          height: w*0.15,
                          decoration: BoxDecoration(
                              color: Themes.otpBoxWhite,
                              borderRadius: BorderRadius.circular(w*0.03),
                              border: Border.all(color: Themes.primaryColor)
                          )
                      ),
                      submittedPinTheme:PinTheme(
                          width: w*0.15,
                          height: w*0.15,
                          decoration: BoxDecoration(
                              color: Themes.otpBoxWhite,
                              borderRadius: BorderRadius.circular(w*0.03),
                              border: Border.all(color: Themes.primaryColor)
                          )
                      ),
                    ),
                    Text("Resend OTP",
                      style: TextStyle(
                          fontSize: w*0.05,
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: Themes.primaryColor,
                          decorationThickness: w*0.01
                      ),),



                    GestureDetector(
                      onTap: () {

                        try{

                          PhoneAuthCredential credential= PhoneAuthProvider.credential(verificationId: verify, smsCode: smsCode);
                          FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => onBoarding(),), (route) => false);
                          });

                        }on FirebaseAuthException catch(e){}


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
                          child: Text("Sign in",
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
