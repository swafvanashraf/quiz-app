import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/quizApp.dart/catogoryPage.dart';
import 'package:flutter_application_5/quizApp.dart/homePage.dart';
import 'package:flutter_application_5/quizApp.dart/provider.dart';
import 'package:flutter_application_5/quizApp.dart/quizPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class winlosepage extends StatefulWidget {
  winlosepage({required this.k});
  final int k;
  @override
  State<winlosepage> createState() => _winlosepageState();
}

List<Map<String, dynamic>> history = [];

class _winlosepageState extends State<winlosepage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    final Providerobj = Provider.of<QuizProvider>(context, listen: false);
    Providerobj.loadCategory();
    Providerobj.loadName();
    Providerobj.loadMark();
  }

  var ctime;

  // saveHistorylist() async {
  //   userInfo = {
  //     'username': savedName,
  //     'categoryName': category,
  //     'Mark': savedMark,
  //   };
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (category != null) {
  //     history.add(userInfo);
  //   }
  //   List<String> historyList = history.map((item) => jsonEncode(item)).toList();
  //   prefs.setStringList('historyKey', historyList);
  // }

  loadHistorylist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? historyList = prefs.getStringList('historyKey');
    if (historyList != null) {
      history = historyList.map((item) {
        return jsonDecode(item) as Map<String, dynamic>;
      }).toList();
    } else {
      // Handle the case where historyList is null, for example, by initializing history as an empty list.
      history = [];
    }
  }

  // loadCategory() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   category = (await prefs.getString('categoryKey') ?? '').toString();
  // }

  // loadName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   savedName = (await prefs.getString('myName') ?? '').toString();
  // }

  // loadMark() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   savedMark = (await prefs.getInt('markKey')) ?? 0;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final Providerobj = Provider.of<QuizProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 203, 184),
      body: WillPopScope(
        onWillPop: () {
          Providerobj.saveHistorylist();
          DateTime now = DateTime.now();
          if (ctime == null || now.difference(ctime) > Duration(seconds: 2)) {
            //add duration of press gap
            ctime = now;

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Center(
              child: Text('Press  Again to Home'),
            ))); //scaffold message, you can show Toast message too.
            return Future.value(false);
          }

          return Future.value(true);
        },
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Providerobj.savedMark < 3
                ? Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('images/oops.png'))
                : Image.asset('images/win.png'),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Color.fromARGB(255, 7, 93, 99), width: 3),
                color: Color.fromARGB(255, 218, 211, 183),
              ),
              child: Center(
                child: Consumer<QuizProvider>(builder: (context, value, child) {
                  return Text(
                    Provider.of<QuizProvider>(context).savedMark.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Color.fromARGB(255, 7, 93, 99)),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 218, 211, 183)),
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 7, 93, 99),
                  ),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 20,
                  )),
                ),
                onPressed: () {
                  Providerobj.saveHistorylist();
                  Providerobj.i = 0;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => quizPage(
                              selectedIndex: widget.k,
                            )),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.refresh),
                    Text("  Try again"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 218, 211, 183)),
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 7, 93, 99),
                  ),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 20,
                  )),
                ),
                onPressed: () {
                  Providerobj.i = 0;
                  Providerobj.saveHistorylist();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => catogoryPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.home),
                    Text("   Home"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 218, 211, 183)),
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 7, 93, 99),
                  ),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 20,
                  )),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('historyKey');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                  );
                  Provider.of<QuizProvider>(context, listen: false).logout();
                  Providerobj.i = 0;
                  Provider.of<QuizProvider>(context, listen: false).setBool();
                  signOut(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text("  Sign out"),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  void signOut(BuildContext context) async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    print('signed out');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => homepage()),
      (route) => false,
    );
  }
}
