import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:http/http.dart';
import 'city_screen.dart';

String s;
class LocationScreen extends StatefulWidget {

String d;

LocationScreen(this.d);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String city;
  int t;
  String cond;
  String mess;
  WeatherModel weatherModel=WeatherModel();
  @override
  void initState() {
    // TODO: implement initState

    UpdateUi(widget.d);

    super.initState();
  }


  void UpdateUi(String h)
  {

    if(h=="")
      {
        city="Search";
        t=0;
        cond="Dead";
        mess="Error";
        return;

      }
   double te=jsonDecode(h)['main']['temp'];
   city=jsonDecode(h)['name'];

   t=(te-273.1).toInt();
    mess=weatherModel.getMessage(t);
    cond=weatherModel.getWeatherIcon(jsonDecode(h)['weather'][0]['id']);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {

                      String data= await weatherModel.getData();
                      print(data);

                      setState(() {
                        UpdateUi(data);
                      });


                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(

                    onPressed: () async{
String g;
s=await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
print(s);
if(s!="")
{


  Response response=await get("https://api.openweathermap.org/data/2.5/weather?q=$s&appid=$apikey");
  if(response.statusCode==404)
  {
   g="";

  }
  else
  {
    g=response.body;
   print(g);
  }

}
                      setState(() {
                        UpdateUi(g);
                      });



                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$t°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$cond',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$mess in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
