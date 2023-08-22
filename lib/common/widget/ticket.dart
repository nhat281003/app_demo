import 'package:flutter/material.dart';


class CustomClip extends CustomClipper<Path> {
  CustomClip({required this.fromTop, required this.radius,required this.borderRadiusCorner});

  final double fromTop;
  final double radius;
  final double borderRadiusCorner;



  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final path = Path()
      ..moveTo(rect.left + borderRadiusCorner, 0)
      ..lineTo(fromTop-radius, 0)
      ..arcToPoint(Offset(fromTop+radius, 0),
          radius: Radius.circular(radius),
          clockwise: false)
      ..lineTo(rect.right - borderRadiusCorner, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + borderRadiusCorner),
        radius:  Radius.circular(borderRadiusCorner),
        clockwise: true,
      )
      ..lineTo(rect.right, rect.bottom - borderRadiusCorner)
      ..arcToPoint(
        Offset(rect.right - borderRadiusCorner, rect.bottom),
        radius:  Radius.circular(borderRadiusCorner),
        clockwise: true,
      )
      ..lineTo(fromTop+radius, size.height)
      ..arcToPoint(Offset(fromTop-radius, size.height),
          radius: Radius.circular(radius),
          clockwise: false)
      ..lineTo(rect.left +borderRadiusCorner, rect.bottom )
      ..arcToPoint(
        Offset(rect.left , rect.bottom - borderRadiusCorner ),
        radius:  Radius.circular(borderRadiusCorner),
        clockwise: true,
      )
      ..lineTo(rect.left, rect.top + borderRadiusCorner)
      ..arcToPoint(
        Offset(rect.left + borderRadiusCorner, rect.top),
        radius:  Radius.circular(borderRadiusCorner),
        clockwise: true,
      )
      ..close();
    return path;
  }


  @override
  bool shouldReclip(CustomClip oldClipper) => true;
}


class MyPainter extends CustomPainter {
  final Path path;
  final Color color;
  final double strokeWidth;

  MyPainter({
    required this.path,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
    ;

    canvas.drawPath(path, paint);
  }




  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




