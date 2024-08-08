import 'package:circuit_analysis_app/circuit_diagramRL.dart';
import 'package:circuit_analysis_app/rl_series_calculation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'dart:math';

class RLPage extends StatefulWidget {
  const RLPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RLAppState createState() => _RLAppState();
}

class _RLAppState extends State<RLPage> {
  TextEditingController voltageController = TextEditingController();
  TextEditingController resistanceController = TextEditingController();
  TextEditingController inductanceController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  double voltage = 0;
  double resistance = 0;
  double inductance = 0;
  double time = 0;

  double vL = 0;
  double iL = 0;
  double timeConstant = 0;

  @override
  Widget build(BuildContext context) {
    double iL =
        (voltage / resistance) * (1 - exp((-resistance * time) / inductance));
    double vL = voltage - (iL * resistance);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 195, 225, 238),
        appBar: AppBar(
          //BACK ICON
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the first page
            },
          ),

          //TITLE
          title: const Text('Resistor-Inductor Circuit'),
        ),
        body: SingleChildScrollView(
          //PADDING
          child: Padding(
            padding: const EdgeInsets.only(
              top: 7.5,
              right: 10,
              bottom: 10,
              left: 10,
            ),
            //PADDING CONTENT = COLUMN
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              //COLUMN CONTENT CONTAINING FIRST AND SECOND CONTAINER
              children: [
                // FIRST CONTAINER
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
                  padding: const EdgeInsets.only(
                    top: 17.5,
                    right: 20.0,
                    bottom: 17.5,
                    left: 20.0,
                  ),

                  //FIRST CONTAINER CONTENT
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TITLE
                      Text(
                        'Series RL Circuit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              Color.fromARGB(255, 0, 5, 95), // Navy blue color
                        ),
                      ),

                      SizedBox(
                          height: 15), // Add spacing between text and image

                      //CIRCUIT DIAGRAM
                      CircuitDiagramRL(canvaswidth: 340, canvasheight: 185),
                      SizedBox(height: 2.5),

                      //VRC WIDGETS
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VoltageSourceWidget(
                            voltage: voltage,
                            height: height,
                            width: width,
                            fontsize: fontsize,
                          ),
                          SizedBox(width: horizontal),
                          ResistorWidget(
                            resistance: resistance,
                            height: height,
                            width: width,
                            fontsize: fontsize,
                          ),
                          SizedBox(width: horizontal),
                          CapacitorWidget(
                            capacitance: capacitance,
                            height: height,
                            width: width,
                            fontsize: fontsize,
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // SECOND CONTAINER
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
                  padding: const EdgeInsets.only(
                    top: 15,
                    right: 20.0,
                    bottom: 15,
                    left: 20.0,
                  ),

                  //SECOND CONTAINER CONTENT
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //TITLE
                      const Text(
                        'Input Values Here',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 5, 95),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Add spacing before text fields

                      //RESISTANCE INPUT
                      SizedBox(
                        width: double.infinity, // Set the desired width
                        height: 47.5, // Set the desired height
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: voltageController,
                          decoration: InputDecoration(
                            labelText: 'Input Voltage Value in Volts',
                            labelStyle: const TextStyle(fontSize: 15.5),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.5),
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
                      const SizedBox(height: 12.5),

                      SizedBox(
                        width: double.infinity, // Set the desired width
                        height: 47.5, // Set the desired height
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: resistanceController,
                          decoration: InputDecoration(
                            labelText: 'Input Resistance Value in Ohms',
                            labelStyle: const TextStyle(fontSize: 15.5),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.5),
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
                      const SizedBox(height: 12.5),

                      SizedBox(
                        width: double.infinity, // Set the desired width
                        height: 47.5, // Set the desired height
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
                      const SizedBox(height: 12.5),

                      SizedBox(
                        width: double.infinity, // Set the desired width
                        height: 47.5, // Set the desired height
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: timeController,
                          decoration: InputDecoration(
                            labelText: 'Input Time in Seconds',
                            labelStyle: const TextStyle(fontSize: 15.5),
                            hintText: 'Input here',
                            hintStyle: const TextStyle(fontSize: 15.5),
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

                      const SizedBox(height: 17.5),

                      // UPDATE AND RESET BUTTON
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 92.5,
                            height: 40, // Set the desired width here
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  voltage =
                                      double.tryParse(voltageController.text) ??
                                          0.0;
                                  resistance = double.tryParse(
                                          resistanceController.text) ??
                                      0.0;
                                  inductance = double.tryParse(
                                          inductanceController.text) ??
                                      0.0;
                                  time = double.tryParse(timeController.text) ??
                                      0.0;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue[900],
                                backgroundColor: Colors
                                    .lightBlue[100], // Text color (dark blue)
                                elevation: 2, // Elevation
                                // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      16), // Button border radius
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 0, 5, 95),
                                      width: 1.25), // Border (dark blue)
                                ),
                                shadowColor:
                                    Colors.lightBlue[200]!, // Shadow color
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Enter',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 5, 95),
                                      // Make the text bold
                                    ),
                                  ), // Text
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 15, // Add some spacing between the buttons
                          ),

                          SizedBox(
                            width: 92.5,
                            height: 40, // Set the desired width here
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  voltage = 0;
                                  resistance = 0;
                                  inductance = 0;
                                  time = 0;

                                  voltageController.clear();
                                  resistanceController.clear();
                                  inductanceController.clear();
                                  timeController.clear();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue[900],
                                backgroundColor: Colors
                                    .lightBlue[100], // Text color (dark blue)
                                elevation: 2, // Elevation
                                // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      16), // Button border radius
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 0, 5, 95),
                                      width: 1.25), // Border (dark blue)
                                ),
                                shadowColor:
                                    Colors.lightBlue[200]!, // Shadow color
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon
                                  Text(
                                    'Reset',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 5, 95),
                                      // Make the text bold
                                    ),
                                  ), // Text
                                ],
                              ),
                            ),
                          )

                          // Add some spacing between the buttons
                        ],
                      ),
                      const SizedBox(height: 7.5),
                      const Divider(
                          thickness: 0.5, color: Color.fromARGB(255, 0, 5, 95)),
                      const SizedBox(height: 5),
                      const Text(
                        'Voltage and Current Across Inductor',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 5, 95),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Math.tex(
                        'V_L(${shortenNumber3(time)} \\,\\text{s}) = ${shortenNumber2(vL)}\\, \\text{V}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle,
                      ),
                      const SizedBox(height: 12.5),
                      Math.tex(
                        'I_L(${shortenNumber3(time)}\\,\\text{s}) =  ${shortenNumber2(iL)}\\, \\text{A}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle,
                      ),

                      const SizedBox(height: 15),
                      //CALCULATE BUTTON
                      SizedBox(
                        width: 207.5,
                        height: 47.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RLCalculationPage(
                                  resistance: resistance,
                                  inductance: inductance,
                                  voltage: voltage,
                                  time: time,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue[900],
                            backgroundColor:
                                Colors.lightBlue[100], // Text color (dark blue)
                            elevation: 3, // Elevation
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  16), // Button border radius
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 0, 5, 95),
                                  width: 1.25), // Border (dark blue)
                            ),
                            shadowColor: Colors.lightBlue[200]!, // Shadow color
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon
                              Text(
                                'Show Full Steps',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 5, 95),
                                  fontWeight: FontWeight.bold,
                                  // Make the text bold
                                ),
                              ), // Text
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
