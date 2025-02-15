import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:milk_collecting_app/Models/sub_record.dart';
import 'package:milk_collecting_app/api_urls/ApiUrl.dart';
import 'package:milk_collecting_app/controllers/record_controller.dart';
import 'package:milk_collecting_app/screens/home_page.dart';
import 'package:milk_collecting_app/screens/home_screen.dart';
import 'package:milk_collecting_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'colors.dart';



class CurrentCollection extends StatefulWidget {
  @override
  _CurrentCollectionState createState() => _CurrentCollectionState();
}

class _CurrentCollectionState extends State<CurrentCollection> {

   final RecordController _recordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      appBar: getAppBar(),

    );
  }

  getBody(){
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 25),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Average details",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),),


                    ],
                  ),




                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: Colors.purpleAccent,width: 5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Total price",
                            style: TextStyle(
                                color: black.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),),
                          SizedBox(height: 10,),
                          Text("${_recordController.price} lkr",
                            style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),),
                        ],
                      ),
                    ),




                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  Container(
                    width: ((size.width)/2)-30,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purpleAccent,width: 3),
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      primary,
                                      Colors.purple,
                                    ]
                                ),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Icon(
                                Ionicons.md_stats,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Average Fat rate(%)",
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),),
                              SizedBox(height: 10,),
                              Text(_recordController.fat_rate.toStringAsFixed(0),
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),),
                            ],
                          )



                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: ((size.width)/2)-30,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purpleAccent,width: 3),
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      primary,
                                      Colors.purple,
                                    ]
                                ),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Icon(
                                Ionicons.md_stats,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Average pH",
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),),
                              SizedBox(height: 10,),
                              Text(_recordController.ph_value.toStringAsFixed(2),
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),),
                            ],
                          )



                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: ((size.width)/2)-30,
                    height: 200,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: Colors.purpleAccent,width: 3),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      primary,
                                      Colors.purple,
                                    ]
                                ),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Icon(
                                Ionicons.md_stats,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Average Density(gcm-3)",
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),),
                              SizedBox(height: 10,),
                              Text(_recordController.density.toStringAsFixed(2),
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),),
                            ],
                          )



                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: ((size.width)/2)-30,
                    height: 200,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: Colors.purpleAccent,width: 3),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      primary,
                                      Colors.purple,
                                    ]
                                ),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Icon(
                                Ionicons.md_stats,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Total Volume(Litre)",
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),),
                              SizedBox(height: 10,),
                              Text(_recordController.volume.toString(),
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),),
                            ],
                          ),





                        ],
                      ),
                    ),
                  )



                ]),
          ),

          SizedBox(height: 20,),



          GestureDetector(
            onTap: (){
              _uploadData();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      colors: [
                        primary,
                        Colors.purple,
                      ]
                  ),
                ),
                child: Center(
                  child: Text(
                    "Upload Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ),


          SizedBox(height: 20,),


        ],
      ),
    );

  }

  getAppBar() {


    return AppBar(
      leading: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.settings,color: Colors.purple,size: 35,),
        )
      ],
    );



  }



  void _uploadData() async{

          Timer(Duration(seconds: 3), (){
           showSnack("Uploaded successfully");

          });


    
    /*
    
    var _subRecordList = [];
     List<SubRecord> _subRecords = _recordController.subRecords;

     for (var subrecord in _subRecords) {

       double ph = subrecord.ph_value;
       double fat = subrecord.fat_rate;
       double den = subrecord.density;
       int vol = subrecord.volume;
       int price = subrecord.price;
       double temp = subrecord.temperature;
       String grade = subrecord.grade;


      var _record = {
          "ph_value" : ph.toString(),
          "fat_rate" : fat.toString(),
          "density": den.toString(),
          "volume": vol.toString(),
          "price_rate": price.toString(),
          "temperature": temp.toString(),
          "grade": grade
       };

      _subRecordList.add(_record);


     }
     
    

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    
    //var collector_id = sharedPreferences.getInt("id");

    var user_id =  1; //authenticated user id(collector)
    var farmer_id = 1; //connected farmer iod
    
    double ph_value = _recordController.ph_value;
    double density = _recordController.density;
    int fat_value = _recordController.fat_rate.toInt();
    var total_volume = _recordController.volume;
    var total_price = _recordController.price;
    double temperature = _recordController.average_temperature;
    int device_id = 1;
    String note = "test note";
    

   var data = {
             
            "farmer_id": farmer_id.toString(),
            'user_id': user_id.toString(),
            'ph_value': ph_value.toString(),
            'density' : density.toString(),
            'total_volume': total_volume.toString(),
            'fat_rate': fat_value.toString(),
            'temperature': temperature.toString(),
            'device_id': device_id.toString(),
            'total_price': total_price.toString(),
            'note': note,
            
          
             };



var client = http.Client();

try {

   //upload daily record
        var uriResponse = await client.post(Uri.parse(ApiUrl.ADD_DAILY_URL),
      body: data);

  var jsonString = uriResponse.body;
 
  var body_ = jsonDecode(jsonString);
  print(body_);
  
  
//upload sub records
 for(int i=0;i<_subRecordList.length;i++){
  
 var sub_record = {
          "ph_value" : _subRecordList[i]['ph_value'].toString(),
          "fat_rate" : _subRecordList[i]['ph_value'].toString(),
          "density": _subRecordList[i]['ph_value'].toString(),
          "volume": _subRecordList[i]['ph_value'].toString(),
          "price_rate": _subRecordList[i]['ph_value'].toString(),
          "temperature": _subRecordList[i]['ph_value'].toString(),
          "grade": _subRecordList[i]['ph_value'].toString(),
          'id' : body_['id'].toString(),
       };



    try{
    var uriResponse = await client.post(Uri.parse(ApiUrl.ADD_SUB_URL),
      body: sub_record);
       var jsonString = uriResponse.body;
 
      var body_ = jsonDecode(jsonString);
  
         print(body_);

    
    }finally{


    }

  

 }  




}finally{
client.close;


}  */

  }



  void showSnack(String message) {

     final snackBar = SnackBar(
            content:  Text(message),
            backgroundColor: (Colors.black.withOpacity(0.6)),
            action: SnackBarAction(
              label: 'dismiss',
              onPressed: () {
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);


  }








}
