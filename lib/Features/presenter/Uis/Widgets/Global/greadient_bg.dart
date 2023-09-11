import 'package:flutter/material.dart';

class GradientBackGroundWidget extends StatelessWidget {
  const GradientBackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(1), // Black with opacity
            Colors.black.withOpacity(0.6), // Grey with opacity
          ],
        ),
      ),
    );
  }
}
