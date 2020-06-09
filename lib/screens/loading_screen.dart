import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import '../services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/networking.dart';
import '../services/networking.dart';
import '../services/networking.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';

const String apikey="4b72c0800063264d9d6444293330542e";
double lat;
double lon;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
      getLocation();


    super.initState();
  }
  void getLocation() async{






  WeatherModel weatherModel=WeatherModel();



   String data= await weatherModel.getData();


    double t=jsonDecode(data)['main']['temp'];
    String city=jsonDecode(data)['name'];
    print(city);
    print(t);
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(data)) );

  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Text(
              "Loading...",style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
            ),
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 100.0,
            ),

          ],


        ),

     ),
    );
  }
}
