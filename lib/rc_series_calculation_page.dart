import 'dart:math';

import 'package:circuit_analysis_app/circuit_diagramRC.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class RCCalculationPage extends StatefulWidget {
  final double resistance;
  final double capacitance;
  final double voltage;
  final double time;
  final double capacitorVoltage;

  const RCCalculationPage({
    Key? key,
    required this.resistance,
    required this.capacitance,
    required this.voltage,
    required this.time,
    required this.capacitorVoltage,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RCCalculationPageState createState() => _RCCalculationPageState();
}

class _RCCalculationPageState extends State<RCCalculationPage> {
  @override
  Widget build(BuildContext context) {
    final timeConstant = widget.resistance * widget.capacitance;
    final vc = widget.voltage +
        ((widget.capacitorVoltage - widget.voltage) *
            (exp(-widget.time / timeConstant)));

    final ic =
        ((widget.voltage - widget.capacitorVoltage) / widget.resistance) *
            (exp(-widget.time / timeConstant));

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 225, 238),
      appBar: AppBar(
        title: const Text('RC Time Domain Analysis'),
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
                    'Step 1 : Calculate the Forced Response of the RC Circuit',
              ),
              const SizedBox(height: 2.5),
              buildContentContainer(
                content: [
                  Text(
                    'Forced response is the response of an RC circuit based on external voltage. We assume that the capacitor has been fully discharged (Vc = 0 V) and a voltage V is applied to the circuit at t = 0 seconds.',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 20),
                  centering(content: [
                    const CircuitDiagramRC(canvasheight: 165, canvaswidth: 340),
                  ]),
                  const SizedBox(height: 35),
                  const SizedBox(height: 5),
                  Text('Apply the Kirchoff\'s Voltage Law (KVL):',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('V_R(t) - V_C(t) + V = 0',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('R \\cdot I(t) + V_C(t) + V = 0',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('R \\cdot I(t)+ V_C(t) = V',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('The current through the capacitor can be expressed as:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('I(t) = I_C(t) = C \\cdot \\frac{dV_C(dt)}{dt}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('Substitute to the KVL equation:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex(
                        'R \\cdot C \\cdot \\frac{dV_C(t)}{dt} + V_C(t) = V',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'R \\cdot C \\cdot \\frac{dV_C(t)}{dt} = V - V_C(t)',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('Solve the Differential Equation:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex(
                        '\\frac{dV_C(t)}{[V - V_C(t)]} = \\frac{t}{R\\cdot C}\\,dt',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        '\\int\\frac{dV_C(t)}{[V - V_C(t)]} = \\int\\frac{t}{R\\cdot C}\\,dt',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('- ln|V - V_C(t)| = \\frac{t}{R\\cdot C} + K',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('Where K is an arbitrary constant.',
                      style: blueTextStyle15),
                  const SizedBox(height: 15),
                  Text('Find K using the initial condition:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('V_C(0) = 0',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('- ln|V - V_C(t)| = \\frac{t}{R\\cdot C} + K',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('- ln|V - 0| = \\frac{0}{R\\cdot C} + K',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('K = - ln|V|',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('Substitute K back to the equation:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('- ln|V - V_C(t)| = \\frac{t}{R\\cdot C} + K',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('- ln|V - V_C(t)| = \\frac{t}{R\\cdot C} - ln|V|',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('ln|V - V_C(t)| - ln|V| = -\\frac{t}{R\\cdot C}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'ln|\\frac{V - V_C(t)}{V}| = -\\frac{t}{R\\cdot C}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('Exponentiate the equation:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex(
                        '\\frac{V - V_C(t)}{V} = e^{-\\frac{t}{R\\cdot C}}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('V - V_C(t) = V ( 1 - e^{-\\frac{t}{R\\cdot C}})',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 10),
                    bordering(content: [
                      Math.tex(
                          'V_C(t) = V \\cdot (1 - e^{- \\frac{t}{R \\cdot C}})',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    ]),
                    const SizedBox(height: 5),
                  ]),
                ],
              ),

              const SizedBox(height: 25),

              // Step 2
              buildStepContainer(
                title:
                    'Step 2: Calculate the Natural Response (Source-Free) of RC Circuit',
              ),
              const SizedBox(height: 2.5),
              buildContentContainer(
                content: [
                  Text(
                      'Natural Response is the response of an RC circuit based on initial capacitor voltage (discharging of capacitor). To calculate the natural response, remove the voltage source and assume that the initial voltage across capacitor is V0.',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 20.0),
                  centering(content: [
                    const CircuitDiagramRCnoV(
                        canvasheight: 165, canvaswidth: 340),
                  ]),
                  const SizedBox(height: 35.0),
                  const SizedBox(height: 10.0),
                  Text(
                    'Apply Kirchoff\'s Voltage Law (KVL):',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15.0),
                  centering(content: [
                    Math.tex('-V_R(t) - V_C(t) = 0',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('-R \\cdot I(t) + V_C(t) = 0',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text(
                    'The current through the capacitor can be expressed as:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15.0),
                  centering(content: [
                    Math.tex('I(t) = C \\cdot \\frac{dV_C(dt)}{dt}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text(
                    'Substitute to the KVL equation:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15.0),
                  centering(content: [
                    Math.tex('\\frac{dV_C(t)}{V_C(t)} = -\\frac{1}{R \\cdot C}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle 
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        '\\int\\frac{dV_C(t)}{V_C(t)} = \\int-\\frac{1}{R \\cdot C}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('ln |V_C(t)| = -\\frac{t}{R\\cdot C} + K',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('Where K is an arbitrary constant.',
                      style: blueTextStyle15),
                  const SizedBox(height: 15),
                  Text('Find K using the initial condition:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('V_C(0) = V_0',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle 
                        ),
                    const SizedBox(height: 15),
                    Math.tex('ln|V_C(t)| = -\\frac{t}{R\\cdot C} + K',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle 
                        ),
                    const SizedBox(height: 15),
                    Math.tex('ln|V_0| = -\\frac{0}{R\\cdot C} + K',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle 
                        ),
                    const SizedBox(height: 15),
                    Math.tex('K = ln|V_0|',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle 
                        ),
                    const SizedBox(height: 15),
                  ]),
                  Text('Substitute K back to the equation:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('ln|V_C(t)| = -\\frac{t}{R\\cdot C} + ln|V_0|',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('ln|V_C(t)| - ln|V_0| = - \\frac{t}{R\\cdot C}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex('ln|\\frac{V_C(t)}{V_0}| = -\\frac{t}{R\\cdot C}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 10),
                    bordering(content: [
                      Math.tex(
                          'V_C(t) = V_0 \\cdot e^{- \\frac{t}{R \\cdot C}}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    ]),
                    const SizedBox(height: 5),
                  ]),
                ],
              ),
              /* const SizedBox(height: 2.5),
              buildCenterContainer(content: [
                Text('Natural Response of RC Circuit',
                    style: navyBlueTextStyleSmall),
                const Divider(color: Color.fromARGB(255, 0, 5, 95)),
                Math.tex('V_C(t) = V_0 \\cdot e^{- \\frac{t}{R \\cdot C}}',
                    mathStyle: MathStyle.text,
                    textStyle: blueTextStyle // Set the desired font size
                    ),
                const SizedBox(height: 5),
              ]),
*/
              const SizedBox(height: 25),

              // Step 3
              buildStepContainer(
                title: 'Step 3 : Calculate the Total Response of RC Circuit',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  Text(
                      'The total response of an RC circuit is the summation of forced response and natural response: ',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 15.0),
                  centering(content: [
                    Math.tex(
                        'V_C(t) = V \\cdot (1 - e^{-\\frac{t}{R \\cdot C}}) + V_0 \\cdot e^{-\\frac{t}{R \\cdot C}}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 10),
                    bordering(content: [
                      Math.tex(
                          'V_C(t) = V + (V_0 - V) \\cdot e^{-\\frac{t}{R \\cdot C}}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    ]),
                    const SizedBox(height: 5),
                  ]),

                  /*Text('Perform integration for both sides:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 20.0),
                  Math.tex(
                      r'\int_{0}^q\frac{dQ}{CV_S-Q} = \frac{1}{RC}\int_{0}^t dt',
                      mathStyle: MathStyle.text,
                      textStyle: blueTextStyle),
                  const SizedBox(height: 20.0),
                  Math.tex(r'\ln|\frac{CV_S - Q}{CV_S}| = -\frac{t}{RC}',
                      mathStyle: MathStyle.text, textStyle: blueTextStyle),
                  const SizedBox(height: 20.0),
                  Math.tex(r'\frac{CV_S - Q}{CV_S} = e^{-\frac{t}{RC}}',
                      mathStyle: MathStyle.text, textStyle: blueTextStyle),
                  const SizedBox(height: 20.0),
                  Text(
                      'Obtain the expression for charge as a function of time:',
                      style: navyBlueTextStyleSmall),
                  const SizedBox(height: 20.0),
                  Math.tex(r'Q(t) = C \cdot V_S \cdot (1 - e^{-\frac{t}{RC}})',
                      mathStyle: MathStyle.text, textStyle: blueTextStyle),
                  const SizedBox(height: 20.0),
                  Math.tex(
                      'Q(t) = C \\cdot V_S \\cdot (1 - e^{-\\frac{t}{\u03c4}})',
                      mathStyle: MathStyle.text,
                      textStyle: blueTextStyle),
                  const SizedBox(height: 10.0),*/
                ],
              ),

              /*buildCenterContainer(content: [
                Text('Total Response of RC Circuit',
                    style: navyBlueTextStyleSmall),
                const Divider(color: Color.fromARGB(255, 0, 5, 95)),
                Math.tex(
                    'V_C(t) = V + (V_0 - V) \\cdot e^{-\\frac{t}{R \\cdot C}}',
                    mathStyle: MathStyle.text,
                    textStyle: blueTextStyle // Set the desired font size
                    ),
                const SizedBox(height: 10),
              ]),*/

              const SizedBox(height: 25),

              // Step 4
              buildStepContainer(
                title: 'Step 4 : Find the Current',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  Text(
                    'The total current flowing through the circuit is given by:',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('I_C(t) = C \\cdot \\frac{dV_C(t)}{dt}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 15),
                    Math.tex(
                        'I_C(t) = -C \\cdot \\frac{(V_0 - V)}{R \\cdot C} \\cdot e^{-\\frac{t}{R \\cdot C}}',
                        mathStyle: MathStyle.text,
                        textStyle: blueTextStyle // Set the desired font size
                        ),
                    const SizedBox(height: 10),
                    bordering(content: [
                      Math.tex(
                          'I_C(t) = \\frac{(V - V_0)}{R} \\cdot e^{-\\frac{t}{R \\cdot C}}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle // Set the desired font size
                          ),
                    ])
                  ]),
                  const SizedBox(height: 5.0),
                ],
              ),

              const SizedBox(height: 25),

              buildStepContainer(
                title: 'Step 5 : Calculate the Time Constant',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  Text(
                    'The time constant is a parameter which characterizes the time response in RC circuits.',
                    style: navyBlueTextStyleSmall,
                  ),
                  const SizedBox(height: 15),
                  centering(content: [
                    Math.tex('\u03C4 = R\\times C', textStyle: blueTextStyle),
                    const SizedBox(height: 15),
                    Math.tex(
                        '\u03C4 = ${shortenNumber3(widget.resistance)} \\, \\Omega \\times ${shortenNumber3(widget.capacitance)} \\, F = ${shortenNumber3(timeConstant)} \\, \\text{s}',
                        textStyle: blueTextStyle),
                  ]),
                  const SizedBox(height: 10.0),
                ],
              ),

              const SizedBox(height: 25),
              // Step 5
              buildStepContainer(
                title:
                    'Step 6 : Input the Values to Calculate Current and Voltage',
              ),

              const SizedBox(height: 2.5),

              buildContentContainer(
                content: [
                  const SizedBox(height: 15),
                  centering(content: [
                    const CircuitDiagramRC(canvasheight: 165, canvaswidth: 340),
                  ]),
                  const SizedBox(height: 35),
                  const SizedBox(height: 5),
                  centering(content: [
                    const Divider(
                        color: Color.fromARGB(255, 0, 5, 95), thickness: 0.75),
                    const SizedBox(height: 5),
                    centering(content: [
                      const Text(
                        'RC Circuit Values',
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 5, 95),
                        ),
                      ),
                      const SizedBox(height: 17.5),
                      Math.tex(
                          'V = ${shortenNumber2(widget.voltage)}\\, \\text{V}',
                          textStyle: blueTextStylebold),
                      const SizedBox(height: 15.0),
                      Math.tex(
                          'R = ${shortenNumber2(widget.resistance)} \\, \\Omega',
                          textStyle: blueTextStylebold),
                      const SizedBox(height: 15.0),
                      Math.tex(
                          'C = ${shortenNumber2(widget.capacitance)} \\, \\text{F}',
                          textStyle: blueTextStylebold),
                      const SizedBox(height: 15.0),
                      Math.tex(
                          '\u03C4 = ${shortenNumber2(timeConstant)} \\, \\text{s}',
                          textStyle: blueTextStylebold),
                      const SizedBox(height: 15.0),
                      Math.tex(
                          't = ${shortenNumber2(widget.time)} \\, \\text{s}',
                          textStyle: blueTextStylebold),
                      const SizedBox(height: 15.0),
                      Math.tex(
                          'V_0 = ${shortenNumber2(widget.capacitorVoltage)} \\, \\text{V}',
                          textStyle: blueTextStylebold),
                    ]),
                    const SizedBox(height: 10),
                    const Divider(
                        color: Color.fromARGB(255, 0, 5, 95), thickness: 0.75),
                    const SizedBox(height: 10),
                    centering(
                      content: [
                        Text(
                          'Calculation Results',
                          style: navyBlueTextStyle,
                        ),
                        const SizedBox(height: 20.0),
                        Math.tex(
                            'V_C(t) = V + (V_0 - V) \\cdot e^{-\\frac{t}{R \\cdot C}}',
                            mathStyle: MathStyle.text,
                            textStyle:
                                blueTextStyle // Set the desired font size
                            ),
                        const SizedBox(height: 15.0),
                        Math.tex(
                          'V_C(${shortenNumber(widget.time)}) = ${shortenNumber(widget.voltage)} + (${shortenNumber(widget.capacitorVoltage)} - ${shortenNumber(widget.voltage)}) \\cdot e^{-\\frac{${shortenNumber(widget.time)}}{${shortenNumber(timeConstant)}}}',
                          textStyle: blueTextStyle,
                        ),
                        const SizedBox(height: 10.0),
                        bordering(content: [
                          Math.tex(
                            'V_C(${shortenNumber(widget.time)}\\, \\text{s}) =  ${shortenNumber2(vc)} \\, \\text{V}',
                            mathStyle: MathStyle.text,
                            textStyle: blueTextStyle,
                          ),
                        ]),
                        const SizedBox(height: 25),
                        Math.tex(
                          'I_C(t) = \\frac{(V - V_0)}{R} \\cdot e^{-\\frac{t}{R \\cdot C}}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle,
                        ),
                        const SizedBox(height: 15.0),
                        Math.tex(
                          'I_C(${shortenNumber(widget.time)}) = \\frac{(${shortenNumber(widget.voltage)} - ${shortenNumber(widget.capacitorVoltage)})}{${shortenNumber(widget.resistance)}} \\cdot e^{-\\frac{${shortenNumber(widget.time)}}{${shortenNumber(timeConstant)}}}',
                          mathStyle: MathStyle.text,
                          textStyle: blueTextStyle,
                        ),
                        const SizedBox(height: 10.0),
                        bordering(content: [
                          Math.tex(
                            'I_C(${shortenNumber(widget.time)}\\,  \\text{s}) = ${shortenNumber2(ic)} \\, \\text{A}',
                            mathStyle: MathStyle.text,
                            textStyle: blueTextStyle,
                          ),
                        ]),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ]),
                ],
              ),

              //padding 20+10

              //padding 20+10
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
} //content padding 25

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
    fontSize: 18.5,
    fontWeight: FontWeight.bold);

TextStyle navyBlueTextStyleSmall = const TextStyle(
    color: Color.fromARGB(255, 0, 5, 95),
    fontSize: 17.0,
    fontWeight: FontWeight.bold);

// ignore: non_constant_identifier_names
TextStyle blueTextStyle = const TextStyle(
    color: Color.fromARGB(255, 24, 12, 160),
    fontSize: 16.0,
    fontWeight: FontWeight.bold);
TextStyle blueTextStylebold = const TextStyle(
    color: Color.fromARGB(255, 24, 12, 160),
    fontSize: 17.0,
    fontWeight: FontWeight.bold);

TextStyle blueTextStyle15 = const TextStyle(
  color: Color.fromARGB(255, 24, 12, 160),
  fontSize: 15.0,
);

String shortenNumber(double number) {
  if (number.abs() >= 1e3 && number.abs() < 1e4) {
    return '${(number / 1e3).toStringAsFixed(1)}e3';
  } else if (number.abs() >= 1e4 && number.abs() < 1e5) {
    return '${(number / 1e4).toStringAsFixed(1)}e4';
  } else if (number.abs() >= 1e5 && number.abs() < 1e6) {
    return '${(number / 1e5).toStringAsFixed(1)}e5';
  } else if (number.abs() >= 1e6 && number.abs() < 1e7) {
    return '${(number / 1e6).toStringAsFixed(1)}e6';
  } else if (number.abs() >= 1e7 && number.abs() < 1e8) {
    return '${(number / 1e7).toStringAsFixed(1)}e7';
  } else if (number.abs() >= 1e8 && number.abs() < 1e9) {
    return '${(number / 1e8).toStringAsFixed(1)}e8';
  } else if (number.abs() >= 1e9 && number.abs() < 1e10) {
    return '${(number / 1e9).toStringAsFixed(1)}e9';
  } else if (number.abs() >= 1e10) {
    return '${(number / 1e10).toStringAsFixed(1)}e10';
  } else {
    return number.toStringAsFixed(2);
  }
}

String shortenNumber2(double number) {
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
