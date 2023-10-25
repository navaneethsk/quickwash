import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../images.dart';
import '../main.dart';
import '../themes.dart';

class servicePage extends StatefulWidget {
  final String id;
  final String name;
  const servicePage({super.key, required this.id, required this.name});

  @override
  State<servicePage> createState() => _servicePageState();
}

class _servicePageState extends State<servicePage> {
  bool check=true;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("services").doc(widget.id).snapshots(),
      builder: (context, snapshot) {
        var data = snapshot.data;
        return Scaffold(
          appBar:  AppBar(
            backgroundColor:Colors.grey[50],
            elevation: 0,
            centerTitle: true,
            title: Text(data?['title'],
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: w,
              child: Column(
                children: [
                  Container(
                    height: w*0.5,
                    width: w,
                    padding: EdgeInsets.all(w*0.045),
                      child: Image.network(data?['image'],fit: BoxFit.cover,)),
                  Text(data?['motto'],

                  style: TextStyle(
                    fontSize: w*0.055,
                    fontWeight: FontWeight.w700,
                    color: Themes.primaryColor
                  ),

                  ),
                  Container(
                    height: w*0.4,
                    width: w,

                    padding: EdgeInsets.only(left: w*0.06,right: w*0.06),
                    child: Text(data?['description'],
                    maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: w*0.044,
                      fontWeight: FontWeight.w400,
                      color: Themes.grey4
                    ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: w*0.03),
                    width: w,
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount:data?['services'].length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {

                          return Row(

                            children: [
                              Checkbox(
                                  value: check,
                                  onChanged:(value) {
                                  },
                                activeColor: Themes.checkBoxGrey,
                              ),
                              SizedBox(width: w*0.02,),
                              Text(data?['services'][index],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: w*0.04,
                                color:Themes.checkBoxGrey
                              ),
                              )
                            ],

                          );

                        },),
                  ),
                  SizedBox(height: w*0.02,),
                  Container(
                    height: w*0.14,
                    width: w,
                    color: Themes.secondaryColor,
                    padding: EdgeInsets.only(left: w*0.06,top: w*0.02),
                    child: Row(
                      children: [
                        Text("\$ ${data?['amount']}",

                          style: TextStyle(
                            fontSize: w*0.055,
                            fontWeight: FontWeight.w600,
                            color: Themes.amtBlack
                          ),

                        ),
                        SizedBox(width: w*0.015,),
                        Text("only",

                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.04,
                            color: Themes.amtBlack
                          ),

                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: w*0.1,
                  ),
                  Container(
                    height: w*0.13,
                    width: w*0.42,
                    decoration: BoxDecoration(
                        color: Themes.primaryColor,
                        borderRadius: BorderRadius.circular(w*0.08)
                    ),
                    child: Center(
                      child: Text("Book",
                        style: TextStyle(
                            fontSize: w*0.065,
                            color: Themes.secondaryColor,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),



                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
