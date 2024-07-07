import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class fetchWeather {
  late String location;

  fetchWeather({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  Future<void> getData() async {
    try {
      Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=186d2a180e83651f5093883065d0e50b"));

      Map data = jsonDecode(response.body);

      // Getting temp, Humidity
      Map temp_data = data['main'];
      double gettemp = temp_data['temp'] - 273.15; // C
      String gethumidity = temp_data['humidity'].toString(); // %

      // Getting air_speed
      Map wind = data['wind'];
      double getair_speed = wind['speed'] / 0.27777777777778; // km/hr

      // Getting description
      List weather_data = data['weather'];
      Map weather_info = weather_data[0];
      String getdesc = weather_info['description'];
      String getmain_desc = weather_info['main'];

      //  Assigning values
      temp = gettemp.toString();
      humidity = gethumidity;
      air_speed = getair_speed.toString();
      description = getdesc;
      main = getmain_desc;
      icon = weather_info['icon'].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't find data";
      main = "NA";
      icon = "03d";
    }
  }
}
