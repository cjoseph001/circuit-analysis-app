import 'dart:math';
import 'package:circuit_analysis_app/circuit_diagramRLC2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

Widget buildContentContainer({required List<Widget> content}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.3, 0.7, 1.0],
        colors: [
          Color.fromARGB(255, 224, 238, 247),
          Color.fromARGB(255, 204, 240, 255),
          Color.fromARGB(255, 179, 232, 255),
          Color.fromARGB(255, 143, 219, 254),
        ],
      ),
      borderRadius: BorderRadius.circular(25),
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
      top: 15.0,
      right: 20.0,
      bottom: 15.0,
      left: 20.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...content,
      ],
    ),
  );
}

Widget buildStepContainer({required String title}) {
  return Container(
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
      borderRadius: BorderRadius.circular(25),
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
      top: 20.0,
      right: 20.0,
      bottom: 20.0,
      left: 20.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: navyBlueTextStyle),
      ],
    ),
  );
}

Widget buildCenterContainer({required List<Widget> content}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.3, 0.7, 1.0],
        colors: [
          Color.fromARGB(255, 224, 238, 247),
          Color.fromARGB(255, 204, 240, 255),
          Color.fromARGB(255, 179, 232, 255),
          Color.fromARGB(255, 143, 219, 254),
        ],
      ),
      borderRadius: BorderRadius.circular(8),
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
      top: 15.0,
      right: 20.0,
      bottom: 15.0,
      left: 20.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...content,
      ],
    ),
  );
}

Widget centering({required List<Widget> content}) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...content,
      ],
    ),
  );
}

Widget bordering({required List<Widget> content}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
      color: const Color.fromARGB(255, 0, 5, 95),
      width: 1.2,
    )),
    padding: const EdgeInsets.only(
      top: 10.0,
      right: 15.0,
      bottom: 15.0,
      left: 10.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...content,
      ],
    ),
  );
}

TextStyle navyBlueTextStyle = const TextStyle(
    color: Color.fromARGB(255, 0, 5, 95),
    fontSize: 17.5,
    fontWeight: FontWeight.bold);

