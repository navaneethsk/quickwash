import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../images.dart';
import '../main.dart';
import '../themes.dart';

class addVehiclePage extends StatefulWidget {
  const addVehiclePage({super.key});

  @override
  State<addVehiclePage> createState() => _addVehiclePageState();
}

class _addVehiclePageState extends State<addVehiclePage> {

  File? _image;
  var imageUrl;

  pickImage() async {
    final picker = ImagePicker();
    final pickImage = await picker.pickImage(source: ImageSource.gallery);
    if(pickImage != null){
      setState(() {
        _image = File(pickImage.path);
      });

      var getimageurl =await  FirebaseStorage.instance.ref().child("uploads/${DateTime.now().toString()}").putFile(_image!);
      var imageUrl1 =await getimageurl.ref.getDownloadURL();
      imageUrl = imageUrl1;
      setState(()  {


      });
    }
  }




  var items=["Car","Bike","Truck","Caravan"];
  var dropDownValue;
  var dropDownModel;
  var dropDownCompany;
  bool check1=false;
  TextEditingController regNumController=TextEditingController();
  TextEditingController clientController = TextEditingController();

  List carCompany=["BMW","Mercedes","Ford","Land Rover","TATA","Maruti","Toyota","Hyundai"];

  Map <String,dynamic> vehicleModels={
    "BMW":["X5","X1","X3","3 series","7 series","5 series","X7","i4","M2","Z4","XM","8 series","i7"],
    "Mercedes":["AMG GT","G-class","E-class","GLE","C-class","A-class","S-class","GLA","GLS","SL"],
    "Ford":["Figo","Freestyle","Endeavour","Ecosport","Fiesta","Mustang"],
    "Land Rover":["Range Rover Evoque","Range rover sport","Discovery","Discovery sport","Defender","Range Rover velar"],
    "TATA":["Harrier","Nexon","Tiago","Altroz","Safari","Nexon EV","Tiago EV","Indigo"],
    "Maruti Suzuki":["Swift","Baleno","XL6","Fronx","Invicto","Brezza","Grand vittara","WagonR","Alto","Celerio"],
    "Toyota":["Glanza","Hyrider","Innova","Fortuner","Supra","Land cruiser","Hilux","Highlander"],
    "Hyundai":["i20","Grand i10 nios","Creta","Tuscon","Venue","Exter","Verna"],
  };

 var selectedCompany;
 var selectedModel;

  @override


