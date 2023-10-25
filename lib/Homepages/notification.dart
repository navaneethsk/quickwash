import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickwash/images.dart';
import 'package:quickwash/themes.dart';

import '../main.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({super.key});

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  List data=[
    {
      "text": "The prowash of maruthi-6H had completed successfully",
      "textStyle": TextStyle(
          color: Themes.grey4,
          fontSize: w*0.046,
          fontWeight: FontWeight.w400
      ),
    },
    {
      "text": "The prowash of maruthi-6H have some terrible",
      "textStyle": TextStyle(
          color: Themes.grey4,
          fontSize: w*0.046,
          fontWeight: FontWeight.w400
      ),
    },
    {
      "text": "The prowash of maruthi-6H had completed successfully",
      "textStyle": TextStyle(
          color: Themes.grey4,
          fontSize: w*0.046,
          fontWeight: FontWeight.w400
      ),
    }
  ];
  List data1=[
    {
      "text": "The prowash of maruthi-6H had completed successfully ",
      "textStyle": TextStyle(
          color: Themes.grey4,
          fontSize: w*0.046,
          fontWeight: FontWeight.w400
      ),
    },
    {
      "text": "The prowash of maruthi-6H had completed successfully ",
      "textStyle": TextStyle(
          color: Themes.grey4,
          fontSize: w*0.046,
          fontWeight: FontWeight.w400
      ),
    },
    {
      "text": "The prowash of maruthi-6H had completed successfully",
      "textStyle": TextStyle(
          color: Themes.grey4,
          fontSize: w*0.046,
          fontWeight: FontWeight.w400
      ),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text("Notifications",
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
      body: Container(
        height: w*2,
        width: w*1,
        child: Column(
          children: [
            Container(
              height: w*0.9,
              width: w*1,
              // color: Colors.tealAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: w*0.06,right: w*0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today",
                        style: TextStyle(
                          color: Themes.primaryColor,
                          fontSize: w*0.055,
                          fontWeight: FontWeight.w600
                        ),),
                        Text("clear all",
                        style: TextStyle(
                          fontSize: w*0.03,
                          color: Themes.blue2,
                          fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Dismissible(

                          background: Container(
                            padding: EdgeInsets.all(w*0.03),
                            height: w*0.25,
                            width: w*0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Delete",
                                style: TextStyle(
                                  fontSize: w*0.02,
                                  fontWeight: FontWeight.w600,
                                  color: Themes.primaryColor
                                ),),
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            padding: EdgeInsets.all(w*0.03),
                            height: w*0.25,
                            width: w*0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("View",
                                  style: TextStyle(
                                      fontSize: w*0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Themes.primaryColor
                                  ),),
                              ],
                            ),
                          ),
                          key: UniqueKey(),

                          child: Container(
                            padding: EdgeInsets.all(w*0.03),
                            height: w*0.25,
                            width: w*1,
                            color: Themes.secondaryColor,
                            child:Center(
                              child: Container(
                                width: w*0.7,
                                child: Text(data[index]["text"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: data[index]["textStyle"]
                                ),
                              ),
                            ) ,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: w*0.01,
                        );
                      }, )

                ],
              ),
            ),
            Container(
              height: w*0.9,
              width: w*1,
              // color: Colors.tealAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: w*0.06,right: w*0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Yesterday",
                          style: TextStyle(
                              color: Themes.primaryColor,
                              fontSize: w*0.055,
                              fontWeight: FontWeight.w600
                          ),),
                        Text("clear all",
                          style: TextStyle(
                              fontSize: w*0.03,
                              color: Themes.blue2,
                              fontWeight: FontWeight.w500
                          ),)
                      ],
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: data1.length,
                    itemBuilder: (context, index) {
                      return Dismissible(

                        background: Container(
                          padding: EdgeInsets.all(w*0.03),
                          height: w*0.25,
                          width: w*0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Delete",
                                style: TextStyle(
                                    fontSize: w*0.02,
                                    fontWeight: FontWeight.w600,
                                    color: Themes.primaryColor
                                ),),
                            ],
                          ),
                        ),
                        secondaryBackground: Container(
                          padding: EdgeInsets.all(w*0.03),
                          height: w*0.25,
                          width: w*0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View",
                                style: TextStyle(
                                    fontSize: w*0.02,
                                    fontWeight: FontWeight.w600,
                                    color: Themes.primaryColor
                                ),),
                            ],
                          ),
                        ),
                        key: UniqueKey(),

                        child: Container(
                          padding: EdgeInsets.all(w*0.03),
                          height: w*0.25,
                          width: w*1,
                          color: Themes.secondaryColor,
                          child:Center(
                            child: Container(
                              width: w*0.7,
                              child: Text(data1[index]["text"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: data1[index]["textStyle"]
                              ),
                            ),
                          ) ,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: w*0.01,
                      );
                    }, )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
