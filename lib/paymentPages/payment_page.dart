import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quickwash/Homepages/order_details_page.dart';

import '../images.dart';
import '../main.dart';
import '../themes.dart';
import 'card_page.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({super.key});

  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  String payment = "online";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text("Confirmation",
          style: TextStyle(
              fontSize: w*0.06,
              fontWeight: FontWeight.w700,
              color: Themes.primaryColor,
              letterSpacing: w*0.001
          ),),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: w*0.01,
              width: w*0.01,
              padding: EdgeInsets.all(w*0.05),
              child: SvgPicture.asset(Pictures.backArrow)),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: w*2,
          width: w*1,
          padding: EdgeInsets.only(bottom: w*0.08),
          child: Column(
            children: [
              SizedBox(
                height: w*1.4,
                width: w*1,
                child: Column(
                  children: [
                    Container(
                      height: w*0.4,
                      width: w*1,
                      margin: EdgeInsets.only(left: w*0.05,right: w*0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05,
                                letterSpacing: w*0.002
                            ),),
                          SizedBox(height: w*0.01,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => orderDetailsPage(),));
                            },
                            child: Container(
                              height: w*0.3,
                              width: w*1,
                              decoration: BoxDecoration(
                                  color: Themes.secondaryColor,
                                  borderRadius: BorderRadius.circular(w*0.02)
                              ),
                              padding: EdgeInsets.all(w*0.02),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: w*0.25,
                                        width: w*0.28,
                                        child: Image.asset(Pictures.car),
                                      ),
                                      Container(
                                        height: w*0.25,
                                        width: w*0.5,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Prowash",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: w*0.033,
                                                      color: Themes.primaryColor
                                                  ),),
                                                Text("Navaneeth",
                                                  style: TextStyle(
                                                      fontSize: w*0.03,
                                                      fontWeight: FontWeight.w600,
                                                      color: Themes.grey4
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


                                              ],
                                            ),
                                            Container(
                                              height: w*0.06,
                                              width: w*0.06,
                                              padding: EdgeInsets.all(w*0.01),
                                              // color: Colors.yellowAccent,
                                              child:SvgPicture.asset(Pictures.profileArrow2) ,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ) ,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: w*0.03,),
                    Container(
                      height: w*0.21,
                      width: w*1,
                      margin: EdgeInsets.only(left: w*0.05,right: w*0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Location",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05,
                                letterSpacing: w*0.002
                            ),),
                          Container(
                            height: w*0.12,
                            width: w*1,
                            margin: EdgeInsets.only(left: w*0.03,right: w*0.06),
                            child: Text("52, Race Course Rd, Racecourse, Gandhi Nagar, Bengaluru, Karnataka 560001",
                            maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Themes.grey4,
                                fontSize: w*0.04
                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(height: w*0.03,),
                    Container(
                      height: w*0.37,
                      width: w*1,
                      margin: EdgeInsets.only(left: w*0.05,right: w*0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment method",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05,
                                letterSpacing: w*0.002
                            ),),
                          Container(
                            height: w*0.27,
                            width: w*1,
                            margin: EdgeInsets.only(left: w*0.03,right: w*0.12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Online payment",
                                    style: TextStyle(
                                      fontSize: w*0.04,
                                      fontWeight: FontWeight.w400,
                                      color: Themes.grey4
                                    ),),
                                    Radio(
                                      activeColor: Themes.primaryColor,
                                      value:"online",
                                      groupValue: payment,
                                      onChanged:(value) {
                                        setState(() {
                                          payment=value!;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Cash on delivery",
                                      style: TextStyle(
                                          fontSize: w*0.04,
                                          fontWeight: FontWeight.w400,
                                          color: Themes.grey4
                                      ),),
                                    Radio(
                                      activeColor: Themes.primaryColor,
                                        value:"cod",
                                        groupValue: payment,
                                        onChanged:(value) {
                                          setState(() {
                                            payment=value!;
                                          });
                                        },
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: w*0.13,),
                    Container(
                      height: w*0.16,
                      width: w*1,
                      color: Themes.secondaryColor,
                      padding: EdgeInsets.only(right: w*0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Price:",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: w*0.05,
                            color: Themes.primaryColor
                          ),),
                          SizedBox(width: w*0.01,),
                          Text("\$3600",
                          style: TextStyle(
                            fontSize: w*0.06,
                            fontWeight: FontWeight.w700,
                            color: Themes.primaryColor
                          ),)
                        ],
                      ),
                    ),



                  ],
                ),
              ),
              SizedBox(
                height: w*0.24,
              ),
              InkWell(
                onTap: () {
                  payment=="online"?showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.07),topRight: Radius.circular(w*0.07))
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: w*0.7,
                        width: w*1,
                        padding: EdgeInsets.only(left: w*0.06,right: w*0.06,top: w*0.03),
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(

                              children: [
                                SizedBox(width: w*0.02,),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: w*0.05,
                                      width: w*0.05,
                                      margin:EdgeInsets.all(w*0.01),
                                      child: SvgPicture.asset(Pictures.backCross)),
                                ),
                                SizedBox(width: w*0.06,),
                                Text("Add your bank account",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: w*0.05,
                                  color: Themes.primaryColor,
                                  letterSpacing: w*0.003
                                ),)
                              ],
                            ),
                            Container(
                              height: w*0.14,
                              width: w*1,
                              child: Column(
                                children: [
                                  Text("To book your service on Quick was you need",
                                  style: TextStyle(
                                    fontSize: w*0.04,
                                    fontWeight: FontWeight.w300,
                                    color:Themes.blue1
                                  ),),
                                  Text("to add a bank account",
                                    style: TextStyle(
                                        fontSize: w*0.04,
                                        fontWeight: FontWeight.w300,
                                        color:Themes.blue1
                                    ),)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const cardPage(),));
                              },
                              child: Container(
                                height: w*0.13,
                                width: w*0.42,
                                decoration: BoxDecoration(
                                    color: Themes.primaryColor,
                                    borderRadius: BorderRadius.circular(w*0.08)
                                ),
                                child: Center(
                                  child: Text("Get started",
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
                      );
                    },):
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.07),topRight: Radius.circular(w*0.07))
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: w*1,
                        width: w*1,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(Pictures.vehicleAdded,
                                height: w*0.5,
                                width: w*0.5),
                            Text("Booking Successful",
                              style: GoogleFonts.poppins(
                                  color: Themes.primaryColor,
                                  fontSize: w*0.06,
                                  fontWeight: FontWeight.w700
                              ),)
                          ],
                        ),
                      );
                    },);
                },
                child: Container(
                  height: w*0.13,
                  width: w*0.42,
                  decoration: BoxDecoration(
                      color: Themes.primaryColor,
                      borderRadius: BorderRadius.circular(w*0.08)
                  ),
                  child: Center(
                    child: payment=="online"?Text("Proceed",
                      style: TextStyle(
                          fontSize: w*0.065,
                          color: Themes.secondaryColor,
                          fontWeight: FontWeight.w500
                      ),):Text("Confirm",
                      style: TextStyle(
                          fontSize: w*0.065,
                          color: Themes.secondaryColor,
                          fontWeight: FontWeight.w500
                      ),),
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