  void initState() {
    clientController.text=currentUsername;
    selectedCompany=carCompany[0];
    selectedModel=vehicleModels[selectedCompany]![0];
    // TODO: implement initState
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text("Add vehicle",
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
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: w*1,
          padding: EdgeInsets.all(w*0.02),
          margin: EdgeInsets.only(left: w*0.01,bottom: w*0.1),
          child: Column(
            children: [

              InkWell(
                onTap: () {
                  pickImage();
                },
                child: Container(
                  height: w*0.3,
                  width: w*0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Themes.primaryColor),
                    borderRadius: BorderRadius.circular(w*0.02)
                  ),
                  child: imageUrl==null?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera,color: Themes.primaryColor,),
                      Text("Add",style: TextStyle(color: Themes.primaryColor),),
                      Text("Vehicle Image",style: TextStyle(color: Themes.primaryColor),)
                    ],
                  ):Container(
                    height: w*0.3,
                    width: w*0.3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Themes.primaryColor),
                        borderRadius: BorderRadius.circular(w*0.02),
                      image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover)
                    ),
                  ),


                ),
              ),
              SizedBox(
                height: w*0.02,
              ),
              SizedBox(
                width: w*1,
                height: w*1.5,
                child: Column(

                  children: [
                    Container(
                      width: w*1,
                      height: w*0.27,
                      margin: EdgeInsets.only(left: w*0.03,right: w*0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your vehicle type",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05
                            ),),
                          SizedBox(height: w*0.01,),
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
                              hint: Text("Car",style: TextStyle(
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

                        ],
                      ),
                    ),
                    Container(
                      width: w*1,
                      height: w*0.27,
                      margin: EdgeInsets.only(left: w*0.03,right: w*0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Company",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05
                            ),),
                          SizedBox(height: w*0.01,),
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
                              hint: Text("BMW",style: TextStyle(
                                  color: Themes.grey4
                              ),),
                              value:selectedCompany,
                              items: carCompany.map((dynamic company){
                                return DropdownMenuItem(
                                    value: company,
                                    child: Text(company,
                                      style: TextStyle(
                                          color: Themes.grey4),));
                              }
                              ).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCompany=value;
                                  selectedModel=vehicleModels[selectedCompany]![0];
                                });
                              },),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: w*1,
                      height: w*0.27,
                      margin: EdgeInsets.only(left: w*0.03,right: w*0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Model",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05
                            ),),
                          SizedBox(height: w*0.01,),
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
                              hint: Text("M5",style: TextStyle(
                                  color: Themes.grey4
                              ),),
                              value:selectedModel,
                              items: vehicleModels[selectedCompany]!.map<DropdownMenuItem<String>>((String model){
                                return DropdownMenuItem(
                                    value: model,
                                    child: Text(model,
                                      style: TextStyle(
                                          color: Themes.grey4),));
                              }
                              ).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedModel=value!;
                                });
                              },),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: w*1,
                      height: w*0.27,
                      margin: EdgeInsets.only(left: w*0.03,right: w*0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Reg. number",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05
                            ),),
                          SizedBox(height: w*0.01,),
                          Container(
                            height: w*0.14,
                            margin: EdgeInsets.only(left: w*0.03,right: w*0.01),
                            child: TextFormField(
                              controller: regNumController,
                              style: TextStyle(
                                  fontSize: w*0.04,
                                  color: Themes.grey4
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(w*0.03),
                                    borderSide: BorderSide(
                                        color: Themes.primaryColor
                                    )
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(w*0.03),
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
                      height: w*0.27,
                      margin: EdgeInsets.only(left: w*0.03,right: w*0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Client",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Themes.primaryColor,
                                fontSize: w*0.05
                            ),),
                          SizedBox(height: w*0.01,),
                          Container(
                            height: w*0.14,
                            margin: EdgeInsets.only(left: w*0.03,right: w*0.01),
                            child: TextFormField(
                              controller: clientController,
                              style: TextStyle(
                                  fontSize: w*0.04,
                                  color: Themes.grey4
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(w*0.03),
                                    borderSide: BorderSide(
                                        color: Themes.primaryColor
                                    )
                                ),
                                enabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(w*0.03),
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
                        Text("Set as default servicing",
                          style: TextStyle(
                              fontSize: w*0.032,
                              color: Themes.blue1,
                              fontWeight: FontWeight.w300
                          ),)
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: w*0.1,),
              InkWell(
                onTap: () {
                  if (regNumController.text!=null&&clientController.text!=null) {
                    FirebaseFirestore.instance.collection("user").doc(
                        currentUserId).update(
                       {
                         'vehicles': FieldValue.arrayUnion(
                             [
                               {
                                 "vehicle_img":imageUrl,
                                 "vehicle_type": dropDownValue,
                                 "company":dropDownCompany,
                                 "model": dropDownModel,
                                 "regnumber": regNumController.text,
                                 "client": clientController.text
                               }
                             ]
                         )
                       }
                    ).then((value) {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(w * 0.07),
                                topRight: Radius.circular(w * 0.07))
                        ),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: w * 1,
                            width: w * 1,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(Pictures.vehicleAdded,
                                    height: w * 0.5,
                                    width: w * 0.5),
                                Text("Vehicle added",
                                  style: TextStyle(
                                      color: Themes.primaryColor,
                                      fontSize: w * 0.06,
                                      fontWeight: FontWeight.w700
                                  ),)
                              ],
                            ),
                          );
                        },);
                      regNumController.clear();
                      clientController.clear();
                      dropDownValue="Car";
                      dropDownModel="M5";
                      imageUrl=null;
                    });



                  }
                  },
                child: Container(
                  height: w*0.13,
                  width: w*0.42,
                  decoration: BoxDecoration(
                      color: Themes.primaryColor,
                      borderRadius: BorderRadius.circular(w*0.08)
                  ),
                  child: Center(
                    child: Text("Add",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        width: w*0.17,
        height: w*0.3,
        margin: EdgeInsets.only(right: w*0.04,bottom: w*0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: w*0.02,left: w*0.02,right: w*0.02),
                child: SvgPicture.asset(Pictures.addMore)),
            Text("Add more",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Themes.primaryColor,
              fontSize: w*0.03
            ),)
          ],
        )
      ),

    );
  }
}
