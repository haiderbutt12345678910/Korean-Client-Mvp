import 'package:flutter/material.dart';

class BottomNavBarCustomStyle extends StatelessWidget {
  const BottomNavBarCustomStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: size.width * 0.16,
        child: Stack(
          children: [
            Positioned(
              top: size.width * 0.11,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: size.width * 0.13, // Adjust the height as needed
                color: Colors.black, // Set the background color to black
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.width * 0.083,
              left: size.width * 0.411,
              child: Container(
                width: size.width * .17,
                // Set the width and height to create a circle
                height: size.width * .17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white.withOpacity(.5),
                    width: 1.0, // Adjust the border width as needed
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.width * 0.1139,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: size.width * .18,

                color: Colors.black, // Set the background color to black
                child: Container(
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