TextStyle navyBlueTextStyleSmall = const TextStyle(
  color: Color.fromARGB(255, 0, 5, 95),
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

TextStyle blueTextStyle = const TextStyle(
  color: Color.fromARGB(255, 24, 12, 160),
  fontSize: 18.0,
);

TextStyle blueTextStyle2 = const TextStyle(
  color: Color.fromARGB(255, 24, 12, 160),
  fontSize: 22.0,
);
TextStyle blueTextStylebold = const TextStyle(
    color: Color.fromARGB(255, 24, 12, 160),
    fontSize: 17.0,
    fontWeight: FontWeight.bold);

TextStyle blueTextStyle15 = const TextStyle(
  color: Color.fromARGB(255, 24, 12, 160),
  fontSize: 15.0,
);


String shortenNumber(double number) {
  if (number.abs() >= 1e4 && number.abs() < 1e5) {
    return '${(number / 1e4).toStringAsFixed(3)}\\cdot10^4';
  } else if (number.abs() >= 1e5 && number.abs() < 1e6) {
    return '${(number / 1e5).toStringAsFixed(3)}\\cdot10^5';
  } else if (number.abs() >= 1e6 && number.abs() < 1e7) {
    return '${(number / 1e6).toStringAsFixed(3)}\\cdot 10^6';
  } else if (number.abs() >= 1e7 && number.abs() < 1e8) {
    return '${(number / 1e7).toStringAsFixed(3)}\\cdot10^7';
  } else if (number.abs() >= 1e8 && number.abs() < 1e9) {
    return '${(number / 1e8).toStringAsFixed(3)}\\cdot10^8';
  } else if (number.abs() >= 1e9 && number.abs() < 1e10) {
    return '${(number / 1e9).toStringAsFixed(3)}\\cdot10^9';
  } else if (number.abs() >= 1e10) {
    return '${(number / 1e10).toStringAsFixed(3)}\\cdot10^{10}';
  } else if (number.abs() >= 1e-3 && number.abs() < 1e-2) {
    return '${(number / 1e-3).toStringAsFixed(3)}\\cdot10^{-3}';
  } else if (number.abs() >= 1e-4 && number.abs() < 1e-3) {
    return '${(number / 1e-4).toStringAsFixed(3)}\\cdot10^{-4}';
  } else if (number.abs() >= 1e-5 && number.abs() < 1e-4) {
    return '${(number / 1e-5).toStringAsFixed(3)}\\cdot10^{-5}';
  } else if (number.abs() >= 1e-6 && number.abs() < 1e-5) {
    return '${(number / 1e-6).toStringAsFixed(3)}\\cdot10^{-6}';
  } else {
    return number.toStringAsFixed(3);
  }
}

String shortenNumber3(double number) {
  if (number.abs() >= 1e4 && number.abs() < 1e5) {
    return '${(number / 1e4).toStringAsFixed(2)}\\cdot10^4';
  } else if (number.abs() >= 1e5 && number.abs() < 1e6) {
    return '${(number / 1e5).toStringAsFixed(2)}\\cdot10^5';
  } else if (number.abs() >= 1e6 && number.abs() < 1e7) {
    return '${(number / 1e6).toStringAsFixed(2)}\\cdot 10^6';
  } else if (number.abs() >= 1e7 && number.abs() < 1e8) {
    return '${(number / 1e7).toStringAsFixed(2)}\\cdot10^7';
  } else if (number.abs() >= 1e8 && number.abs() < 1e9) {
    return '${(number / 1e8).toStringAsFixed(2)}\\cdot10^8';
  } else if (number.abs() >= 1e9 && number.abs() < 1e10) {
    return '${(number / 1e9).toStringAsFixed(2)}\\cdot10^9';
  } else if (number.abs() >= 1e10) {
    return '${(number / 1e10).toStringAsFixed(2)}\\cdot10^{10}';
  } else if (number.abs() >= 1e-3 && number.abs() < 1e-2) {
    return '${(number / 1e-3).toStringAsFixed(2)}\\cdot10^{-3}';
  } else if (number.abs() >= 1e-4 && number.abs() < 1e-3) {
    return '${(number / 1e-4).toStringAsFixed(2)}\\cdot10^{-4}';
  } else if (number.abs() >= 1e-5 && number.abs() < 1e-4) {
    return '${(number / 1e-5).toStringAsFixed(2)}\\cdot10^{-5}';
  } else if (number.abs() >= 1e-6 && number.abs() < 1e-5) {
    return '${(number / 1e-6).toStringAsFixed(2)}\\cdot10^{-6}';
  } else {
    return number.toStringAsFixed(2);
  }
}

class RLCCalculationPage2 extends StatefulWidget {
  final double resistance;
  final double inductance;
  final double voltage;
  final double capacitance;
  final double frequency;
  final double phase;

  const RLCCalculationPage2({
    Key? key,
    required this.resistance,
    required this.inductance,
    required this.voltage,
    required this.capacitance,
    required this.frequency,
    required this.phase,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RLCCalculationPageState2 createState() => _RLCCalculationPageState2();
}

class _RLCCalculationPageState2 extends State<RLCCalculationPage2> {
  @override
  Widget build(BuildContext context) {
    double angularFreq = 2 * pi * widget.frequency;
    double wc = angularFreq * widget.capacitance;
    double wcFrac = 1 / wc;
    double wL = angularFreq * widget.inductance;
    double jsum = wL - wcFrac;
    double rL = sqrt(widget.resistance * widget.resistance + jsum * jsum);
    double rRL = widget.resistance + rL;
    double irDenoValue = sqrt(rRL * rRL + jsum * jsum);
    double irDenoAngle = atan(jsum / rRL) * 180 / pi;
    double irValue = widget.voltage / irDenoValue;
    double irAngle = widget.phase - irDenoAngle;
    double power = rL * irValue * irValue;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 225, 238),
      appBar: AppBar(
        title: const Text('Solutions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 7.5,
            right: 10,
            bottom: 10,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5.0),

              // Step 1
              buildStepContainer(
                title:
                    'Step 1 : Calculate the Complex Impedance of Resistor, Capacitor, and Inductor',
              ),
              const SizedBox(height: 2.5),
              buildContentContainer(
                content: [
                  centering(content: [
                    const CircuitDiagramRLC2(
                        canvasheight: 165, canvaswidth: 340),
                  ]),
                  const SizedBox(height: 35),
                  const SizedBox(height: 10),
                  Text(
                    'From the user\'s input, the value of the RLC circuit above is given as:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex(
                        'R = ${shortenNumber3(widget.resistance)}\\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'L= ${shortenNumber3(widget.inductance)}\\, \\text{H}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'C= ${shortenNumber3(widget.capacitance)}\\, \\text{F}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'V = ${shortenNumber3(widget.voltage)} \\, \\angle ${shortenNumber3(widget.phase)}^\\circ \\text{V} \\text{(rms)}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle),
                    const SizedBox(height: 15),
                    Math.tex(
                        'f= ${shortenNumber3(widget.frequency)}\\, \\text{Hz}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                  ]),
                  const SizedBox(height: 15),
                  Text(
                    'Calculate the angular frequency:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('\\omega = 2 \\pi f',
                        mathStyle: MathStyle.text, textStyle: blueTextStyle),
                    const SizedBox(height: 15),
                    Math.tex(
                        '\\omega = 2 \\pi \\cdot ${shortenNumber3(widget.frequency)} \\,\\,\\text{rad/s}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle),
                    const SizedBox(height: 15),
                    Math.tex(
                        '\\omega = ${shortenNumber3(angularFreq)}\\,\\, \\text{rad/s}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle),
                  ]),
                  const SizedBox(height: 15),
                  Text(
                    'The impedance of resistor R is the same as the resistance value:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('Z_R = R',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle 
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'Z_R = ${shortenNumber3(widget.resistance)}\\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle
                        ),
                  ]),
                  const SizedBox(height: 15),
                  Text(
                    'Calculate the Impedance of capacitor C:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('Z_C=\\frac{1}{j \\omega c}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'Z_C=\\frac{1}{j \\cdot ${shortenNumber3(angularFreq)} \\cdot ${shortenNumber3(widget.capacitance)}} \\,\\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'Z_C=\\frac{1}{j \\cdot ${shortenNumber3(wc)}} \\,\\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('Z_C=-\\frac{j}{${shortenNumber3(wc)}} \\,\\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('Z_C= - ${shortenNumber3(wcFrac)} j \\,\\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                  ]),
                  const SizedBox(height: 15),
                  Text(
                    'Calculate the Impedance of inductor L:',
                    style: navyBlueTextStyleSmall,
                  ),
                  centering(content: [
                    const SizedBox(height: 15),
                    Math.tex('Z_L=j \\omega L',
                        mathStyle: MathStyle.text, textStyle: blueTextStyle),
                    const SizedBox(height: 15),
                    Math.tex(
                        'Z_L= j \\cdot ${shortenNumber3(angularFreq)} \\cdot ${shortenNumber3(widget.inductance)} \\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle),
                    const SizedBox(height: 15),
                    Math.tex('Z_L= ${shortenNumber3(wL)} j \\, \\Omega',
                        mathStyle: MathStyle.text, textStyle: blueTextStyle),
                    const SizedBox(height: 5),
                  ]),
                ],
              ),

              const SizedBox(height: 25),

              // Step 2
              buildStepContainer(
                title: 'Step 2: Calculate the Circuit Impedance',
              ),
              const SizedBox(height: 2.5),
              buildContentContainer(
                content: [
                  centering(content: [
                    const CircuitDiagramRLC5(
                        canvasheight: 165, canvaswidth: 340),
                  ]),
                  const SizedBox(height: 35),
                  const SizedBox(height: 10),
                  Text(
                    'The impedance of each components are:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex(
                        'Z_R = ${shortenNumber3(widget.resistance)}\\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('Z_L= ${shortenNumber3(wL)} j \\, \\Omega',
                        mathStyle: MathStyle.text, textStyle: blueTextStyle),
                    const SizedBox(height: 15),
                    Math.tex('Z_C= - ${shortenNumber3(wcFrac)} j \\,\\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text(
                    'For series configuration, the total circuit impedance can be calculated as:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15.0),
                  centering(content: [
                    Math.tex('Z_{Th}= Z_R + Z_L + Z_C',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'Z_{Th} = ${shortenNumber3(widget.resistance)} \\,\\Omega + ${shortenNumber3(wL)}j \\, \\Omega - ${shortenNumber3(wcFrac)}j \\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    if (jsum >= 0)
                      Math.tex(
                          'Z_{Th} = (${shortenNumber3(widget.resistance)}  + ${shortenNumber3(jsum)}j)\\, \\Omega ',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    if (jsum < 0)
                      Math.tex(
                          'Z_{Th} = (${shortenNumber3(widget.resistance)} ${shortenNumber3(jsum)}j)\\, \\Omega ',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                  ]),
                  const SizedBox(height: 5),
                ],
              ),
            
              const SizedBox(height: 25),

              // Step 3
              buildStepContainer(
                title: 'Step 3 : Find the Thevenin Voltage',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  centering(content: [
                    const CircuitDiagramRLC6(
                        canvasheight: 165, canvaswidth: 340),
                  ]),
                  const SizedBox(height: 35),
                  const SizedBox(height: 10),
                  Text(
                    'The thevenin voltage is the same as the source:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex(
                        'V_{Th} = ${shortenNumber3(widget.voltage)} \\, \\angle ${shortenNumber3(widget.phase)}^\\circ \\text{V} \\text{(rms)}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 5),
                  ]),
                ],
              ),

              const SizedBox(height: 25),

              // Step 4
              buildStepContainer(
                title: 'Step 4 : Calculate the Load Resistance',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  Text(
                    'The load resistance to maximize power is:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('R_L = |Z_{Th}|',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    if (jsum >= 0)
                      Math.tex(
                          'R_L = |${shortenNumber3(widget.resistance)}  + ${shortenNumber3(jsum)}j|\\, \\Omega',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    if (jsum < 0)
                      Math.tex(
                          'R_L = |${shortenNumber3(widget.resistance)}${shortenNumber3(jsum)}j|\\, \\Omega',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'R_L = \\sqrt{(${shortenNumber3(widget.resistance)})^2 + (${shortenNumber3(jsum)})^2}\\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('R_L = ${shortenNumber3(rL)}\\, \\Omega',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                  ]),
                  const SizedBox(height: 5.0),
                ],
              ),

              const SizedBox(height: 25),
              // Step 5
              buildStepContainer(
                title: 'Step 5 : Find the Current',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  centering(content: [
                    const CircuitDiagramRLC7(
                        canvasheight: 165, canvaswidth: 340),
                  ]),
                  const SizedBox(height: 35),
                  const SizedBox(height: 10),
                  Text(
                    'Calculate the current flowing through the circuit:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('I_R = \\frac{V_{Th}}{Z_{Th} + R_L}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    if (jsum >= 0)
                      Math.tex(
                          'I_R = (\\frac{${shortenNumber3(widget.voltage)} \\, \\angle ${shortenNumber3(widget.phase)}^\\circ}{${shortenNumber3(widget.resistance)}  + ${shortenNumber3(jsum)}j + ${shortenNumber3(rL)}}) \\, \\text{A}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    if (jsum < 0)
                      Math.tex(
                          'I_R = (\\frac{${shortenNumber3(widget.voltage)} \\, \\angle ${shortenNumber3(widget.phase)}^\\circ}{${shortenNumber3(widget.resistance)}${shortenNumber3(jsum)}j + ${shortenNumber3(rL)}}) \\, \\text{A}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    const SizedBox(height: 15),
                    if (jsum >= 0)
                      Math.tex(
                          'I_R =  (\\frac{${shortenNumber3(widget.voltage)} \\, \\angle ${shortenNumber3(widget.phase)}^\\circ}{${shortenNumber3(rRL)}  + ${shortenNumber3(jsum)}j}) \\, \\text{A}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    if (jsum < 0)
                      Math.tex(
                          'I_R =  (\\frac{${shortenNumber3(widget.voltage)} \\, \\angle ${shortenNumber3(widget.phase)}^\\circ}{${shortenNumber3(rRL)}${shortenNumber3(jsum)}j}) \\, \\text{A}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'I_R =  (\\frac{${shortenNumber3(widget.voltage)} \\, \\angle ${shortenNumber3(widget.phase)}^\\circ} {${shortenNumber3(irDenoValue)} \\, \\angle ${shortenNumber3(irDenoAngle)}^\\circ}) \\, \\text{A}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'I_R =  ${shortenNumber3(irValue)} \\, \\angle ${shortenNumber3(irAngle)}^\\circ \\,\\text{A}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 5),
                  ]),
                ],
              ),

              const SizedBox(height: 25),
              buildStepContainer(
                title: 'Step 6 : Find the Maximum Power',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  Text(
                    'Calculate the maximum power:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('P = {I_R}^2 \\cdot R_L ',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                      'P = (${shortenNumber3(irValue)})^2 \\cdot {${shortenNumber3(rL)}} \\, \\text{W}',
                      mathStyle: MathStyle.text,
                      textStyle: blueTextStyle, // Set the desired font size
                    ),
                    const SizedBox(height: 15),
                    Math.tex('P = ${shortenNumber3(power)} \\, \\text{W}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 5),
                  ]),
                ],
              ),
              
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
} 
