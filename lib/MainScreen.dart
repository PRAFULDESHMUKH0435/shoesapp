import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/Controllers/mainscreen_provider.dart';
import 'package:shoesapp/Screens/CartScreen.dart';
import 'package:shoesapp/Screens/HomeScreen.dart';
import 'package:shoesapp/Screens/ProfileScreen.dart';
import 'package:shoesapp/Screens/SearchScreen.dart';
import 'package:shoesapp/Screens/SingleItemScreen.dart';
import 'Constants/SingleItemBottomNavIcon.dart';
import 'Views/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  List<Widget> screensList=[
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context,mainScreenNotifier,child){
        return Scaffold(
          backgroundColor: Color(0xFFE2E2E2),
          // body: SingleItemScreen(),
          body: screensList[mainScreenNotifier.pageIndex],
          /// Bottom Navbar
          bottomNavigationBar:const BottomNavbar(),
        );
      },
    );
  }
}
