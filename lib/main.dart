import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.blue),
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 75.0;
  double _bmi = 0.0;
  String _condition = 'Select Data';

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));

      if (_bmi >= 18.5 && _bmi <= 25) {
        _condition = "Normal";
      } else if (_bmi > 25 && _bmi <= 30) {
        _condition = "Overweight";
      } else if (_bmi > 30) {
        _condition = "Obesity";
      } else {
        _condition = "Underweight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Container(
            height: size.height * 0.40,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.red),
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("BMI",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0,
                  ))
            ]))
      ],
    )));
  }
}
