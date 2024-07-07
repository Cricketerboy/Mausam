import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/data/getdata.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String tem;
  late String hum;
  late String air_sp;
  late String des;
  late String main;
  late String icon;
  String city = "Kanpur";
  void startApp(String city) async {
    fetchWeather instance = fetchWeather(location: city);
    await instance.getData();

    tem = instance.temp;
    hum = instance.humidity;
    air_sp = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": tem,
        "humidity_value": hum,
        "air_speed_value": air_sp,
        "description_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search?['searchtext'];
    }
    startApp(city);
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/weather.png"),
                  radius: 35.0,
                ),
                SizedBox(height: 20),
                Text(
                  "Know Your Mausam",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Made by Mohit",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(height: 30),
                SpinKitWave(
                  color: Colors.white,
                  size: 25.0,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue[300]);
  }
}
