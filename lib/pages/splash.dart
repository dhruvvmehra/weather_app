import 'package:flutter/material.dart';

import 'backend/api.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

late String desc;
late String name;
late String temp;
late String hum;
late String wind;
late String icon;
String city = "Ludhiana";
late String pressure;

class _SplashPageState extends State<SplashPage> {
  void appRun(String city) async {
    Api instance = Api(location: city);
    await instance.getData();

    desc = instance.description;
    name = instance.main;
    temp = instance.temperature;
    hum = instance.humidity;
    wind = instance.wind;
    icon = instance.icon;
    pressure = instance.pressure;

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "setDesc": desc,
        "setName": name,
        "setTemp": temp,
        "setHum": hum,
        "setWind": wind,
        "setIcon": icon,
        "setCity": city,
        "setPressure": pressure,
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map search = {};
    // search = ModalRoute.of(context)?.settings.arguments as Map;

    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }

    appRun(city);
    return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child: Image.asset(
              //     'assets/img/weather.jpg',
              //     height: 100,
              //   ),
              // ),
              Expanded(
                child: Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 100,
                ),
              ),

              Text(
                "Made By Dhruv",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
