import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  int indexnum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "settings",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "person",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "dashboard",
              backgroundColor: Colors.green),
        ],
        iconSize: 30,
        currentIndex: indexnum,
        onTap: (int index) {
          setstate(() {
            indexnum = index;
          });
        },
      ),
      body: null,
    );
  }

  void setstate(Null Function() param0) {}
}
