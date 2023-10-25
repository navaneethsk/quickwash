import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../images.dart';
import '../main.dart';
import '../themes.dart';

class cardPage extends StatefulWidget {
  const cardPage({super.key});

  @override
  State<cardPage> createState() => _cardPageState();
}

class _cardPageState extends State<cardPage> {
  bool tap = true;
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  TextEditingController cardNameController=TextEditingController();
  TextEditingController cardNumberController=TextEditingController();
  TextEditingController validThruController=TextEditingController();
  TextEditingController cvvController=TextEditingController();
  bool check1=false;
  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        var color1= _focusNode.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    _focusNode1.addListener(() {
      setState(() {
        var color1= _focusNode1.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    _focusNode2.addListener(() {
      setState(() {
        var color1= _focusNode2.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });
    _focusNode3.addListener(() {
      setState(() {
        var color1= _focusNode3.hasFocus?Themes.primaryColor:Themes.grey1;
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Themes.secondaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text("Payment",
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
      backgroundColor: Themes.secondaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: w*2,
          width: w*1,
          padding: EdgeInsets.all(w*0.02),
          margin: EdgeInsets.only(left: w*0.01,bottom: w*0.1),
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardNumberController.text,
                expiryDate: validThruController.text,
                cardHolderName: cardNameController.text,
                cvvCode: cvvController.text,
                cardBgColor: Colors.black,
                glassmorphismConfig: Glassmorphism.defaultConfig(),
                backgroundImage: "images/credit.png",
                // labelValidThru: 'VALID\nTHRU',
                obscureCardNumber: false,
                // obscureInitialCardNumber: false,
                // obscureCardCvv: true,
                // isHolderNameVisible: false,
                // height: 175,
                // textStyle: TextStyle(color: Colors.yellowAccent),
                // width: w,
                // isChipVisible: true,
                // isSwipeGestureEnabled: true,
                // animationDuration: Duration(milliseconds: 1000),
                // frontCardBorder: Border.all(color: Colors.grey),
                // backCardBorder: Border.all(color: Colors.grey),
                // customCardIcons: <CustomCardTypeImage>[
                //   CustomCardTypeImage(
                //     cardType: CardType.mastercard,
                //     cardImage: Image.asset(
                //       'assets/mastercard.png',
                //       height: 48,
                //       width: 48,
                //     ),
                //   ),
                // ],
                showBackView:false,
                onCreditCardWidgetChange: (CreditCardBrand ) {  },
              ),
              SizedBox(height: w*0.08,),
              Container(
                color: Themes.secondaryColor,
                height: w*0.15,
                width: w*0.9,
                margin: EdgeInsets.only(left: w*0.04,right: w*0.04),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  controller: cardNameController,
                  autofocus: false,
                  focusNode: _focusNode,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: w*0.04,
                      color: Themes.primaryColor
                  ),
                  decoration: InputDecoration(
                      labelText: "Cardholder name",
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
              SizedBox(height: w*0.08,),
              Container(
                color: Themes.secondaryColor,
                height: w*0.15,
                width: w*0.9,
                margin: EdgeInsets.only(left: w*0.04,right: w*0.04),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cardNumberController,
                  obscureText: tap?true:false,
                  obscuringCharacter: "*",
                  autofocus: false,
                  focusNode: _focusNode1,
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
                          child: Icon(tap?Icons.visibility_off:Icons.remove_red_eye)),
                      labelText: "Card number",
                      labelStyle: TextStyle(
                          fontSize: w*0.05,
                          color: _focusNode1.hasFocus?Themes.primaryColor:Themes.grey1
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
              SizedBox(height: w*0.08,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Themes.secondaryColor,
                    height: w*0.16,
                    width: w*0.35,
                    margin: EdgeInsets.only(left: w*0.04,right: w*0.04),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: validThruController,
                      autofocus: false,
                      focusNode: _focusNode2,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w*0.04,
                          color: Themes.primaryColor
                      ),
                      decoration: InputDecoration(
                          labelText: "Valid thru",
                          labelStyle: TextStyle(
                              fontSize: w*0.05,
                              color: _focusNode2.hasFocus?Themes.primaryColor:Themes.grey1
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
                  Container(
                    color: Themes.secondaryColor,
                    height: w*0.16,
                    width: w*0.35,
                    margin: EdgeInsets.only(left: w*0.04,right: w*0.04),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: cvvController,
                      autofocus: false,
                      focusNode: _focusNode3,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w*0.04,
                          color: Themes.primaryColor
                      ),
                      decoration: InputDecoration(
                          labelText: "cvv",
                          labelStyle: TextStyle(
                              fontSize: w*0.05,
                              color: _focusNode3.hasFocus?Themes.primaryColor:Themes.grey1
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
                ],
              ),
              SizedBox(height: w*0.06,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    side: BorderSide(
                        color: Themes.primaryColor,
                        width: 3.0
                    ),
                    checkColor: Themes.primaryColor,
                    value: check1,
                    onChanged: (value) {
                      setState(() {
                        check1=value!;
                      });
                    },),
                  Text("Set as default card",
                    style: TextStyle(
                        fontSize: w*0.032,
                        color: Themes.blue1,
                        fontWeight: FontWeight.w300
                    ),)
                ],
              ),
              SizedBox(height: w*0.15,),
              InkWell(
                onTap: () {
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
                            Text("Payment Successful",
                              style: GoogleFonts.poppins(
                                  color: Themes.primaryColor,
                                  fontSize: w*0.06,
                                  fontWeight: FontWeight.w700,
                              ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Booking ID",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: w*0.04,
                                  color: Themes.primaryColor
                                ),),
                                Text("-#24352",
                                style: GoogleFonts.poppins(
                                  fontSize: w*0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Themes.primaryColor
                                ),)
                              ],
                            )
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
                    child: Text("Confirm",
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
