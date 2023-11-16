import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.amber,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("swafvan"),
                accountEmail: Text("swafvanma@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/cam.jpg'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                iconColor: Colors.white,
                title: Text(
                  "profile",
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                iconColor: Colors.white,
                title: Text(
                  "settings",
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                iconColor: Colors.white,
                title: Text(
                  "dashboard",
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.signal_cellular_4_bar),
                iconColor: Colors.white,
                title: Text(
                  "sign out",
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                onTap: () {},
              ),
            ],
          ),
        ),
        body: null);
  }
}
