import 'package:flutter/cupertino.dart';

class TopHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // 👇 Bo cong ở đỉnh (phía trên)
    path.moveTo(0, 60);

    path.quadraticBezierTo(size.width / 2, 0, size.width, 60);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}