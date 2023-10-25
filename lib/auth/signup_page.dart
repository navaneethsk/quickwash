import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickwash/auth/contactnbrPage.dart';
import 'package:quickwash/auth/login_page.dart';
import 'package:quickwash/themes.dart';
import '../main.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  getSettings() async {

    DocumentSnapshot countSnapshot = await
    FirebaseFirestore.instance.collection("settings").doc("settings").get();

    count = countSnapshot['user'];
    print(count);
  }
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confrmpasswordController=TextEditingController();
  RegExp email_validation = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{3,4}$");
  RegExp password_validation = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10}$");
  final formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  FocusNode focusnode1 =FocusNode();
  FocusNode focusnode2 =FocusNode();
  FocusNode focusnode3 =FocusNode();
  late Color color2;
  late Color color1;
  bool tap = false;
  bool tap1=false;

  @override
  void initState() {
    getSettings();
    // TODO: implement initState
    super.initState();
  }

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
    focusnode2.addListener(() {
      setState(() {
        color2=focusnode2.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    focusnode3.addListener(() {
      setState(() {
        color2=focusnode3.hasFocus?Themes.primaryColor:Themes.grey1;
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
                    Text("Welcome ",
                      style: TextStyle(
                          fontSize: w*0.08,
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w800
                      ),),
                    Text("Please create a new account",
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.04,
                            color: Themes.primaryColor
                        ),
                        decoration: InputDecoration(
                            labelText: "your name",
                            labelStyle: TextStyle(
                                fontSize: w*0.05,
                                color: _focusNode.hasFocus?Themes.primaryColor:Themes.grey1
                            ),
                            hintText: "Enter your name",
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
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(!email_validation.hasMatch(value!)){
                            return "Enter Valid email";
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

                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontSize: w*0.05,
                                color: focusnode1.hasFocus?Themes.primaryColor:Themes.grey1
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
                        focusNode:focusnode2,
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
                                color: focusnode2.hasFocus?Themes.primaryColor:Themes.grey1
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
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: confrmpasswordController,
                        obscureText: tap1?true:false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(confrmpasswordController.text != passwordController.text){
                            return "The password doesn't match";
                          }else{
                            return null;
                          }
                        },
                        autofocus: false,
                        focusNode:focusnode3,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.04,
                            color: Themes.primaryColor
                        ),
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  tap1=!tap1;
                                  setState(() {

                                  });
                                },
                                child: tap1?Icon(Icons.visibility_off,color: Themes.primaryColor,):
                                Icon(Icons.remove_red_eye,color: Themes.primaryColor,)
                            ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                                fontSize: w*0.05,
                                color: focusnode3.hasFocus?Themes.primaryColor:Themes.grey1
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
                      GestureDetector(
                        onTap: () async {
                         if (formKey.currentState!.validate()&&nameController.text!=""&& emailController.text!=""&&passwordController.text!="" &&
                         confrmpasswordController.text==passwordController.text){

                             FirebaseAuth.instance.createUserWithEmailAndPassword(
                                 email: emailController.text,
                                 password: passwordController.text).catchError((e){

                               showDialog(context: context, builder:(context) {

                                 return AlertDialog(
                                   backgroundColor: Themes.secondaryColor,
                                   content:Text(e.code,
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
                                         width: w*0.3,
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

                             }).then((value) {



                               Map<String,dynamic> a ={
                                 'name':nameController.text,
                                 'password':passwordController.text,
                                 'email':emailController.text,
                               };

                               FirebaseFirestore.instance.collection('user').doc('user$count').set(a);
                               currentUserEmail=emailController.text.trim();
                               currentUsername=nameController.text;
                               currentUserId=FirebaseFirestore.instance.collection("user").doc('user$count').id;

                               Navigator.push(
                                   context, MaterialPageRoute(builder: (context) => contactnbrPage(count: count!),));;
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
                            child: Text("Next",
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
