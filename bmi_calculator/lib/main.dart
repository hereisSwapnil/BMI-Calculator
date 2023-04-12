import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

double height = 80.5;
double weight = 50;

double onChanged = 5;

// shortcut - "stl"
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculation"),
        ),
        body: Column(children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            "Height(cm) ${height.round()}",
            style: const TextStyle(fontSize: 25),
          ),
          Slider(
              min: 0,
              max: 250,
              value: height,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              }),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Weight(kg) ${weight.round()}",
            style: const TextStyle(fontSize: 25),
          ),
          Slider(
              min: 0,
              max: 150,
              value: weight,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              }),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Your BMI is : ${(weight * 10000 / (height * height)).toStringAsFixed(2)} ",
            style: const TextStyle(fontSize: 25),
          )
        ]),
      ),
    );
  }
}
