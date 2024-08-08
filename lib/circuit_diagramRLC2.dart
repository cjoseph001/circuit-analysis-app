import 'package:flutter/material.dart';
import 'dart:math';

class CircuitDiagramRLC2 extends StatelessWidget {
  final double canvaswidth;
  final double canvasheight;

  const CircuitDiagramRLC2(
      {Key? key, required this.canvasheight, required this.canvaswidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(canvaswidth, canvasheight), // Use the canvasSize variable
      painter: CircuitPainterRLC2(),
    );
  }
}

class CircuitPainterRLC2 extends CustomPainter {
  final double canvaswidth;
  final double canvasheight; // Variable to adjust the canvas size
// Load the image in the constructor
  CircuitPainterRLC2({this.canvaswidth = 600.0, this.canvasheight = 600.0});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 5, 95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const line1Start = Offset(76.25, 15);
    const line1End = Offset(78.75, 2.5);

    const line2Start = Offset(78.75, 2.5);
    const line2End = Offset(83.75, 27.5);

    const line3Start = Offset(83.75, 27.5);
    const line3End = Offset(88.75, 2.5);

    const line4Start = Offset(88.75, 2.5);
    const line4End = Offset(93.75, 27.5);

    const line5Start = Offset(93.75, 27.5);
    const line5End = Offset(98.75, 2.5);

    const line6Start = Offset(98.75, 2.5);
    const line6End = Offset(103.75, 27.5);

    const line7Start = Offset(103.75, 27.5);
    const line7End = Offset(108.75, 2.5);

    const line8Start = Offset(108.75, 2.5);
    const line8End = Offset(113.75, 27.5);

    const line9Start = Offset(113.75, 27.5);
    const line9End = Offset(116.25, 15);

    canvas.drawLine(line1Start, line1End, paint);
    canvas.drawLine(line2Start, line2End, paint);
    canvas.drawLine(line3Start, line3End, paint);
    canvas.drawLine(line4Start, line4End, paint);
    canvas.drawLine(line5Start, line5End, paint);
    canvas.drawLine(line6Start, line6End, paint);
    canvas.drawLine(line7Start, line7End, paint);
    canvas.drawLine(line8Start, line8End, paint);
    canvas.drawLine(line9Start, line9End, paint);

