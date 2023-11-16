import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "its me",
          style: TextStyle(
              fontSize: 30,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 1,
              wordSpacing: 50,
              backgroundColor: Colors.yellow,
              shadows: [
                Shadow(
                  color: Colors.black38,
                  offset: Offset(5, 5),
                  blurRadius: 15,
                )
              ]),
        ),
      ),
    );
  }
}
