import 'package:flutter/material.dart';
import 'package:flutter_application_5/quizApp.dart/provider.dart';
import 'package:flutter_application_5/quizApp.dart/quizList.dart';
import 'package:provider/provider.dart';

class quizPage extends StatefulWidget {
  final int selectedIndex;

  quizPage({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<quizPage> createState() => _secondPageState();
}

class _secondPageState extends State<quizPage> {
  dynamic k;
  int mark = 0;

  @override
  Widget build(BuildContext context) {
    final Providerobj = Provider.of<QuizProvider>(context);
    k = widget.selectedIndex;

    List<String> categoryQuestion = [
      GeometryQuestions[Providerobj.i].question!,
      ChemistryQuestions[Providerobj.i].question!,
      PhysicsQuestions[Providerobj.i].question!,
      MathsQuestions[Providerobj.i].question!,
    ];

    // saveMark() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   await prefs.setInt('markKey', mark);
    // }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 168, 123),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 168, 123),
        title: Padding(
          padding: const EdgeInsets.only(left: 75, bottom: 5),
          child: Text(
            "Questions",
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Container(
                child: Center(
                  child: Container(
                    height: 180,
                    width: 320,
                    child: Center(
                      child: Text(categoryQuestion[k],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 218, 211, 183),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                  color: Color.fromARGB(255, 7, 93, 99),
                )),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) =>
                  Consumer<QuizProvider>(builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    if (k == 0 &&
                        index ==
                            GeometryQuestions[Providerobj.i].indexofAnswer) {
                      mark++;
                    } else if (k == 1 &&
                        index ==
                            ChemistryQuestions[Providerobj.i].indexofAnswer) {
                      mark++;
                    } else if (k == 2 &&
                        index ==
                            PhysicsQuestions[Providerobj.i].indexofAnswer) {
                      mark++;
                    } else if (k == 3 &&
                        index == MathsQuestions[Providerobj.i].indexofAnswer) {
                      mark++;
                    }
                    Provider.of<QuizProvider>(context, listen: false)
                        .questionOverCheck(context, k, mark);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 13, 50, 13),
                    child: Container(
                      height: 70,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                          color: Color.fromARGB(255, 218, 211, 183)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  40,
                                ),
                                color: const Color.fromARGB(255, 7, 93, 99),
                              ),
                              child: Center(
                                child: Text(
                                  GeometryQuestions[0].abcd![index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 218, 211, 183),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 190,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    40,
                                  ),
                                  color: Color.fromARGB(255, 218, 211, 183)),
                              child: Center(
                                child: Text(
                                    k == 0
                                        ? GeometryQuestions[Providerobj.i]
                                            .options![index]
                                        : k == 1
                                            ? ChemistryQuestions[Providerobj.i]
                                                .options![index]
                                            : k == 2
                                                ? PhysicsQuestions[
                                                        Providerobj.i]
                                                    .options![index]
                                                : MathsQuestions[Providerobj.i]
                                                    .options![index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: const Color.fromARGB(
                                            255, 7, 93, 99),
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
