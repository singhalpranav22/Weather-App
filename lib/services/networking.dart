import 'package:http/http.dart';

class NetworkHelper{

  NetworkHelper({this.url,this.lati,this.longi});

  double lati;
  double longi;
  String url;

  Future getData() async{

    Response response=await get(url);

    return response;


  }
}