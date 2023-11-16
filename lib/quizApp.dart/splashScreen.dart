import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/quizApp.dart/catogoryPage.dart';
import 'package:flutter_application_5/quizApp.dart/homePage.dart';
import 'package:flutter_application_5/quizApp.dart/provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).getBool();
    // Add a delay for the splash screen (e.g., 2 seconds).
    Timer(Duration(seconds: 2), () {
      // Navigate to the main content or home page.
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Consumer<QuizProvider>(
          builder: (context, value, child) {
            return Provider.of<QuizProvider>(context, listen: false)
                        .logOutVar ==
                    true
                ? homepage()
                : catogoryPage();
          },
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 93, 99),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your splash screen content here (e.g., logo or image).
            Image.asset('images/q.png', width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}
