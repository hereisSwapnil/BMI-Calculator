import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String getHealthStatus(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi < 25) {
    return "Normal weight";
  } else if (bmi < 30) {
    return "Overweight";
  } else {
    return "Obese";
  }
}

Color getHealthStatusColor(double bmi) {
  if (bmi < 18.5) {
    return Colors.blue;
  } else if (bmi < 25) {
    return Colors.green;
  } else if (bmi < 30) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

String getHealthStatusExplanation(String healthStatus) {
  switch (healthStatus) {
    case "Underweight":
      return "You have a BMI below the healthy range. This may indicate that you are not getting enough nutrients or that you have an underlying medical condition.";
    case "Normal weight":
      return "You have a BMI within the healthy range. Keep up the good work!";
    case "Overweight":
      return "You have a BMI above the healthy range. This may indicate that you are at an increased risk for certain health conditions such as heart disease, high blood pressure, and diabetes. It is recommended that you speak with a healthcare provider to determine the best course of action for improving your health.";
    case "Obese":
      return "You have a BMI that is significantly above the healthy range. This may indicate that you are at a high risk for developing serious health conditions such as heart disease, stroke, and certain types of cancer. It is recommended that you speak with a healthcare provider to determine the best course of action for improving your health.";
    default:
      return "";
  }
}

// shortcut - "stl"
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double height = 177;
  double weight = 65;

  @override
  Widget build(BuildContext context) {
    final bmi = weight * 10000 / (height * height);
    final healthStatus = getHealthStatus(bmi);
    final healthStatusColor = getHealthStatusColor(bmi);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Height (cm): ${height.round()}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Slider(
                min: 0,
                max: 250,
                value: height,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
                label: height.round().toString(),
              ),
              const SizedBox(height: 16),
              Text(
                "Weight (kg): ${weight.round()}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Slider(
                min: 0,
                max: 150,
                value: weight,
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
                label: weight.round().toString(),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                "Your BMI is: ${bmi.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                healthStatus,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: healthStatusColor,
                ),
              ),
              Text(
                getHealthStatusExplanation(healthStatus),
                style: TextStyle(fontSize: 17, color: healthStatusColor),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text("Reset"),
                onPressed: () {
                  setState(() {
                    height = 177;
                    weight = 65;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
