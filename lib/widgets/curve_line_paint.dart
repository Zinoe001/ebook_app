import 'package:flutter/material.dart';

class CurveLinePaint extends StatelessWidget {
  const CurveLinePaint({Key? key, required this.colorCode}) : super(key: key);
  final int colorCode;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: CurvePainter(
              curveColor: Color(colorCode).withOpacity(0.1),
              curveHeight: 350,
              height: 225),
          child: const SizedBox(),
        ),
        CustomPaint(
          painter: CurvePainter(
              curveColor: Color(colorCode).withOpacity(0.2),
              curveHeight: 312.5,
              height: 187.5),
          child: const SizedBox(),
        ),
        CustomPaint(
          painter: CurvePainter(
              curveColor: Color(colorCode).withOpacity(0.4),
              curveHeight: 275,
              height: 150),
          child: const SizedBox(),
        ),
        CustomPaint(
          painter: CurvePainter(
              curveColor: Color(colorCode).withOpacity(0.6),
              curveHeight: 237.5,
              height: 112.5),
          child: const SizedBox(),
        ),
        CustomPaint(
          painter: CurvePainter(
              curveColor: Color(colorCode).withOpacity(0.8),
              curveHeight: 200,
              height: 75),
          child: const SizedBox(),
        ),
        CustomPaint(
          painter: CurvePainter(
              curveColor: Color(colorCode).withOpacity(1),
              curveHeight: 162.5,
              height: 37.5),
          child: const SizedBox(),
        ),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  const CurvePainter({
    Key? key,
    required this.height,
    required this.curveHeight,
    required this.curveColor,
  }) : super();
  final double height;
  final double curveHeight;
  final Color curveColor;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = curveColor;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.quadraticBezierTo(size.width / 2, curveHeight, size.width, height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
