import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickwash/paymentPages/payment_page.dart';
import 'package:quickwash/images.dart';
import 'package:quickwash/themes.dart';

import '../main.dart';

class takeSlot extends StatefulWidget {
  const takeSlot({super.key});

  @override
  State<takeSlot> createState() => _takeSlotState();
}

class _takeSlotState extends State<takeSlot> {
  TextEditingController noteController=TextEditingController();
  TextEditingController locationController=TextEditingController();
  int slot=0;
  var days=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20",
  "21","22","23","24","25","26","27","28","29","30","31"];
  String dayValue= "12";
  var months=["1","2","3","4","5","6","7","8","9","10","11","12"];
  var monthValue="10";
  var years =["2022","2023","2024","2025","2026","2027","2028","2029","2030"];
  String yearValue="2022";
  var time=["09:00am","10:00am","11:00am","12:00pm","01:00pm","03:00pm","04:00pm","05:00pm"];
  bool tap=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Take a slot",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: w*0.06,
          color: Themes.primaryColor
        ),),
        elevation: 0,
        backgroundColor: Colors.grey[100],
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
        child: Container(
          height: w*2,
          width: w*1,
          padding: EdgeInsets.all(w*0.02),
          margin: EdgeInsets.only(left: w*0.01),
          child: Column(
            children: [
              Container(
                // color: Colors.tealAccent,
                width: w*1,
                height: w*0.26,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Take a date",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Themes.primaryColor,
                      fontSize: w*0.05
                    ),),
                    SizedBox(height: w*0.02,),
                    SizedBox(
                      width: w*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: w*0.08,
                              width: w*0.08,
                              child: SvgPicture.asset(Pictures.calender)),
                          Container(
                            height: w*0.135,
                            width: w*0.15,
                            padding: EdgeInsets.all(w*0.02),
                            decoration: BoxDecoration(
                              border: Border.all(color: Themes.primaryColor),
                              borderRadius: BorderRadius.circular(w*0.02)
                            ),
                            child: DropdownButton(
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Themes.grey4,
                                fontSize: w*0.04
                              ),
                              menuMaxHeight: w*0.5,
                                isExpanded: true,
                                icon:  Container(
                                    height: w*0.03,
                                    width: w*0.03,
                                    child: SvgPicture.asset(Pictures.dropdownArrow)),
                              underline: Container(),
                              value: dayValue,
                              onChanged:(value) {
                                setState(() {
                                  dayValue=value!;
                                });
                              },
                              items: days.map((String days){
                                return DropdownMenuItem(
                                    value: days,
                                    child: Text(days,
                                    style: TextStyle(
                                      color: Themes.grey4
                                    ),));
                              }).toList()
                            ),
                          ),
                          Container(
                            height: w*0.135,
                            width: w*0.17,
                            padding: EdgeInsets.all(w*0.03),
                            decoration: BoxDecoration(
                                border: Border.all(color: Themes.primaryColor),
                                borderRadius: BorderRadius.circular(w*0.02)
                            ),
                            child: DropdownButton(
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Themes.grey4,
                                    fontSize: w*0.04
                                ),
                                menuMaxHeight: w*0.5,
                                isExpanded: true,
                                icon:  Container(
                                    height: w*0.03,
                                    width: w*0.03,
                                    child: SvgPicture.asset(Pictures.dropdownArrow)),
                                underline: Container(),
                                value: monthValue,
                                onChanged:(value) {
                                  setState(() {
                                    monthValue=value!;
                                  });
                                },
                                items: months.map((String months){
                                  return DropdownMenuItem(
                                      value: months,
                                      child: Text( months,
                                        style: TextStyle(
                                            color: Themes.grey4
                                        ),));
                                }).toList()
                            ),
                          ),
                          Container(
                            height: w*0.135,
                            width: w*0.26,
                            padding: EdgeInsets.all(w*0.03),
                            decoration: BoxDecoration(
                                border: Border.all(color: Themes.primaryColor),
                                borderRadius: BorderRadius.circular(w*0.02)
                            ),
                            child: DropdownButton(
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Themes.grey4,
                                    fontSize: w*0.04
                                ),
                                menuMaxHeight: w*0.5,
                                isExpanded: true,
                                icon:  Container(
                                    height: w*0.03,
                                    width: w*0.03,
                                    child: SvgPicture.asset(Pictures.dropdownArrow)),
                                underline: Container(),
                                value: yearValue,
                                onChanged:(value) {
                                  setState(() {
                                    yearValue=value!;
                                  });
                                },
                                items: years.map((String years){
                                  return DropdownMenuItem(
                                      value: years,
                                      child: Text(years,
                                        style: TextStyle(
                                            color: Themes.grey4
                                        ),));
                                }).toList()
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),),
              Container(
                width: w*1,
                height: w*0.62,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pick slot",
                    style: TextStyle(
                      color: Themes.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.05
                    ),),
                    Container(
                      width: w*1,
                      height: w*0.53,
                      padding: EdgeInsets.all(w*0.03),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: time.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: w*0.04,
                            crossAxisSpacing: w*0.04,
                            childAspectRatio: 1.9
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                              });
                              slot=index;
                            },
                            child: Container(
                              height: w*0.03,
                              width: w*0.24,
                              decoration: BoxDecoration(
                                  color: index==slot?Themes.timeGrey:Colors.grey[100],
                                  borderRadius: BorderRadius.circular(w*0.02),
                                  border: Border.all(color: Themes.primaryColor)
                              ),
                              child: Center(
                                child: Text(time[index],
                                  style: TextStyle(
                                      color: index==slot?Themes.primaryColor:Themes.grey4,
                                      fontSize: w*0.05,
                                      fontWeight: FontWeight.w500
                                  ),),
                              ),
                            ),
                          );
                        },),
                    )
                  ],
                ),
              ),
              Container(
                width: w*1,
                height: w*0.4,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Add your note",
                        style: TextStyle(
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w600,
                          color: Themes.primaryColor
                        ),),
                        SizedBox(width: w*0.01,),
                        Text("(optional)",
                        style: TextStyle(
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: w*0.034
                        ),)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: w*0.02,right: w*0.02),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        controller: noteController,
                        style: TextStyle(
                          fontSize: w*0.04,
                          color: Themes.grey4
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Themes.primaryColor
                            )
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Themes.primaryColor
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: w*1,
                height: w*0.25,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add your location",
                      style: TextStyle(
                          fontSize: w*0.05,
                          fontWeight: FontWeight.w600,
                          color: Themes.primaryColor
                      ),),
                    Container(
                      height: w*0.13,
                      margin: EdgeInsets.only(left: w*0.02,right: w*0.02),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: locationController,
                        style: TextStyle(
                            fontSize: w*0.04,
                            color: Themes.grey4
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Themes.primaryColor
                              )
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Themes.primaryColor
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: w*0.08,
                width: w*0.27,
                decoration: BoxDecoration(
                  border: Border.all(color: Themes.primaryColor),
                  borderRadius: BorderRadius.circular(w*0.08)
                ),
                child: Center(
                  child: Text("From saved",
                  style: TextStyle(
                    color: Themes.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: w*0.04
                  ),),
                ),
              ),
              SizedBox(
                height: w*0.07,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const paymentPage(),));
                },
                child: Container(
                  height: w*0.13,
                  width: w*0.42,
                  decoration: BoxDecoration(
                    color: Themes.primaryColor,
                    borderRadius: BorderRadius.circular(w*0.08)
                  ),
                  child: Center(
                    child: Text("Payment",
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
