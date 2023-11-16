import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

void _settingModalBottomSheet(context) {
  showbottom(context);
}

Future<dynamic> showbottom(context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height - 100.0,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(55.0),
              topRight: const Radius.circular(55.0),
            ),
          ),
          child: Column(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Container(
                    width: 80,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(134, 0, 0, 0))),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 327,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xf93e4d99),
                      Color(0xc4874dbb),
                      Color(0xDBD04BDF)
                    ],
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text("You are on Track",
                        style: TextStyle(
                            fontSize: 25.490177154541016,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    Row(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 3),
                          child: Text(
                            "50% progress have made",
                            style: TextStyle(
                                fontSize: 14.304715156555176,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Container(
                      child: Image.asset(
                        'images/brush.png',
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xbf2bd2aa))),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Container(
                        child: Text("Design",
                            style: TextStyle(
                              fontSize: 18.745134353637695,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 20),
                      child: Container(
                        child: Text("75% completed",
                            style: TextStyle(
                                fontSize: 10.15900707244873,
                                fontWeight: FontWeight.w300)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: Container(
                    width: 21,
                    height: 21,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF60DEC0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Container(
                      child: Image.asset(
                        'images/health.png',
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xd67676d1))),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 5),
                      child: Container(
                        child: Text("Meeting",
                            style: TextStyle(
                              fontSize: 18.745134353637695,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 20),
                      child: Container(
                        child: Text("80% completed",
                            style: TextStyle(
                                fontSize: 10.15900707244873,
                                fontWeight: FontWeight.w300)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: Container(
                    width: 21,
                    height: 21,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF8C8CD8),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Container(
                      child: Image.asset(
                        'images/carbon.png',
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xc9fb6616))),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 5),
                      child: Container(
                        child: Text("Learning",
                            style: TextStyle(
                              fontSize: 18.745134353637695,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 20),
                      child: Container(
                        child: Text("35% completed",
                            style: TextStyle(
                                fontSize: 10.15900707244873,
                                fontWeight: FontWeight.w300)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: Container(
                    width: 21,
                    height: 21,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFFFC8648),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 298.4,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    child: CalendarTimeline(
                      initialDate: DateTime(2020, 4, 20),
                      firstDate: DateTime(2019, 1, 15),
                      lastDate: DateTime(2020, 11, 20),
                      onDateSelected: (date) => print(date),
                      leftMargin: 20,
                      monthColor: Colors.blueGrey,
                      dayColor: Colors.teal[200],
                      activeDayColor: Colors.white,
                      activeBackgroundDayColor: Color(0xB7050043),
                      dotsColor: const Color(0xFF333A47),
                      selectableDayPredicate: (date) => date.day != 23,
                      locale: 'en_ISO',
                    ),
                  ),
                ],
              ),
            )
          ]),
        );
      });
}
