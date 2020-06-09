import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {



  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(


        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,

              ),
              Container(


                padding: EdgeInsets.all(20.0),
                child: TextField(

                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    icon: Icon(Icons.location_city,
                    color: Colors.pink),
                    hintText: "Enter the City",
                    hintStyle: TextStyle(
                      color: Colors.grey,

                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),

                  onChanged: (value){
                    city=value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {


                  Navigator.pop(context,city);

                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
