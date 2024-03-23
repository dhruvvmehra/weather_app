import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cityName = [
      "Ludhiana",
      "Mumbai",
      "Chandigarh",
      "Delhi",
      "Bhopal",
      "Dehradun",
      "Guwahati",
      "Hyderabad",
      "Indore",
      "Lucknow",
      "Noida"
          "Pune"
          "Rajasthan"
          "Rajkot"
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    Map setData = {};
    setData = ModalRoute.of(context)?.settings.arguments as Map;

    String setIcon = setData['setIcon'];
    // ignore: unused_local_variable
    String setCity = setData['setCity'];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff181818),
                    borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.grey,
                            controller: textEditingController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for $city",
                                hintStyle:
                                    const TextStyle(color: Colors.grey)))),
                    GestureDetector(
                      onTap: () {
                        if (textEditingController.text == "") {
                          print("Enter City");
                        }else{
                          Navigator.pushNamed(context, "/loading", arguments: {
                          "searchText": textEditingController.text
                        });
                        }
                        
                      },
                      child: const Icon(
                        Icons.manage_search,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff181818),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  children: [
                    Image.network(
                        "https://openweathermap.org/img/wn/$setIcon@2x.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          setData["setName"],
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Text(
                          " in ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          setData["setCity"],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Weather Forecast",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff181818),
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            setData["setTemp"].toString().substring(0, 4),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 36),
                          ),
                          const Text(
                            "°c",
                            style: TextStyle(color: Colors.white, fontSize: 36),
                          ),
                        ],
                      ),
                      Image.network(
                          "https://openweathermap.org/img/wn/$setIcon@2x.png"),
                      Text(
                        setData["setName"],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Additional Information",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff181818),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            // CupertinoIcons.drop_fill,
                            Icons.water_drop,
                            color: Colors.white,
                            // size: 20,
                          ),
                          const Text(
                            "Humidity",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            setData["setHum"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            // CupertinoIcons.wind,
                            Icons.wind_power,
                            color: Colors.white,
                            // size: 20,
                          ),
                          const Text(
                            "Wind Speed",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            setData["setWind"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            // CupertinoIcons.umbrella_fill,
                            Icons.speed,
                            color: Colors.white,
                            // size: 20,
                          ),
                          const Text(
                            "Pressure",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            setData["setPressure"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
