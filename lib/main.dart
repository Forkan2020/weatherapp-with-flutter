import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_application_project_app/Screens/main_screen.dart';
import 'package:flutter_application_project_app/Screens/device_api_screen.dart';
import 'package:flutter_application_project_app/Screens/sensor_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: "Weather App",
    initialRoute: '/main',
    routes: {
      '/main': ((context) => const MainScreen()),
      '/sensor': ((context) => const SensorScreen()),
      '/deviceapi': ((context) => const DeviceApiScreen()),
    },
  ));
}
