import 'package:flutter/material.dart';
import 'dart:math';

class CircuitDiagramRL extends StatelessWidget {
  final double canvaswidth;
  final double canvasheight;

  const CircuitDiagramRL(
      {Key? key, required this.canvasheight, required this.canvaswidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(canvaswidth, canvasheight), // Use the canvasSize variable
      painter: CircuitPainterRL(),
    );
  }
}

class CircuitPainterRL extends CustomPainter {
  final double canvaswidth;
  final double canvasheight; // Variable to adjust the canvas size
// Load the image in the constructor
  CircuitPainterRL({this.canvaswidth = 600.0, this.canvasheight = 600.0});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 5, 95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const line1Start = Offset(125, 15);
    const line1End = Offset(132.5, 0);

    const line2Start = Offset(132.5, 0);
    const line2End = Offset(147.5, 30);

    const line3Start = Offset(147.5, 30);
    const line3End = Offset(162.5, 0);

    const line4Start = Offset(162.5, 0);
    const line4End = Offset(177, 30);

    const line5Start = Offset(177.5, 30);
    const line5End = Offset(192.5, 0);

    const line6Start = Offset(192.5, 0);
    const line6End = Offset(207.5, 30);

    const line7Start = Offset(207.5, 30);
    const line7End = Offset(215, 15);

    canvas.drawLine(line1Start, line1End, paint);
    canvas.drawLine(line2Start, line2End, paint);
    canvas.drawLine(line3Start, line3End, paint);
    canvas.drawLine(line4Start, line4End, paint);
    canvas.drawLine(line5Start, line5End, paint);
    canvas.drawLine(line6Start, line6End, paint);
    canvas.drawLine(line7Start, line7End, paint);

//Draw Inductor
/*
    final rect = Rect.fromCenter(
      center: Offset(140, 15),
      width: 30,
      height: 42.5,
    );
    final rect2 = Rect.fromCenter(
      center: Offset(170, 15),
      width: 30,
      height: 42.5,
    );
    final rect3 = Rect.fromCenter(
      center: Offset(200, 15),
      width: 30,
      height: 42.5,
    );

    // Draw the top half of the oval
    canvas.drawArc(
      rect,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect2,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect3,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
*/

    final rect = Rect.fromCenter(
      center: const Offset(275, 60),
      width: 35,
      height: 30,
    );
    final rect2 = Rect.fromCenter(
      center: const Offset(275, 90),
      width: 35,
      height: 30,
    );
    final rect3 = Rect.fromCenter(
      center: const Offset(275, 120),
      width: 35,
      height: 30,
    );

    // Draw the top half of the oval
    canvas.drawArc(
      rect,
      -pi / 2, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect2,
      -pi / 2, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect3,
      -pi / 2, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    // Draw voltage source
    final voltageSource =
        Rect.fromPoints(const Offset(40, 60), const Offset(100, 120));
    canvas.drawOval(voltageSource, paint);

    final voltageText = TextPainter(
      text: const TextSpan(
        text: 'V',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    voltageText.layout(minWidth: 20, maxWidth: 100);
    voltageText.paint(canvas, const Offset(110, 75.5));

    //Draw + sign
    final plussign = TextPainter(
      text: const TextSpan(
        text: '+',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    plussign.layout(minWidth: 20, maxWidth: 60);
    plussign.paint(canvas, const Offset(64, 62.5));

    //Draw - sign
    final minsign = TextPainter(
      text: const TextSpan(
        text: '-',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    minsign.layout(minWidth: 20, maxWidth: 60);
    minsign.paint(canvas, const Offset(65, 87.5));

    // Draw resistor

    final resistorText = TextPainter(
      text: const TextSpan(
        text: 'R',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    resistorText.layout(minWidth: 20, maxWidth: 80);
    resistorText.paint(canvas, const Offset(165, 40));

    final capacitorText = TextPainter(
      text: const TextSpan(
        text: 'L',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    capacitorText.layout(minWidth: 20, maxWidth: 100);
    capacitorText.paint(canvas, const Offset(248, 75.5));

    // Draw capacitor
    /*
    canvas.drawLine(const Offset(250, 82.5), const Offset(300, 82.5),
        paint); //right top part
    canvas.drawLine(const Offset(250, 97.5), const Offset(300, 97.5),
        paint); //right bottom part
        */

    // Draw connecting wires
    canvas.drawLine(
        const Offset(70, 15), const Offset(70, 60), paint); //left top part
    canvas.drawLine(
        const Offset(70, 120), const Offset(70, 165), paint); //left bottom part
    canvas.drawLine(
        const Offset(275, 15), const Offset(275, 45), paint); //right top part
    canvas.drawLine(const Offset(275, 135), const Offset(275, 165),
        paint); //right bottom part
    canvas.drawLine(
        const Offset(70, 165), const Offset(275, 165), paint); //bottom

    canvas.drawLine(const Offset(70, 15), const Offset(125, 15),
        paint); //top left next to r
    canvas.drawLine(const Offset(215, 15), const Offset(275, 15),
        paint); //top right next to r

    //Draw ground
    canvas.drawLine(const Offset(170, 165), const Offset(170, 180), paint);
    canvas.drawLine(const Offset(155, 180), const Offset(185, 180), paint);
    canvas.drawLine(const Offset(160, 185), const Offset(180, 185), paint);
    canvas.drawLine(const Offset(165, 190), const Offset(175, 190), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
