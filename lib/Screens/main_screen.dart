import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String cityName = "Tampere";
  String description = "cloudy";
  double temperature = 0;
  double wind = 0;

  // void updateWeather() {
  //   setState(() {
  //     cityName = "Turku";
  //     description = "Rainy";
  //     temperature = -4;
  //     wind = 3;
  //   });
  // }

  void fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=vaasa&units=metric&appid=26bcb6dfb4cf05b2e96f6791e362e83a'));
    // Uri uri = Uri.parse(
    //     'https://api.openweathermap.org/data/2.5/weather?q=turku&units=metric&appid=26bcb6dfb4cf05b2e96f6791e362e83a');
    // var response = await http.get(uri);
    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);
      setState(() {
        cityName = weatherData["name"];
        description = weatherData["weather"][0]["description"];
        temperature = weatherData["main"]["temp"];
        wind = weatherData["wind"]["speed"];
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  //navigate to forecast screen
  void openSensor() {
    Navigator.pushNamed(context, '/sensor');
  }

  void openApiPage() {
    Navigator.pushNamed(context, '/deviceapi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(cityName, style: const TextStyle(fontSize: 40)),
            Text(description, style: const TextStyle(fontSize: 30)),
            Text('$temperature °C', style: const TextStyle(fontSize: 30)),
            Text('$wind km/h', style: const TextStyle(fontSize: 30)),
            ElevatedButton(
                onPressed: () {
                  fetchWeather();
                },
                child: Text(
                  "Update",
                  style: const TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  openSensor();
                },
                child: Text(
                  "Sensor",
                  style: const TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  openApiPage();
                },
                child: Text(
                  "Location",
                  style: const TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
