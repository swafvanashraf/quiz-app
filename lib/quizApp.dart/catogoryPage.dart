import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/quizApp.dart/provider.dart';
import 'package:flutter_application_5/quizApp.dart/quizPage.dart';
import 'package:flutter_application_5/quizApp.dart/winlosepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class catogoryPage extends StatefulWidget {
  catogoryPage({
    super.key,
  });

  @override
  State<catogoryPage> createState() => _catogoryPageState();
}

class _catogoryPageState extends State<catogoryPage> {
  List<String> pictures = [
    'images/geometry.png',
    'images/chemistry.png',
    'images/physics.png',
    'images/maths.png',
  ];
  List<String> name = ['Geometry', 'Chemistry', 'Physics', 'Maths'];

  String? userName;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    loadUsernames();
    loadName();
    loadHistorylist();
  }

  // addToprovider() {
  //   selectedIndex = Provider.of<QuizProvider>(context).selectedIndex;
  //    index = Provider.of<QuizProvider>(context).index;
  //     myCategory = Provider.of<QuizProvider>(context).myCategory;
  // }

  List<String> Usernames = [];

  saveCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'categoryKey',
        Provider.of<QuizProvider>(context, listen: false)
            .myCategory
            .toString());
  }

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

  loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = (await prefs.getString('myName') ?? '').toString();
    setState(() {});
  }

  loadUsernames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? usernames = prefs.getStringList('userkey');
    if (usernames != null) {
      Usernames = usernames;
    } else {
      Usernames =
          []; // Initialize Usernames as an empty list if there's no data.
    }
  }

  @override
  Widget build(BuildContext context) {
    final Providerobj = Provider.of<QuizProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 168, 123),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('$userName !',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold))
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'images/avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 7, 93, 99),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Previous History',
                      style: TextStyle(
                        color: Color.fromARGB(255, 218, 211, 183),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                        decorationColor: Color.fromARGB(255, 218, 211, 183),
                      )),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text('Username       :',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Category         :',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Mark                :',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Time                :',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, left: 25),
                        child: Container(
                          height: 100,
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  history.length == 0
                                      ? 'No data'
                                      : history.last['username'].toString(),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                              // Consumer<QuizProvider>(
                              //     builder: (context, value, child) {
                              //   return Text(value.changeValue());
                              // }),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  history.length == 0
                                      ? 'No data'
                                      : history.last['categoryName'].toString(),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                  history.length == 0
                                      ? 'No data'
                                      : history.last['Mark'].toString(),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 5,
                              ),

                              Text('10:27',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 211, 183),
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 270),
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Dialog(
                                  backgroundColor:
                                      Color.fromARGB(255, 159, 168, 123),
                                  // Set the background color to white

                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 230),
                                        child: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: history.length,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Container(
                                            height: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Color.fromARGB(
                                                    255, 218, 211, 183)),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 50),
                                                  height: 70,
                                                  width: 90,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Username     :',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text('Category       :',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                          'Mark              :',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                          'Time              :',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  height: 70,
                                                  width: 90,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          history[index]
                                                                  ['username']
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                          history[index][
                                                                  'categoryName']
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                          history[index]['Mark']
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text('',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    7,
                                                                    93,
                                                                    99),
                                                            fontSize: 13,
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          'More..',
                          style: TextStyle(
                              color: Color.fromARGB(255, 27, 26, 26),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text("Categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
              ),
              itemCount: pictures
                  .length, // Replace with the total number of grid items
              itemBuilder: (context, index) {
                return Consumer<QuizProvider>(builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<QuizProvider>(context, listen: false)
                          .findCategory(index);
                      print(Provider.of<QuizProvider>(context, listen: false)
                          .logOutVariable);

                      saveCategory();
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Providerobj.selectedIndex == index
                              ? Color.fromARGB(255, 7, 93, 99)
                              : Color.fromARGB(255, 218, 211, 183),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                              height: 100,
                              width: 100,
                              child: Image.asset(pictures[index])),
                          SizedBox(
                            height: 10,
                          ),
                          Text(name[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Providerobj.selectedIndex == index
                                      ? Color.fromARGB(255, 207, 207, 205)
                                      : Color.fromARGB(255, 7, 93, 99)))
                        ],
                      ),
                    ),
                  );
                });
              }),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 207, 207, 205)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 7, 93, 99)),
              minimumSize: MaterialStateProperty.all(
                  const Size(335, 60)), // Increase the size here
              textStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 20,
              )),
            ),
            onPressed: () {
              if (Providerobj.selectedIndex == null) {
                final snackBar = SnackBar(
                  content: Center(child: Text('Please Select a category')),
                  duration:
                      Duration(seconds: 2), // Adjust the duration as needed
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => quizPage(
                            selectedIndex: Providerobj.selectedIndex!,
                          )),
                );
              }
            },
            child: const Text("Let's Play"),
          ),
        ],
      ),
    );
  }
}
