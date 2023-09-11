import 'package:flutter/material.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Screens/BottomAppBarScreens/chat_screen.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Screens/BottomAppBarScreens/home_screen.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Screens/BottomAppBarScreens/location_screen.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Screens/BottomAppBarScreens/profile_screen.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Global/customappbar.dart';
import 'package:flutter_application_assignmnet/const.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final screens = [
    const HomeScreen(),
    const LocationScreen(),
    const ChatScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(size.width * .2), // Set the desired height
          child: const CustomAppBar(), // Use your custom app bar widget
        ),
        body: screens[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your FAB action here
          },
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Image.asset(
            "Assets/Images/fab.png",
            fit: BoxFit.cover,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * .01, vertical: 0),
          color: Colors.black,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < bottomNavBarIconsList.length; i++)
                InkWell(
                  onTap: () {
                    _onTabTapped(i);
                  },
                  child: Image.asset(
                    bottomNavBarIconsList[i],
                    color:
                        _currentIndex == i ? Colors.pinkAccent : Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
