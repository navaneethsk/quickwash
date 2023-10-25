import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../images.dart';
import '../main.dart';
import '../themes.dart';

class stepperPage extends StatefulWidget {
  const stepperPage({super.key});

  @override
  State<stepperPage> createState() => _stepperPageState();
}

class _stepperPageState extends State<stepperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text("Active request",
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
    );
  }
}
