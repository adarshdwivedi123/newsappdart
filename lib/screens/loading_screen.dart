import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const apiKey ='27e3262bd16de1188a49231ce14c863a';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
}
  void getLocation() async {
      Location  location=Location();
      await location.getCurrentLocation();
      print(location.latitude);
      print(location.longitude);
  }

void getData() async{
    http.Response response=await http.get('http://api.openweathermap.org/data/2.5/weather?q=London&appid=$apiKey');
    // print(response.body);
    // print(response.statusCode);
  if(response.statusCode ==200) {
     String data = response.body;
      // print(data);
      // var longitude = jsonDecode(data)['coord']['lon'];
      // // print(longitude);
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      // print(weatherDescription);
        var ids=jsonDecode(data)['weather'][0]['id'];
        print(ids);
        var ma=jsonDecode(data)['main']['temp'];
        print(ma);
        var na=jsonDecode(data)['name'];
        print(na);



  }
  else
    {
      print(response.statusCode);
    }
}

  @override
  Widget build(BuildContext context) {
    getData();

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
