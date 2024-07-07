import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchC = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    Map info =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    // var city_name = ["Kanpur", "Mumbai", "London", "Ghaziabad"];
    // final _random = new Random();
    // var city = city_name[_random.nextInt(city_name.length)];
    String temp = ((info['temp_value']).toString());
    if (temp == "NA") {
      print("NA");
    } else {
      temp = ((info['temp_value']).toString().substring(0, 4));
    }
    String icon = info['icon_value'];
    print(icon);
    String city = info['city_value'];
    String hum = info['humidity_value'];
    String air = ((info['air_speed_value']).toString());
    if (air == "NA") {
      print("NA");
    } else {
      air = ((info['air_speed_value']).toString().substring(0, 4));
    }
    String desc = info['description_value'];
    String main = info['main_value'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: Color.fromARGB(223, 60, 155, 233)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // stops: [0.1, 0.5],
                colors: [
                  Color.fromARGB(218, 75, 145, 202),
                  Color.fromARGB(255, 52, 156, 241)
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchC.text).replaceAll(" ", " ") == "") {
                            print("Blank Search");
                          } else {
                            Navigator.pushReplacementNamed(context, '/loading',
                                arguments: {
                                  "searchtext": searchC.text.trim(),
                                });
                          }
                        },
                        child: Container(
                            child: Icon(Icons.search, color: Colors.blue),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0)),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchC,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search City Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text('$desc',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text("$city",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 220,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp", style: TextStyle(fontSize: 75)),
                                Text('C', style: TextStyle(fontSize: 30))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        padding: EdgeInsets.all(26),
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(child: Icon(WeatherIcons.day_windy)),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text("$air",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                            Text("km/hr"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        padding: EdgeInsets.all(26),
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              "$hum",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text("Percent"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by Mohit"),
                      SizedBox(height: 10),
                      Text("Data Provided By Openweathermap.org"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
