import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    labelText: "user name",
                    hintText: "enter your username",
                    prefixIcon: Icon(Icons.verified_user),
                    suffixIcon: Icon(Icons.verified)),
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: "user name",
                    hintText: "enter your username",
                    prefixText: "Mr.",
                    suffixText: "hlo"),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: "user name",
                  hintText: "enter your username",
                  helperText: "enter your username or email",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.green),
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                      fontStyle: FontStyle.italic),
                ),
              ),
              TextFormField(
                maxLength: 10,
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.yellow, width: 4)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 4)),
                  label: const Text("Hi costomer"),
                ),
              ),
              const TextField(
                textAlign: TextAlign.center,
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
