import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickwash/Homepages/stepper_page.dart';
import 'package:quickwash/themes.dart';

import '../images.dart';
import '../main.dart';

class bookingPage extends StatefulWidget {
  const bookingPage({super.key});

  @override
  State<bookingPage> createState() => _bookingPageState();
}

class _bookingPageState extends State<bookingPage> {
  TextEditingController searchController=TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        var color1= _focusNode.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle:true ,
        title: Text("Bookings",
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
          padding: EdgeInsets.only(left: w*0.04,right: w*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: w*0.02,),
              Container(
                height: w*0.15,
                color: Themes.secondaryColor,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  controller: searchController,
                  autofocus: false,
                  focusNode: _focusNode,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: w*0.04,
                      color: Themes.primaryColor
                  ),
                  decoration: InputDecoration(
                      suffixIcon: Container(
                          padding: EdgeInsets.all(w*0.04),
                          child: SvgPicture.asset(Pictures.search)),
                      labelText: "Search services",
                      labelStyle: TextStyle(
                          fontSize: w*0.05,
                          color: _focusNode.hasFocus?Themes.primaryColor:Themes.grey1
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
              ),
              SizedBox(
                height: w*0.02,
              ),
              Text("Currently actived",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Themes.primaryColor,
                    fontSize: w*0.05,
                    letterSpacing: w*0.002
                ),),
              SizedBox(height: w*0.015,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => stepperPage(),));
                },
                child: Container(
                  height: w*0.27,
                  width: w*1,
                  color: Themes.secondaryColor,
                  padding: EdgeInsets.all(w*0.02),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: w*0.18,
                            width: w*0.25,
                            child: Image.asset(Pictures.car),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Prowash",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: w*0.033,
                                    color: Themes.primaryColor
                                ),),
                              Text("Car-M5",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("KL-53 SG 4357",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("26/03/2022",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Row(

                                children: [
                                  SvgPicture.asset(Pictures.locate),
                                  SizedBox(width:w*0.01),
                                  Text("Vehicle reached at center",
                                    style: TextStyle(
                                        fontSize: w*0.025,
                                        fontWeight: FontWeight.w600,
                                        color: Themes.primaryColor
                                    ),)
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ) ,
                ),
              ),
              SizedBox(height: w*0.015,),
              Text("Bookings",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Themes.primaryColor,
                    fontSize: w*0.05,
                    letterSpacing: w*0.002
                ),),
              SizedBox(height: w*0.015,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => stepperPage(),));
                },
                child: Container(
                  height: w*0.27,
                  width: w*1,
                  color: Themes.secondaryColor,
                  padding: EdgeInsets.all(w*0.01),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: w*0.2,
                            width: w*0.25,
                            child: Image.asset(Pictures.car2),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("custom wash",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: w*0.033,
                                    color: Themes.primaryColor
                                ),),
                              Text("Car-shiftM5",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("KL-10 AB 4357",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("01/04/2022",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Row(

                                children: [
                                  Text("Expected on 04/04/2022",
                                    style: TextStyle(
                                        fontSize: w*0.025,
                                        fontWeight: FontWeight.w600,
                                        color: Themes.primaryColor
                                    ),)
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ) ,
                ),
              ),
              SizedBox(height: w*0.015,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => stepperPage(),));
                },
                child: Container(
                  height: w*0.27,
                  width: w*1,
                  color: Themes.secondaryColor,
                  padding: EdgeInsets.all(w*0.01),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: w*0.2,
                            width: w*0.25,
                            child: Image.asset(Pictures.car3),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Quick wash",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: w*0.033,
                                    color: Themes.primaryColor
                                ),),
                              Text("Car-M5",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("KL-53 SG 4357",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("26/03/2022",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Row(
                                children: [
                                  Text("Expected on 04/04/2022",
                                    style: TextStyle(
                                        fontSize: w*0.025,
                                        fontWeight: FontWeight.w600,
                                        color: Themes.primaryColor
                                    ),)
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ) ,
                ),
              ),
              Text("Serviced",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Themes.primaryColor,
                    fontSize: w*0.05,
                    letterSpacing: w*0.002
                ),),
              SizedBox(height: w*0.015,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => stepperPage(),));
                },
                child: Container(
                  height: w*0.27,
                  width: w*1,
                  color: Themes.secondaryColor,
                  padding: EdgeInsets.all(w*0.01),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: w*0.2,
                            width: w*0.25,
                            child: Image.asset(Pictures.car2),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Custom wash",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: w*0.033,
                                    color: Themes.primaryColor
                                ),),
                              Text("Car-shiftM5",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("KL-10 AB 4357",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("26/03/2022",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Row(

                                children: [
                                  SvgPicture.asset(Pictures.locateGrey),
                                  SizedBox(width:w*0.01),
                                  Text("Vehicle dropped successfully",
                                    style: TextStyle(
                                        fontSize: w*0.025,
                                        fontWeight: FontWeight.w600,
                                        color: Themes.blue2
                                    ),)
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ) ,
                ),
              ),
              SizedBox(height: w*0.015,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => stepperPage(),));
                },
                child: Container(
                  height: w*0.27,
                  width: w*1,
                  color: Themes.secondaryColor,
                  padding: EdgeInsets.all(w*0.02),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: w*0.2,
                            width: w*0.25,
                            child: Image.asset(Pictures.car),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Prowash",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: w*0.033,
                                    color: Themes.primaryColor
                                ),),
                              Text("Car-M5",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("KL-53 SG 4357",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Text("26/03/2022",
                                style: TextStyle(
                                    fontSize: w*0.025,
                                    color: Themes.grey2,
                                    fontWeight: FontWeight.w500
                                ),),
                              Row(

                                children: [
                                  SvgPicture.asset(Pictures.locateGrey),
                                  SizedBox(width:w*0.01),
                                  Text("Vehicle dropped successfully",
                                    style: TextStyle(
                                        fontSize: w*0.025,
                                        fontWeight: FontWeight.w600,
                                        color: Themes.blue2
                                    ),)
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ) ,
                ),
              ),
              SizedBox(height: w*0.03,),
              Container(
                margin: EdgeInsets.all(w*0.03),
                height: w*1,
                width: w*1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Make Your Dreams Shine",maxLines: 2,overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: w*0.13,
                          color: Themes.grey3
                      ),),
                    Text("Powered by QuickWash Ltd",
                      style: TextStyle(
                          color: Themes.primaryColor
                      ),)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
