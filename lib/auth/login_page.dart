import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickwash/Homepages/bottom_navigation_bar.dart';
import 'package:quickwash/auth/signup_page.dart';
import 'package:quickwash/themes.dart';

import '../Homepages/home_page.dart';
import '../main.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {




  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  RegExp email_validation = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{3,4}$");
  RegExp password_validation = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10}$");
   FocusNode _focusNode = FocusNode();
   FocusNode focusnode1 =FocusNode();
  final formKey = GlobalKey<FormState>();
   late Color color2;
  late Color color1;
  bool check1=false;
  bool tap=false;
  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        color1= _focusNode.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    focusnode1.addListener(() {
      setState(() {
        color2=focusnode1.hasFocus?Themes.primaryColor:Themes.grey1;
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
                height: w*0.25,
                width: w*1,
                child: Column(
                  children: [
                    Text("Welcome back",
                    style: TextStyle(
                      fontSize: w*0.08,
                      color: Themes.primaryColor,
                      fontWeight: FontWeight.w800
                    ),),
                    Text("Please login into your account",
                    style: TextStyle(
                      color: Themes.primaryColor,
                      fontSize: w*0.05,
                      fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
              Container(
                height: w*1,
                width: w*1,
                 // color: Colors.yellow,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        controller: nameController,
                        autofocus: false,
                        focusNode: _focusNode,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(!email_validation.hasMatch(value!)){
                            return "Enter a valid email";
                          }else{
                            return null;
                          }
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w*0.04,
                          color: Themes.primaryColor
                        ),
                        decoration: InputDecoration(
                          labelText: "User name",
                          labelStyle: TextStyle(
                            fontSize: w*0.05,
                            color: _focusNode.hasFocus?Themes.primaryColor:Themes.grey1
                          ),
                          hintText: "Enter your email",
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: tap?true:false,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if(!password_validation.hasMatch(value!)){
                                return "Enter Valid Password";
                              }else{
                                return null;
                              }
                            },
                            autofocus: false,
                            focusNode:focusnode1,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: w*0.04,
                                color: Themes.primaryColor
                            ),
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      tap=!tap;
                                      setState(() {

                                      });
                                    },
                                    child: tap?Icon(Icons.visibility_off,color: Themes.primaryColor,):
                                Icon(Icons.remove_red_eye,color: Themes.primaryColor,)
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    fontSize: w*0.05,
                                    color: focusnode1.hasFocus?Themes.primaryColor:Themes.grey1
                                ),
                                hintText: "Enter your password",
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
                          Container(
                            width: w*0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      side: BorderSide(
                                          color: Themes.primaryColor,
                                          width: 3.0
                                      ),
                                      activeColor: Themes.primaryColor,
                                      value: check1,
                                      onChanged: (value) {
                                        setState(() {
                                          check1=value!;
                                        });
                                      },),
                                    Text("Remember me",
                                      style: TextStyle(
                                          fontSize: w*0.032,
                                          color: Themes.blue1,
                                          fontWeight: FontWeight.w300
                                      ),)
                                  ],
                                ),
                                Text("forget password?",
                                  style: TextStyle(
                                      fontSize: w*0.035,
                                      color: Themes.blue1,
                                      fontWeight: FontWeight.w500
                                  ),)
                              ],
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if(formKey.currentState!.validate()&&nameController.text!=""&& passwordController.text!=""){
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: nameController.text.trim(),
                                  password: passwordController.text).then((value) async {

                                    var user= await FirebaseFirestore.instance.collection("user").where('email',isEqualTo:nameController.text.trim()).get();

                                    currentUserEmail=user.docs[0]['email'];
                                    currentUserId=user.docs[0].id;
                                    currentUsername=user.docs[0]['name'];
                                    currentUserNumber=user.docs[0]['number'];

                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => bottomNavigation(),),
                                        (route) => false);
                              }).catchError((e){
                                if(e.code == "INVALID-LOGIN_CREDENTIALS") {
                                  showDialog(
                                    context: context, builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Themes.secondaryColor,
                                      content:Text("Invalid Username Or Password",
                                      style: TextStyle(
                                        color: Themes.primaryColor,
                                        fontSize: w*0.05,
                                        fontWeight: FontWeight.w500
                                      ),
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: w*0.1,
                                            width: w*0.25,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(w*0.03),
                                              color: Themes.primaryColor
                                            ),
                                            child: Center(
                                              child: Text("OK",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: w*0.04,
                                                color: Themes.secondaryColor
                                              ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },);
                                }else{
                                  showDialog(context: context, builder:(context) {

                                    return AlertDialog(
                                      backgroundColor: Themes.secondaryColor,
                                      content:Text("Enter correct Details",
                                        style: TextStyle(
                                            color: Themes.primaryColor,
                                            fontSize: w*0.05,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: w*0.1,
                                            width: w*0.25,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(w*0.03),
                                                color: Themes.primaryColor
                                            ),
                                            child: Center(
                                              child: Text("OK",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: w*0.04,
                                                    color: Themes.secondaryColor
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );

                                  },);
                                }
                                
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
                            child: Text("Login",
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
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                  style: TextStyle(
                    fontSize: w*0.035,
                    color: Themes.grey1,
                    fontWeight: FontWeight.w400
                  ),),
                  SizedBox(width: w*0.01,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => signupPage(),));
                    },
                    child: Text("Sign up",
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
