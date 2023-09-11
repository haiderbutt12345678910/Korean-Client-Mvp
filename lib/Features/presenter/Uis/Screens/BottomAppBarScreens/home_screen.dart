import 'package:flutter/material.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Global/bottomnappbarcustom_style.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Global/customappbar.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Global/greadient_bg.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Profiles/allprofile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const GradientBackGroundWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.width * .04,
              ),
              const ProfilesWidget(),
              const BottomNavBarCustomStyle()
            ],
          ),
        ],
      ),
    );
  }
}
