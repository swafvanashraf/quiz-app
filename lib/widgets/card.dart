import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // page scroll cheyyan
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: const Color.fromARGB(255, 15, 137, 236),
            child: Column(
              children: [
                ListTile(
                  title: Text("swafvan"),
                  subtitle: Text("rare case"),
                  textColor: Colors.amber,
                  leading: Icon(Icons.link_off),
                  iconColor: Colors.amber,
                  trailing: Icon(Icons.more_horiz),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: const Color.fromARGB(255, 15, 137, 236),
            shadowColor: Colors.red,
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ListTile(
                  title: Text("saleel"),
                  subtitle: Text("rare case"),
                  textColor: Colors.amber,
                  leading: Icon(Icons.link_off),
                  iconColor: Colors.amber,
                  trailing: Icon(Icons.more_horiz),
                  onTap: () {},
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
