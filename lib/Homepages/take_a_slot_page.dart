import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickwash/Homepages/add_vehicle.dart';
import 'package:quickwash/Homepages/take_slot.dart';

import '../images.dart';
import '../main.dart';
import '../themes.dart';
import 'dart:io';

class takeSlotPage extends StatefulWidget {
  const takeSlotPage({super.key});

  @override
  State<takeSlotPage> createState() => _takeSlotPageState();
}

class _takeSlotPageState extends State<takeSlotPage> {
  bool tap=false;
  bool a=false;
  bool b=false;
  bool c=false;
  List<Map> data = [
    {
      "images":Image.asset(Pictures.carwash3),
      "text":Text("Quick wash",
        style: TextStyle(
            fontSize: w*0.04,
            color: Themes.blue3,
            fontWeight: FontWeight.w500
        ),)
    },
    {
      "images":Image.asset(Pictures.carwash2),
      "text":Text("Power wash",
        style: TextStyle(
            fontSize: w*0.04,
            color: Themes.blue3,
            fontWeight: FontWeight.w500
        ),)
    },
    {
      "images":Image.asset(Pictures.carwash1),
      "text":Text("Pro wash",
        style: TextStyle(
            fontSize: w*0.04,
            color: Themes.blue3,
            fontWeight: FontWeight.w500
        ),)
    },
    {
      "images":Image.asset(Pictures.carwash2),
      "text":Text("Power wash",
        style: TextStyle(
            fontSize: w*0.04,
            color: Themes.blue3,
            fontWeight: FontWeight.w500
        ),)
    },
    {
      "images":Image.asset(Pictures.carwash1),
      "text":Text("Quick wash",
        style: TextStyle(
            fontSize: w*0.04,
            color: Themes.blue3,
            fontWeight: FontWeight.w500
        ),)
    },
  ];

  var items=[
    "Car-M5-KL-53 SG 4357", "Car- ShiftM5 KL-10 AB 4357"
  ];

  File? _image;

