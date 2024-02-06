import 'package:flutter/material.dart';
import 'package:food_delivery_app/food_delivery.dart';
import 'package:food_delivery_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay for the splash screen duration (e.g., 2 seconds)
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FoodDelivery()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/Logo.png',
          width: screenSize.width * 0.8, // 80% of the screen width
          height: screenSize.width *
              0.8, // Set height based on the width for aspect r
        ),
      ),
    );
  }
}
