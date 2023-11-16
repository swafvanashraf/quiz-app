import 'dart:developer';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 20)),
                    foregroundColor: MaterialStateProperty.all(Colors.amber)),
                onPressed: () {
                  log(1 as String);
                },
                child: const Text("text botton")),
            TextButton.icon(
              style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                  foregroundColor: MaterialStateProperty.all(Colors.amber)),
              onPressed: () {
                log(1 as String);
              },
              onLongPress: () {
                log(2 as String);
              },
              icon: const Icon(Icons.home),
              label: const Text("home"),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.amber),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                minimumSize: MaterialStateProperty.all(const Size(150, 150)),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 20,
                )),
              ),
              onPressed: () {},
              child: const Text("Sign Up"),
            ),
            OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  side: MaterialStateProperty.all(BorderSide(
                    color: Colors.yellow,
                    width: 5,
                  )),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  foregroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                onPressed: () {},
                child: Text("sign in")),
          ],
        ),
      ),
    );
  }
}
