import 'dart:math';
import 'package:circuit_analysis_app/circuit_diagramRLC2.dart';
import 'package:circuit_analysis_app/rlc_series_calculation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class RLCPage extends StatefulWidget {
  const RLCPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RLCPageState createState() => _RLCPageState();
}

class _RLCPageState extends State<RLCPage> {
  TextEditingController voltageController = TextEditingController();
  TextEditingController resistanceController = TextEditingController();
  TextEditingController capacitanceController = TextEditingController();
  TextEditingController inductanceController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController phaseController = TextEditingController();

  double voltage = 0;
  double resistance = 0;
  double capacitance = 0;
  double inductance = 0;
  double current = 0;
  double time = 0;
  double frequency = 0;
  double phase = 0;
  double load = 0;
  double maxpower = 0;
  double w = 0;

  @override
  Widget build(BuildContext context) {
    double w = 2 * pi * frequency;
    double zlj = w * inductance;
    double zcj = -1 / w / capacitance;
    double zComplex = zlj + zcj;
    double rL = sqrt(resistance * resistance + zComplex * zComplex);
    double irDenomReal = rL + resistance;
    double irDenomValue = sqrt(irDenomReal * irDenomReal + zComplex * zComplex);
    double irDenomPhase = atan(zComplex / irDenomReal) * 180 / pi;
    double irValue = voltage / irDenomValue;
    double irPhase = phase - irDenomPhase;
    double maxpower = irValue * irValue * rL;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 195, 225, 238),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('RLC Circuit'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.3, 0.7, 1.0],
                      colors: [
                        Color.fromARGB(255, 224, 238, 247),
                        Color.fromARGB(255, 204, 240, 255),
                        Color.fromARGB(255, 174, 231, 255),
                        Color.fromARGB(255, 140, 219, 255),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(42.5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 110, 170, 255),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 22.5),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'AC Source - RLC Circuit',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 5, 95),
                        ),
                      ),
                      SizedBox(height: 20),
                      CircuitDiagramRLC2(
                        canvaswidth: 340,
                        canvasheight: 185,
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: 300, // Set your desired width
                        height:
                            37.5, // Set your desired height // Set your desired padding
                        child: Text(
                          'This program determines the value of load resistance to maximize the power.',
                          style: TextStyle(
                            fontSize: 14.5,
                            color: Color.fromARGB(255, 0, 5, 95),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 500,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.3, 0.7, 1.0],
                      colors: [
                        Color.fromARGB(255, 224, 238, 247),
                        Color.fromARGB(255, 204, 240, 255),
                        Color.fromARGB(255, 174, 231, 255),
                        Color.fromARGB(255, 140, 219, 255),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(42.5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 110, 170, 255),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Input Values Here',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 5, 95),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: voltageController,
                          decoration: InputDecoration(
                            labelText: 'Input RMS Voltage Source in Volt',
                            labelStyle: const TextStyle(fontSize: 15.0),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: phaseController,
                          decoration: InputDecoration(
                            labelText: 'Input Phase Angle Value in Degree',
                            labelStyle: const TextStyle(fontSize: 15.0),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: frequencyController,
                          decoration: InputDecoration(
                            labelText: 'Input Frequency Value in Hertz',
                            labelStyle: const TextStyle(fontSize: 15.0),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 7.5),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: resistanceController,
                          decoration: InputDecoration(
                            labelText: 'Input Resistance Value in Ohm',
                            labelStyle: const TextStyle(fontSize: 15.0),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: capacitanceController,
                          decoration: InputDecoration(
                            labelText: 'Input Capacitance Value in Farad',
                            labelStyle: const TextStyle(fontSize: 15.0),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: inductanceController,
                          decoration: InputDecoration(
                            labelText: 'Input Inductance Value in Henry',
                            labelStyle: const TextStyle(fontSize: 15.0),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.0),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 102.5,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  voltage =
                                      double.tryParse(voltageController.text) ??
                                          0.0;
                                  resistance = double.tryParse(
                                          resistanceController.text) ??
                                      0.0;
                                  capacitance = double.tryParse(
                                          capacitanceController.text) ??
                                      0.0;
                                  inductance = double.tryParse(
                                          inductanceController.text) ??
                                      0.0;
                                  frequency = double.tryParse(
                                          frequencyController.text) ??
                                      0.0;
                                  phase =
                                      double.tryParse(phaseController.text) ??
                                          0.0;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue[900],
                                backgroundColor: Colors.lightBlue[100],
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 0, 5, 95),
                                      width: 1.25),
                                ),
                                shadowColor: Colors.lightBlue[200]!,
                              ),
                              child: const Text(
                                'Enter',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 5, 95),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 102.5,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  voltage = 0;
                                  resistance = 0;
                                  capacitance = 0;
                                  inductance = 0;
                                  currentController.clear();
                                  voltageController.clear();
                                  resistanceController.clear();
                                  capacitanceController.clear();
                                  inductanceController.clear();
                                  frequencyController.clear();
                                  phaseController.clear();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue[900],
                                backgroundColor: Colors.lightBlue[100],
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 0, 5, 95),
                                      width: 1.25),
                                ),
                                shadowColor: Colors.lightBlue[200]!,
                              ),
                              child: const Text(
                                'Reset',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 5, 95),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7.5),
                      const Divider(
                          thickness: 0.5, color: Color.fromARGB(255, 0, 5, 95)),
                      const SizedBox(height: 7.5),
                      const Text(
                        'Solution',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 5, 95),
                        ),
                      ),
                      const SizedBox(height: 12.5),
                      Math.tex(
                        '\\text{Load Resistance} = ${shortenNumber(rL)}\\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle,
                      ),
                      const SizedBox(height: 15),
                      Math.tex(
                        '\\text{Current}  =  ${shortenNumber(irValue)} \\, \\angle ${shortenNumber3(irPhase)}^\\circ \\,\\text{A}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle,
                      ),
                      const SizedBox(height: 15),
                      Math.tex(
                        '\\text{Maximum Power} = ${shortenNumber(maxpower)}\\, \\text{W}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle,
                      ),
                      const SizedBox(height: 12.5),
                      const Divider(
                          thickness: 0.5, color: Color.fromARGB(255, 0, 5, 95)),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 207.5,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RLCCalculationPage2(
                                    resistance: resistance,
                                    capacitance: capacitance,
                                    voltage: voltage,
                                    inductance: inductance,
                                    frequency: frequency,
                                    phase: phase,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue[900],
                            backgroundColor: Colors.lightBlue[100],
                            elevation: 3,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 0, 5, 95),
                                  width: 1.25),
                            ),
                            shadowColor: Colors.lightBlue[200]!,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Show Full Steps',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 5, 95),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: 14.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
