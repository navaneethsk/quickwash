import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../images.dart';
import '../main.dart';
import '../themes.dart';

class orderDetailsPage extends StatefulWidget {
  const orderDetailsPage({super.key});

  @override
  State<orderDetailsPage> createState() => _orderDetailsPageState();
}

class _orderDetailsPageState extends State<orderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text("Order details",
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
      backgroundColor:  Colors.grey[100],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: w*2,
          width: w*1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: w*0.45,
                width: w*1,
                margin: EdgeInsets.only(top: w*0.02,left: w*0.06,right: w*0.06),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.02),
                ),
                child: Image.asset(Pictures.carBig),
              ),
              Container(
                height: w*0.42,
                width: w*0.7,
                margin: EdgeInsets.only(top: w*0.02,left: w*0.09),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Vehicle",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Themes.primaryColor,
                          fontSize: w*0.05,
                          letterSpacing: w*0.002
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Vehicle",
                        style: TextStyle(
                          color: Themes.grey4,
                          fontSize: w*0.04,
                          fontWeight: FontWeight.w400
                        ),),
                        Container(
                          width: w*0.37,
                          child: Text(": Car",
                          style: TextStyle(
                            color: Themes.grey4,
                            fontSize: w*0.04,
                            fontWeight: FontWeight.w400
                          ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Model",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.37,
                          child: Text(": M5",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reg. number",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.37,
                          child: Text(": KL-53 SG 4357",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Client",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.37,
                          child: Text(": Navaneeth",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phone",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.37,
                          child: Text(": +624 76597 26",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: w*0.02,left: w*0.09),
                height: w*0.15,
                width: w*0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service details",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Themes.primaryColor,
                          fontSize: w*0.05,
                          letterSpacing: w*0.002
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Service",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.23,
                          child: Text(": Prowash",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              Container(
                height: w*0.23,
                width: w*0.6,
                margin: EdgeInsets.only(top: w*0.02,left: w*0.09),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Slot date",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Themes.primaryColor,
                          fontSize: w*0.05,
                          letterSpacing: w*0.002
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.26,
                          child: Text(": 26/03/2023",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.26,
                          child: Text(": 09:00am",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: w*0.3,
                width: w*0.76,
                margin: EdgeInsets.only(top: w*0.02,left: w*0.09),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment details",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Themes.primaryColor,
                          fontSize: w*0.05,
                          letterSpacing: w*0.002
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment method",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.4,
                          child: Text(": online payment",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment status",
                          style: TextStyle(
                              color: Themes.grey4,
                              fontSize: w*0.04,
                              fontWeight: FontWeight.w400
                          ),),
                        Container(
                          width: w*0.4,
                          child: Text(": payment completed",
                            style: TextStyle(
                                color: Themes.grey4,
                                fontSize: w*0.04,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
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
