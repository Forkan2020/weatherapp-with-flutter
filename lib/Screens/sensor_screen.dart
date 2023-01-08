import 'dart:ffi';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:geocoding/geocoding.dart' as geocode;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SensorScreen extends StatefulWidget {
  const SensorScreen({super.key});

  @override
  State<SensorScreen> createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  double xSensorValue = 0;
  double ySensorvalue = 0;
  double zSensorVAlue = 0;

  void startSensors() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        xSensorValue = event.x;
        ySensorvalue = event.y;
        zSensorVAlue = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sensor"),
        ),
        body: Column(
          children: [
            Text(
              "X: $xSensorValue",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "Y: $ySensorvalue",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "Z: $zSensorVAlue",
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  startSensors();
                },
                // ignore: prefer_const_constructors
                child: Text(
                  "Start",
                  style: const TextStyle(fontSize: 20),
                )),
          ],
        ));
  }
}
