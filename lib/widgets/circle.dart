import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: (Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black38,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.amber,
                foregroundColor: Colors.red,
                child: Text(
                  "sign in",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black12,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.verified_user,
                  size: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 40,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images / shoe.jpg'),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
