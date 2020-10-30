import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
const apiKey ='27e3262bd16de1188a49231ce14c863a';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
  }

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
}
  void getLocationData() async {
    Location  location=Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;
    NetworkHelper networkHelper = NetworkHelper(  'https://samples.openweathermap.org/data/2.5'
        '/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherdata=await networkHelper.getData();

    // print(temp);
    // print(condition);
    // print(cityname);


}
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       getLocation();
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),

    );
  }
}
