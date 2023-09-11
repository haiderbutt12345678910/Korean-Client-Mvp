import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 20, // Set a fixed height here
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(.5),
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: HalfCircleClipper(),
          child: Container(
            width: 20, // Set a fixed width here (half the size of the circle)
            height: 20, // Set a fixed height here
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
