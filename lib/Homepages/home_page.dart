import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:quickwash/Homepages/add_vehicle.dart';
import 'package:quickwash/Homepages/service_pages.dart';
import 'package:quickwash/Homepages/stepper_page.dart';
import 'package:quickwash/Homepages/take_a_slot_page.dart';
import 'package:quickwash/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../themes.dart';
import '../main.dart';
import 'notification.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int dataCount=0;
  TextEditingController searchController=TextEditingController();
  FocusNode _focusNode = FocusNode();
  int dotCount=0;
  int v=0;
  bool tap1 = false;
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        var color1= _focusNode.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Container(
        height:tap1?w*0.4: w*0.13,
        width: w*0.3,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor:  Colors.grey[100],
            onPressed: () {
              setState(() {
                tap1=true;
              });
            },
        child: tap1?Container(
          height: w*0.4,
          width: w*0.3,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: w*0.03,left: w*0.03,right: w*0.03),
                height: w*0.3,
                width: w*0.3,
                decoration: BoxDecoration(
                    color: Themes.primaryColor,
                    borderRadius: BorderRadius.circular(w*0.03)
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => takeSlotPage(),));
                      },
                      child: Container(
                        height: w*0.08,
                        width: w*0.26,
                        decoration: BoxDecoration(
                            color: Themes.secondaryColor,
                            borderRadius: BorderRadius.circular(w*0.06)
                        ),
                        child: Center(
                          child: Text("Take a slot",
                            style: TextStyle(
                                fontSize: w*0.03,
                                fontWeight: FontWeight.w400,
                                color: Themes.primaryColor
                            ),),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: w*0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => addVehiclePage(),));
                      },
                      child: Container(
                        height: w*0.08,
                        width: w*0.26,
                        decoration: BoxDecoration(
                            color: Themes.secondaryColor,
                            borderRadius: BorderRadius.circular(w*0.06)
                        ),
                        child: Center(
                          child: Text("Add vehicle",
                            style: TextStyle(
                                fontSize: w*0.03,
                                fontWeight: FontWeight.w400,
                                color: Themes.primaryColor
                            ),),
                        ),

                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: w*0.22,left: w*0.075,
                  child: CircleAvatar(
                    radius: w*0.07,
                    backgroundColor: Themes.primaryColor,
                    child: InkWell(
                      onTap: () {
                        tap1=false;
                        setState(() {

                        });
                      },
                      child: CircleAvatar(
                        radius: w*0.06,
                        child: SvgPicture.asset(Pictures.cross),
                      ),
                    ),
                  ))
            ],
          ),
        ):Row(
          children: [
            Container(
              padding: EdgeInsets.all(w*0.03),
              height: w*0.15,
              width: w*0.25,
              decoration: BoxDecoration(
                color: Themes.primaryColor,
                borderRadius: BorderRadius.circular(w*0.08)
              ),
              child: Row(
                children: [
                  SizedBox(width: w*0.01,),
                  Icon(Icons.add,
                  color: Themes.secondaryColor,),
                  SizedBox(width: w*0.01,),
                  Text("Add",
                  style: TextStyle(
                    color: Themes.secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: w*0.045,
                    letterSpacing: w*0.004
                  ),)
                ],
              ),
            ),
          ],
        ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(w*0.045),
          width: w*0.01,
          height: w*0.01,
          child: SvgPicture.asset(Pictures.menu),
        ),
        actions: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const notificationPage(),));
                  },
                  child: Stack(
                    children: [
                      Container(
                          width: w*0.073,
                          height: w*0.1,
                          child: SvgPicture.asset(Pictures.notification)),
                      Positioned(
                        left: w*0.032,
                        bottom: w*0.05,
                        child: CircleAvatar(
                          radius: w*0.02,
                          backgroundColor: Themes.primaryColor,
                          child: Center(
                            child: Text("0",
                            style: TextStyle(
                              fontSize: w*0.025,
                              fontWeight: FontWeight.w800,
                              color: Themes.secondaryColor
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          SizedBox(width: w*0.03,)
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: w*1,
          padding: EdgeInsets.only(left: w*0.04,right: w*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: w*0.02,),
              Container(
                color: Themes.secondaryColor,
                height: w*0.15,
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
              SizedBox(height: w*0.02,),
              Container(
                width: w*1,
                child: Text("offers",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Themes.primaryColor,
                  fontSize: w*0.06,
                  letterSpacing: w*0.002
                ),),
              ),
              Container(
                height: w*0.41,
                width: w*1,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("banner").snapshots(),
                  builder: (context, snapshot) {

                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var data = snapshot.data!.docs;
                    dotCount = data.length;

                    return CarouselSlider.builder(
                      itemCount: dotCount,
                      options: CarouselOptions(
                          aspectRatio: 1,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 1),
                          viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          v=index;
                          setState(() {

                          });
                        },
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.04),
                            image: DecorationImage(image: 
                            NetworkImage(data[index]['image']),fit: BoxFit.cover
                            )
                          ),
                          // child: Image.network(data[index]['image'],fit: BoxFit.cover,),
                        );
                      },
                    );
                  }
                ),
              ),
              SizedBox(height: w*0.02,),
              SizedBox(
                width: w*1,
                height: w*0.08,
                child: Column(
                  children: [
                    AnimatedSmoothIndicator(
                        activeIndex: v,
                        count: dotCount,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Themes.primaryColor,
                          dotHeight: w*0.02,

                        ),
                    )
                  ],
                ),
              ),
              SizedBox(height: w*0.02,),
              Text("Active request",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Themes.primaryColor,
                    fontSize: w*0.05,
                    letterSpacing: w*0.002
                ),),
              SizedBox(height: w*0.02,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => stepperPage(),));
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
              SizedBox(height: w*0.02,),
              Container(
                width: w*1,
                height: tap?w*0.73:w*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Service theme",
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
                          child: Text(tap?"view less":"view all",
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("services").snapshots(),
                        builder: (context, snapshot) {
                          var data = snapshot.data!.docs;
                          dataCount=data.length;
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                              itemCount: tap?dataCount:3,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                              mainAxisSpacing: w*0.04,
                                crossAxisSpacing: w*0.04,
                                childAspectRatio: 1
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => servicePage(id: data[index]['id'], name: data[index]['title'],)));
                                  },
                                  child: Container(
                                    height: w*0.20,
                                    width: w*0.20,
                                    color: Themes.secondaryColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: w*0.13,
                                          width: w*0.13,
                                          child: Image.network(data[index]['icon']),
                                        ),
                                        Text(data[index]['title'],

                                        style: TextStyle(
                                          fontSize: w*0.04,
                                          fontWeight: FontWeight.w500,
                                          color: Themes.blue3
                                        ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },);
                        }
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: w*0.03,),
              TextButton(
                onPressed: () => throw Exception(),
                child: const Text("Throw Test Exception"),
              ),
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
    );;
  }
}
