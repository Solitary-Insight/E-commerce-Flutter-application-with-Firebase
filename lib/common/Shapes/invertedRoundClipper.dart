import 'package:flutter/material.dart';

class invertedRoundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final x = size.width;
    final y = size.height;

    path.lineTo(0, y);
    path.quadraticBezierTo(0, y - 20, 30, y - 20);
    path.quadraticBezierTo(30, y - 20, x - 30, y - 20);
    path.quadraticBezierTo(x, y - 20, x, y);
    path.lineTo(x, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class Coordinates {
  Coordinates({required this.x, required this.y});
  final double x;
  final double y;
}
