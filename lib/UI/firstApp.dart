// ignore: file_names
import 'package:flutter/material.dart';
import './bottumsheet.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 69, 93, 228),
          Color.fromARGB(255, 223, 52, 109)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Column(children: [
          Row(
            children: [
              Container(
                height: 90,
                width: 170,
                margin: const EdgeInsets.fromLTRB(15, 60, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: const Text(
                            'Hello!',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 240, 237, 237)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 43, 0),
                          child: const Text(
                            'John Doe',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.fromLTRB(130, 25, 20, 0),
                height: 57,
                width: 57,
                child: Image.asset(
                  'images/app.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(136, 0, 0, 0),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 3),
                    )
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Color.fromARGB(199, 230, 232, 233),
                  labelText: "Search medical..",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 35, 255, 0),
            child: const Text(
              'Category',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 119, //screeninte atra thanne width kittaan
                  height: 137,
                  margin: const EdgeInsets.only(top: 30, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 252, 96, 148),
                      Color.fromARGB(255, 235, 35, 102)
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14, top: 14),
                          child: Image.asset('images/brush.png'),
                        ),
                        Container(
                          height: 23,
                          width: 80,
                          margin: EdgeInsets.only(left: 17, top: 14),
                          child: Text(
                            'Design',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 2, left: 18),
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                            Container(
                              margin: EdgeInsets.only(top: 4, left: 5),
                              child: Text(
                                '5 Task',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ]),
                ),
                Container(
                  width: 119, //screeninte atra thanne width kittaan
                  height: 137,
                  margin: const EdgeInsets.only(top: 30, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFF09819),
                        Color(0xD1EDCD4C),
                        Color(0x72EDDE5D)
                      ],
                    ),
                  ),

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14, top: 11),
                          child: Image.asset('images/health.png'),
                        ),
                        Container(
                          height: 23,
                          width: 80,
                          margin: EdgeInsets.only(left: 17, top: 10),
                          child: Text(
                            'Meeting',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 2, left: 18),
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                            Container(
                              margin: EdgeInsets.only(top: 4, left: 5),
                              child: Text(
                                '1 Task',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ]),
                ),
                Container(
                  width: 119, //screeninte atra thanne width kittaan
                  height: 137,
                  margin: const EdgeInsets.only(top: 30, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xFF00CD5E), Color(0xFF9BBAFF)]),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14, top: 14),
                          child: Image.asset('images/carbon.png'),
                        ),
                        Container(
                          height: 23,
                          width: 80,
                          margin: EdgeInsets.only(left: 17, top: 14),
                          child: Text(
                            'Learning',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 2, left: 18),
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                            Container(
                              margin: EdgeInsets.only(top: 4, left: 5),
                              child: Text(
                                '2 Task',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showbottom(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 354.4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: 80,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(134, 0, 0, 0)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Text("Today's Task",
                          style: TextStyle(
                            fontSize: 23.80000114440918,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Container(
                          child: Image.asset('images/pen.png'),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xbf2bd2aa))),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Container(
                            child: Text("Sketching",
                                style: TextStyle(
                                    fontSize: 18.745134353637695,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, left: 8),
                          child: Container(
                            child: Text("3 completed",
                                style: TextStyle(fontSize: 12.15900707244873)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                        child: Center(
                          child: Text("2",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600)),
                        ),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color.fromARGB(255, 8, 139, 139)),
                            color: Color(0x565fdebf)))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Container(
                          child: Image.asset('images/desktop.png'),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xd67676d1))),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Container(
                            child: Text("Wireframing",
                                style: TextStyle(
                                    fontSize: 18.745134353637695,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, right: 12),
                          child: Container(
                            child: Text("0 completed",
                                style: TextStyle(fontSize: 12.15900707244873)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Container(
                        child: Center(
                          child: Text("1",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600)),
                        ),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color.fromARGB(255, 117, 26, 179)),
                            color: Color(0x568c8cd8)))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Container(
                          child: Image.asset('images/windows.png'),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xc9fb6616))),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Container(
                            child: Text("Visual Design",
                                style: TextStyle(
                                    fontSize: 18.745134353637695,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, right: 24),
                          child: Container(
                            child: Text("5 completed",
                                style: TextStyle(fontSize: 12.15900707244873)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 117,
                    ),
                    Container(
                        child: Center(
                          child: Text("3",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600)),
                        ),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 153, 0)),
                            color: Color(0x56fc8648)))
                  ],
                )
              ]),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Color(0xFF8932CA),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Add Task',
                ),
                content: TextField(
                    // Add your text field configuration here
                    ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your task adding logic here
                      // For example, you can add the task to a list
                      // and update the UI accordingly.
                      Navigator.of(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
