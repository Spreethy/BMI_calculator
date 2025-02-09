import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Color.fromARGB(255, 27, 3, 99)),
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
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 27, 3, 99)),
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 174, 188),
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
                  const Text(
                    "Calculator",
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 174, 188),
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      _bmi > 0 ? _bmi.toStringAsFixed(1) : '0.0',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 232, 66, 171),
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Condition: ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 2, 134, 7),
                          fontSize: 25.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: _condition,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 24, 208, 228)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  const Text(
                    "Choose Data",
                    style: TextStyle(
                      color: Color(0xFF12a644),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  Text("Height: ${_height.toStringAsFixed(1)} cm"),
                  Slider(
                    value: _height,
                    min: 100.0,
                    max: 250.0,
                    divisions: 500,
                    label: _height.toStringAsFixed(1),
                    onChanged: (double newValue) {
                      setState(() {
                        _height = newValue;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.08),
                  Text("Weight: ${_weight.toStringAsFixed(1)} kg"),
                  Slider(
                    value: _weight,
                    min: 0.0,
                    max: 200.0,
                    divisions: 500,
                    label: _weight.toStringAsFixed(1),
                    onChanged: (double newValue) {
                      setState(() {
                        _weight = newValue;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.08),
                  TextButton(
                    onPressed: _calculateBMI,
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 19, 210, 25)),
                    child: const Text(
                      'Calculate BMI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
