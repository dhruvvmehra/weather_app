import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Api {
  String location;

  Api({required this.location}) {
    location = location;
  }

  late String description;
  late String main;
  late String temperature;
  late String humidity;
  late String wind;
  late String pressure;
  late String icon;

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          ("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=657d74e62a0e0c78bd391248afdb936d")));

      Map data = jsonDecode(response.body);

      // Description Data---------------------------------------------
      List dataDescription = data['weather'];
      Map mainDataDescription = dataDescription[0];
      String getDescription = mainDataDescription['description'];
      String getIcon = mainDataDescription['icon'];
      String getMain = mainDataDescription['main'];

      // Temperature Data---------------------------------------------
      Map dataTemperature = data['main'];
      double getTemperature = dataTemperature['temp'] -
          273.15; // Now we got temperature in celcius by subtracting -273.15 from the value.

      // Humidity Data------------------------------------------------
      Map dataHumidity = data['main'];
      int getHumidity = dataHumidity['humidity'];

      // Pressure Data------------------------------------------------
      Map dataPressure = data['main'];
      int getPressure = dataPressure['pressure'];

      // Wind Speed Data----------------------------------------------
      Map dataWind = data['wind'];
      double getWind = dataWind['speed'];

      // Assigning Data to String-------------------------------------
      description = getDescription;
      main = getMain;
      humidity = getHumidity.toString();
      pressure = getPressure.toString();
      icon = getIcon.toString();
      wind = getWind.toString();

      temperature = getTemperature.toString();
    } catch (e) {
      description = "N/A";
      main = "Can't find City";
      humidity = "N/A";
      pressure = "N/A";
      wind = "N/A";
      icon = const Icon(Icons.error).toString();
      temperature = "N/A";
    }
  }
}