    final rect = Rect.fromCenter(
      center: const Offset(160, 15),
      width: 10,
      height: 25,
    );
    final rect2 = Rect.fromCenter(
      center: const Offset(170, 15),
      width: 10,
      height: 25,
    );
    final rect3 = Rect.fromCenter(
      center: const Offset(180, 15),
      width: 10,
      height: 25,
    );
    final rect4 = Rect.fromCenter(
      center: const Offset(190, 15),
      width: 10,
      height: 25,
    );
    final rect5 = Rect.fromCenter(
      center: const Offset(32.5, 90),
      width: 20,
      height: 25,
    );
    final rect6 = Rect.fromCenter(
      center: const Offset(12.5, 90),
      width: 20,
      height: 25,
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
    canvas.drawArc(
      rect4,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect5,
      0, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect6,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawLine(
        const Offset(22.5, 15), const Offset(22.5, 65), paint); //left top part
    canvas.drawLine(const Offset(22.5, 115), const Offset(22.5, 165),
        paint); //left bottom part
    canvas.drawLine(const Offset(317.5, 15), const Offset(317.5, 70),
        paint); //right top part
    canvas.drawLine(const Offset(317.5, 110), const Offset(317.5, 165),
        paint); //right bottom part
    canvas.drawLine(
        const Offset(22.5, 165), const Offset(317.5, 165), paint); //bottom

    canvas.drawLine(const Offset(22.5, 15), const Offset(76.25, 15),
        paint); //top left next to r
    canvas.drawLine(const Offset(116.25, 15), const Offset(155, 15), paint);
    canvas.drawLine(const Offset(195, 15), const Offset(238.75, 15), paint);
    canvas.drawLine(const Offset(251.55, 15), const Offset(317.5, 15), paint);

    // Draw voltage source
    final voltageSource =
        Rect.fromPoints(const Offset(-2.5, 65), const Offset(47.5, 115));
    canvas.drawOval(voltageSource, paint);

    // Draw capacitor
    canvas.drawLine(const Offset(238.75, 2.5), const Offset(238.75, 27.5),
        paint); //right top part
    canvas.drawLine(const Offset(251.55, 2.5), const Offset(251.55, 27.5),
        paint); //right bottom part

    // Draw connecting wires
//left-right 12,5 25
//down 2.5 5
    const line10Start = Offset(317.5, 70);
    const line10End = Offset(305, 72.5);

    const line11Start = Offset(305, 72.5);
    const line11End = Offset(330, 77.5);

    const line12Start = Offset(330, 77.5);
    const line12End = Offset(305, 82.5);

    const line13Start = Offset(305, 82.5);
    const line13End = Offset(330, 87.5);

    const line14Start = Offset(330, 87.5);
    const line14End = Offset(305, 92.5);

    const line15Start = Offset(305, 92.5);
    const line15End = Offset(330, 97.5);

    const line16Start = Offset(330, 97.5);
    const line16End = Offset(305, 102.5);

    const line17Start = Offset(305, 102.5);
    const line17End = Offset(330, 107.5);

    const line18Start = Offset(330, 107.5);
    const line18End = Offset(317.5, 110);

    canvas.drawLine(line10Start, line10End, paint);
    canvas.drawLine(line11Start, line11End, paint);
    canvas.drawLine(line12Start, line12End, paint);
    canvas.drawLine(line13Start, line13End, paint);
    canvas.drawLine(line14Start, line14End, paint);
    canvas.drawLine(line15Start, line15End, paint);
    canvas.drawLine(line16Start, line16End, paint);
    canvas.drawLine(line17Start, line17End, paint);
    canvas.drawLine(line18Start, line18End, paint);

//Draw ground
    canvas.drawLine(const Offset(170, 165), const Offset(170, 180), paint);
    canvas.drawLine(const Offset(155, 180), const Offset(185, 180), paint);
    canvas.drawLine(const Offset(160, 185), const Offset(180, 185), paint);
    canvas.drawLine(const Offset(165, 190), const Offset(175, 190), paint);
    /*final voltageText = TextPainter(
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
    voltageText.paint(canvas, const Offset(110, 75.5));*/

    //Draw + sign
    /*final plussign = TextPainter(
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
    plussign.paint(canvas, const Offset(64, 62.5));*/

    //Draw - sign
    /*final minsign = TextPainter(
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
    minsign.paint(canvas, const Offset(65, 87.5));*/

    // Draw resistor

    final resistorText = TextPainter(
      text: const TextSpan(
        text: 'R',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    resistorText.layout(minWidth: 20, maxWidth: 80);
    resistorText.paint(canvas, const Offset(92, 31));

    final capacitorText = TextPainter(
      text: const TextSpan(
        text: 'C',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    capacitorText.layout(minWidth: 20, maxWidth: 100);
    capacitorText.paint(canvas, const Offset(238, 31));

    final inductorText = TextPainter(
      text: const TextSpan(
        text: 'L',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    inductorText.layout(minWidth: 20, maxWidth: 100);
    inductorText.paint(canvas, const Offset(173, 20));

    final loadText = TextPainter(
      text: const TextSpan(
        text: 'Load',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 5, 95),
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    loadText.layout(minWidth: 20, maxWidth: 100);
    loadText.paint(canvas, const Offset(272.5, 85));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
 
class CircuitDiagramRLC5 extends StatelessWidget {
  final double canvaswidth;
  final double canvasheight;

  const CircuitDiagramRLC5(
      {Key? key, required this.canvasheight, required this.canvaswidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(canvaswidth, canvasheight), // Use the canvasSize variable
      painter: CircuitPainterRLC5(),
    );
  }
}

class CircuitPainterRLC5 extends CustomPainter {
  final double canvaswidth;
  final double canvasheight; // Variable to adjust the canvas size
// Load the image in the constructor
  CircuitPainterRLC5({this.canvaswidth = 600.0, this.canvasheight = 600.0});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 5, 95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const line1Start = Offset(76.25, 15);
    const line1End = Offset(78.75, 2.5);

    const line2Start = Offset(78.75, 2.5);
    const line2End = Offset(83.75, 27.5);

    const line3Start = Offset(83.75, 27.5);
    const line3End = Offset(88.75, 2.5);

    const line4Start = Offset(88.75, 2.5);
    const line4End = Offset(93.75, 27.5);

    const line5Start = Offset(93.75, 27.5);
    const line5End = Offset(98.75, 2.5);

    const line6Start = Offset(98.75, 2.5);
    const line6End = Offset(103.75, 27.5);

    const line7Start = Offset(103.75, 27.5);
    const line7End = Offset(108.75, 2.5);

    const line8Start = Offset(108.75, 2.5);
    const line8End = Offset(113.75, 27.5);

    const line9Start = Offset(113.75, 27.5);
    const line9End = Offset(116.25, 15);

    canvas.drawLine(line1Start, line1End, paint);
    canvas.drawLine(line2Start, line2End, paint);
    canvas.drawLine(line3Start, line3End, paint);
    canvas.drawLine(line4Start, line4End, paint);
    canvas.drawLine(line5Start, line5End, paint);
    canvas.drawLine(line6Start, line6End, paint);
    canvas.drawLine(line7Start, line7End, paint);
    canvas.drawLine(line8Start, line8End, paint);
    canvas.drawLine(line9Start, line9End, paint);

    final rect = Rect.fromCenter(
      center: const Offset(160, 15),
      width: 10,
      height: 25,
    );
    final rect2 = Rect.fromCenter(
      center: const Offset(170, 15),
      width: 10,
      height: 25,
    );
    final rect3 = Rect.fromCenter(
      center: const Offset(180, 15),
      width: 10,
      height: 25,
    );
    final rect4 = Rect.fromCenter(
      center: const Offset(190, 15),
      width: 10,
      height: 25,
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
    canvas.drawArc(
      rect4,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );

    canvas.drawLine(
        const Offset(22.5, 15), const Offset(22.5, 165), paint); //left top part

    canvas.drawLine(
        const Offset(22.5, 165), const Offset(317.5, 165), paint); //bottom

    canvas.drawLine(const Offset(22.5, 15), const Offset(76.25, 15),
        paint); //top left next to r
    canvas.drawLine(const Offset(116.25, 15), const Offset(155, 15), paint);
    canvas.drawLine(const Offset(195, 15), const Offset(238.75, 15), paint);
    canvas.drawLine(const Offset(251.55, 15), const Offset(317.5, 15), paint);

    // Draw voltage source

    // Draw capacitor
    canvas.drawLine(const Offset(238.75, 2.5), const Offset(238.75, 27.5),
        paint); //right top part
    canvas.drawLine(const Offset(251.55, 2.5), const Offset(251.55, 27.5),
        paint); //right bottom part

    // Draw connecting wires
//left-right 12,5 25
//down 2.5 5

//Draw ground
    canvas.drawLine(const Offset(170, 165), const Offset(170, 180), paint);
    canvas.drawLine(const Offset(155, 180), const Offset(185, 180), paint);
    canvas.drawLine(const Offset(160, 185), const Offset(180, 185), paint);
    canvas.drawLine(const Offset(165, 190), const Offset(175, 190), paint);
    /*final voltageText = TextPainter(
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
    voltageText.paint(canvas, const Offset(110, 75.5));*/

    //Draw + sign
    /*final plussign = TextPainter(
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
    plussign.paint(canvas, const Offset(64, 62.5));*/

    //Draw - sign
    /*final minsign = TextPainter(
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
    minsign.paint(canvas, const Offset(65, 87.5));*/

    // Draw resistor

    final resistorText = TextPainter(
      text: const TextSpan(
        text: 'Z_R',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    resistorText.layout(minWidth: 20, maxWidth: 80);
    resistorText.paint(canvas, const Offset(80, 35));

    final capacitorText = TextPainter(
      text: const TextSpan(
        text: 'Z_C',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    capacitorText.layout(minWidth: 20, maxWidth: 100);
    capacitorText.paint(canvas, const Offset(230, 35));

    final inductorText = TextPainter(
      text: const TextSpan(
        text: 'Z_L',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    inductorText.layout(minWidth: 20, maxWidth: 100);
    inductorText.paint(canvas, const Offset(163, 25));

    final zthText = TextPainter(
      text: const TextSpan(
        text: 'Z_Th',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    zthText.layout(minWidth: 20, maxWidth: 100);
    zthText.paint(canvas, const Offset(280, 80));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircuitDiagramRLC6 extends StatelessWidget {
  final double canvaswidth;
  final double canvasheight;

  const CircuitDiagramRLC6(
      {Key? key, required this.canvasheight, required this.canvaswidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(canvaswidth, canvasheight), // Use the canvasSize variable
      painter: CircuitPainterRLC6(),
    );
  }
}

class CircuitPainterRLC6 extends CustomPainter {
  final double canvaswidth;
  final double canvasheight; // Variable to adjust the canvas size
// Load the image in the constructor
  CircuitPainterRLC6({this.canvaswidth = 600.0, this.canvasheight = 600.0});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 5, 95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const line1Start = Offset(76.25, 15);
    const line1End = Offset(78.75, 2.5);

    const line2Start = Offset(78.75, 2.5);
    const line2End = Offset(83.75, 27.5);

    const line3Start = Offset(83.75, 27.5);
    const line3End = Offset(88.75, 2.5);

    const line4Start = Offset(88.75, 2.5);
    const line4End = Offset(93.75, 27.5);

    const line5Start = Offset(93.75, 27.5);
    const line5End = Offset(98.75, 2.5);

    const line6Start = Offset(98.75, 2.5);
    const line6End = Offset(103.75, 27.5);

    const line7Start = Offset(103.75, 27.5);
    const line7End = Offset(108.75, 2.5);

    const line8Start = Offset(108.75, 2.5);
    const line8End = Offset(113.75, 27.5);

    const line9Start = Offset(113.75, 27.5);
    const line9End = Offset(116.25, 15);

    canvas.drawLine(line1Start, line1End, paint);
    canvas.drawLine(line2Start, line2End, paint);
    canvas.drawLine(line3Start, line3End, paint);
    canvas.drawLine(line4Start, line4End, paint);
    canvas.drawLine(line5Start, line5End, paint);
    canvas.drawLine(line6Start, line6End, paint);
    canvas.drawLine(line7Start, line7End, paint);
    canvas.drawLine(line8Start, line8End, paint);
    canvas.drawLine(line9Start, line9End, paint);

    final rect = Rect.fromCenter(
      center: const Offset(160, 15),
      width: 10,
      height: 25,
    );
    final rect2 = Rect.fromCenter(
      center: const Offset(170, 15),
      width: 10,
      height: 25,
    );
    final rect3 = Rect.fromCenter(
      center: const Offset(180, 15),
      width: 10,
      height: 25,
    );
    final rect4 = Rect.fromCenter(
      center: const Offset(190, 15),
      width: 10,
      height: 25,
    );
    final rect5 = Rect.fromCenter(
      center: const Offset(32.5, 90),
      width: 20,
      height: 25,
    );
    final rect6 = Rect.fromCenter(
      center: const Offset(12.5, 90),
      width: 20,
      height: 25,
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
    canvas.drawArc(
      rect4,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect5,
      0, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect6,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawLine(
        const Offset(22.5, 15), const Offset(22.5, 65), paint); //left top part
    canvas.drawLine(const Offset(22.5, 115), const Offset(22.5, 165),
        paint); //left bottom part

    canvas.drawLine(
        const Offset(22.5, 165), const Offset(317.5, 165), paint); //bottom

    canvas.drawLine(const Offset(22.5, 15), const Offset(76.25, 15),
        paint); //top left next to r
    canvas.drawLine(const Offset(116.25, 15), const Offset(155, 15), paint);
    canvas.drawLine(const Offset(195, 15), const Offset(238.75, 15), paint);
    canvas.drawLine(const Offset(251.55, 15), const Offset(317.5, 15), paint);

    // Draw voltage source
    final voltageSource =
        Rect.fromPoints(const Offset(-2.5, 65), const Offset(47.5, 115));
    canvas.drawOval(voltageSource, paint);

    // Draw capacitor
    canvas.drawLine(const Offset(238.75, 2.5), const Offset(238.75, 27.5),
        paint); //right top part
    canvas.drawLine(const Offset(251.55, 2.5), const Offset(251.55, 27.5),
        paint); //right bottom part

    // Draw connecting wires
//left-right 12,5 25

//Draw ground
    canvas.drawLine(const Offset(170, 165), const Offset(170, 180), paint);
    canvas.drawLine(const Offset(155, 180), const Offset(185, 180), paint);
    canvas.drawLine(const Offset(160, 185), const Offset(180, 185), paint);
    canvas.drawLine(const Offset(165, 190), const Offset(175, 190), paint);
    /*final voltageText = TextPainter(
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
    voltageText.paint(canvas, const Offset(110, 75.5));*/

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
    plussign.paint(canvas, const Offset(310, 18.5));

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
    minsign.paint(canvas, const Offset(310, 131.5));

    // Draw resistor

    final resistorText = TextPainter(
      text: const TextSpan(
        text: 'R',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    resistorText.layout(minWidth: 20, maxWidth: 80);
    resistorText.paint(canvas, const Offset(92, 31));

    final capacitorText = TextPainter(
      text: const TextSpan(
        text: 'C',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    capacitorText.layout(minWidth: 20, maxWidth: 100);
    capacitorText.paint(canvas, const Offset(238, 31));

    final inductorText = TextPainter(
      text: const TextSpan(
        text: 'L',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    inductorText.layout(minWidth: 20, maxWidth: 100);
    inductorText.paint(canvas, const Offset(173, 20));

    final vTH = TextPainter(
      text: const TextSpan(
        text: 'V_Th',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    vTH.layout(minWidth: 20, maxWidth: 100);
    vTH.paint(canvas, const Offset(280, 80));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircuitDiagramRLC7 extends StatelessWidget {
  final double canvaswidth;
  final double canvasheight;

  const CircuitDiagramRLC7(
      {Key? key, required this.canvasheight, required this.canvaswidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(canvaswidth, canvasheight), // Use the canvasSize variable
      painter: CircuitPainterRLC7(),
    );
  }
}

class CircuitPainterRLC7 extends CustomPainter {
  final double canvaswidth;
  final double canvasheight; // Variable to adjust the canvas size
// Load the image in the constructor
  CircuitPainterRLC7({this.canvaswidth = 600.0, this.canvasheight = 600.0});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 5, 95)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawLine(
        const Offset(22.5, 15), const Offset(22.5, 65), paint); //left top part
    canvas.drawLine(const Offset(22.5, 115), const Offset(22.5, 165),
        paint); //left bottom part
    canvas.drawLine(const Offset(317.5, 15), const Offset(317.5, 70),
        paint); //right top part
    canvas.drawLine(const Offset(317.5, 110), const Offset(317.5, 165),
        paint); //right bottom part
    canvas.drawLine(
        const Offset(22.5, 165), const Offset(317.5, 165), paint); //bottom

    canvas.drawLine(const Offset(22.5, 15), const Offset(116.25, 15),
        paint); //top left next to r
    canvas.drawLine(const Offset(116.25, 15), const Offset(155, 15), paint);
    canvas.drawLine(const Offset(195, 15), const Offset(317.5, 15), paint);
    Rect rect = Rect.fromPoints(const Offset(155, 5), const Offset(195, 25));
    canvas.drawRect(rect, paint);

    // Draw voltage source
    final voltageSource =
        Rect.fromPoints(const Offset(-2.5, 65), const Offset(47.5, 115));
    canvas.drawOval(voltageSource, paint);

    // Draw capacitor

    // Draw connecting wires
//left-right 12,5 25
//down 2.5 5
    const line10Start = Offset(317.5, 70);
    const line10End = Offset(305, 72.5);

    const line11Start = Offset(305, 72.5);
    const line11End = Offset(330, 77.5);

    const line12Start = Offset(330, 77.5);
    const line12End = Offset(305, 82.5);

    const line13Start = Offset(305, 82.5);
    const line13End = Offset(330, 87.5);

    const line14Start = Offset(330, 87.5);
    const line14End = Offset(305, 92.5);

    const line15Start = Offset(305, 92.5);
    const line15End = Offset(330, 97.5);

    const line16Start = Offset(330, 97.5);
    const line16End = Offset(305, 102.5);

    const line17Start = Offset(305, 102.5);
    const line17End = Offset(330, 107.5);

    const line18Start = Offset(330, 107.5);
    const line18End = Offset(317.5, 110);

    canvas.drawLine(line10Start, line10End, paint);
    canvas.drawLine(line11Start, line11End, paint);
    canvas.drawLine(line12Start, line12End, paint);
    canvas.drawLine(line13Start, line13End, paint);
    canvas.drawLine(line14Start, line14End, paint);
    canvas.drawLine(line15Start, line15End, paint);
    canvas.drawLine(line16Start, line16End, paint);
    canvas.drawLine(line17Start, line17End, paint);
    canvas.drawLine(line18Start, line18End, paint);

//Draw ground
    canvas.drawLine(const Offset(170, 165), const Offset(170, 180), paint);
    canvas.drawLine(const Offset(155, 180), const Offset(185, 180), paint);
    canvas.drawLine(const Offset(160, 185), const Offset(180, 185), paint);
    canvas.drawLine(const Offset(165, 190), const Offset(175, 190), paint);
    /*final voltageText = TextPainter(
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
    voltageText.paint(canvas, const Offset(110, 75.5));*/

    //Draw + sign
    /*final plussign = TextPainter(
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
    plussign.paint(canvas, const Offset(64, 62.5));*/

    //Draw - sign
    /*final minsign = TextPainter(
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
    minsign.paint(canvas, const Offset(65, 87.5));*/

    // Draw resistor
    canvas.drawArc(
      rect5,
      0, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    canvas.drawArc(
      rect6,
      pi, // Start angle (0 degrees in radians)
      pi, // Sweep angle (180 degrees in radians)
      false,
      paint,
    );
    final inductorText = TextPainter(
      text: const TextSpan(
        text: 'Z_Th',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 5, 95),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    inductorText.layout(minWidth: 20, maxWidth: 100);
    inductorText.paint(canvas, const Offset(156.5, 35));

    final loadText = TextPainter(
      text: const TextSpan(
        text: 'R_Load',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 5, 95),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    loadText.layout(minWidth: 20, maxWidth: 100);
    loadText.paint(canvas, const Offset(250, 82.5));

    final vTHText = TextPainter(
      text: const TextSpan(
        text: 'V_Th',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 5, 95),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    vTHText.layout(minWidth: 20, maxWidth: 100);
    vTHText.paint(canvas, const Offset(57.5, 82.5));
  }

  final rect5 = Rect.fromCenter(
    center: const Offset(32.5, 90),
    width: 20,
    height: 25,
  );
  final rect6 = Rect.fromCenter(
    center: const Offset(12.5, 90),
    width: 20,
    height: 25,
  );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