  pickImage() async {
    final picker = ImagePicker();
    final pickImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickImage != null){
      setState(() {
        _image = File(pickImage.path);
      });
    }
  }

   String dropDownValue="Car-M5-KL-53 SG 4357";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text("Booking",
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
        child: Container(
          width: w*1,
          padding: EdgeInsets.all(w*0.02),
          margin: EdgeInsets.only(left: w*0.01),
          child: Column(
            children: [
              Container(
                width: w*1,
                height: w*0.4,
                  // color: Colors.tealAccent,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service vehicle",
                    style: TextStyle(
                      color: Themes.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.048
                    ),),
                    Container(
                      margin: EdgeInsets.only(left: w*0.035),
                      height: w*0.14,
                      width:w*0.82,
                      decoration: BoxDecoration(
                        border: Border.all(color: Themes.primaryColor),
                        borderRadius: BorderRadius.circular(w*0.03)
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        padding: EdgeInsets.only(right: w*0.04,left: w*0.04),
                        underline: Container(),
                        icon:  Container(
                            height: w*0.035,
                            width: w*0.035,
                            child: SvgPicture.asset(Pictures.dropdownArrow)),
                        hint: Text("Car-M5-KL-53 SG 4357",style: TextStyle(
                          color: Themes.grey4
                        ),),
                          value:dropDownValue,
                          items: items.map((String items){
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items,
                                  style: TextStyle(
                                      color: Themes.grey4),));
                          }
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropDownValue=value!;
                            });
                          },),
                    ),
                    SizedBox(height: w*0.033,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => addVehiclePage(),));
                          },
                          child: Container(
                            width: w*0.33,
                            height: w*0.12,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(w*0.08),
                                border: Border.all(color: Themes.primaryColor)
                            ),
                            child: Center(
                                child:
                                Text("Add another",
                                  style: TextStyle(
                                      color: Themes.primaryColor,
                                      fontSize: w*0.05,
                                      fontWeight: FontWeight.w600
                                  ),)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: w*0.02,
              ),
              Container(
                width: w*1,
                height: w*0.634,
                 // color: Colors.tealAccent,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.058),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Add image",style: TextStyle(
                          color: Themes.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: w*0.05
                        ),),
                        SizedBox(width: w*0.01,),
                        Text("(optional)",style: TextStyle(
                            color: Themes.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: w*0.04
                        ),)
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        pickImage();
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: w*0.55,
                            width: w*1,
                            margin: EdgeInsets.only(left: w*0.04),
                            color: Themes.secondaryColor,
                            child:_image == null?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: w*0.17,
                                  width: w*0.17,
                                  margin: EdgeInsets.all(w*0.03),
                                  child: Image.asset(Pictures.uploadImage),
                                ),
                                Text("Upload your vehicle image",
                                style: TextStyle(
                                  color: Themes.grey5,
                                  fontWeight: FontWeight.w700
                                ),)
                              ],
                            )
                            :
                                Image.file(_image!)
                            ,
                          ),
                      _image==null?Container():    Positioned(

                              right: 0,

                              child: IconButton(onPressed: (){
                                setState(() {
                                  _image=null;
                                });
                              }, icon: Icon(Icons.delete,color: Colors.red,)))
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: w*0.02,
              ),
              Container(
                width: w*1,
                height: tap?w*0.73:w*0.4,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.058),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pick a service",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: w*0.05,
                              color: Themes.primaryColor
                          ),),
                        InkWell(
                          onTap: () {
                            tap=!tap;
                            setState(() {

                            });
                          },
                          child: Text("view all",
                            style: TextStyle(
                                fontSize: w*0.03,
                                color: Themes.blue2
                            ),),
                        )
                      ],
                    ),
                    SizedBox(height: w*0.02,),
                    Container(
                      height: tap?w*0.6:w*0.28,
                      width: w*1,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: tap?data.length:3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: w*0.04,
                            crossAxisSpacing: w*0.04,
                            childAspectRatio: 1
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: w*0.20,
                            width: w*0.20,
                            color: Themes.secondaryColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: w*0.13,
                                  width: w*0.13,
                                  child: data[index]["images"],
                                ),
                                data[index]["text"]
                              ],
                            ),
                          );
                        },),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: w*0.02,
              ),
              Container(
                height: w*0.55,
                width: w,
                // color: Colors.tealAccent,
                margin: EdgeInsets.only(left: w*0.03,right: w*0.058),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Pick a service",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: w*0.05,
                              color: Themes.primaryColor
                          ),),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        a=!a;
                        setState(() {

                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(w*0.02),
                        height: w*0.12,
                        width: w*1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.02),
                          border: Border.all(color: Themes.primaryColor),
                          color: a?Themes.containerGrey:Colors.grey[100]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("On site",
                            style: TextStyle(
                              color: Themes.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: w*0.05
                            ),),
                            a?Container(
                                margin: EdgeInsets.all(w*0.013),
                                child: SvgPicture.asset(Pictures.checkMark)):Container()
                          ],
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: () {
                        b=!b;
                        setState(() {

                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(w*0.02),
                        height: w*0.12,
                        width: w*1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.02),
                            border: Border.all(color: Themes.primaryColor),
                            color: b?Themes.containerGrey:Colors.grey[100]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Self visit",
                              style: TextStyle(
                                  color: Themes.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.05
                              ),),
                            b?Container(
                                margin: EdgeInsets.all(w*0.013),
                                child: SvgPicture.asset(Pictures.checkMark)):Container()
                          ],
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: () {
                        c=!c;
                        setState(() {

                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(w*0.02),
                        height: w*0.12,
                        width: w*1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.02),
                            border: Border.all(color: Themes.primaryColor),
                            color: c?Themes.containerGrey:Colors.grey[100]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pick up and drop",
                              style: TextStyle(
                                  color: Themes.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.05
                              ),),
                            c?Container(
                                margin: EdgeInsets.all(w*0.013),
                                child: SvgPicture.asset(Pictures.checkMark)):Container()
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: w*0.07,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => takeSlot(),));
                },
                child: Container(
                  width: w*0.35,
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
    );
  }
}
