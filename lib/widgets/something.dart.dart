// GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (Questions[index].indexofAnswer == 0) {
//                     mark++;
//                     containerColorA = Color.fromARGB(
//                         255, 45, 143, 25); // Revert to the original color.
//                   } else {
//                     containerColorA = Color.fromARGB(
//                         255, 221, 15, 0); // Revert to the original color.
//                   }
//                   ;
//                 });
//                 Future.delayed(Duration(milliseconds: 300), () {
//                   setState(() {
//                     if (index != 4) {
//                       index++;
//                       questionNumber++;
//                     } else {
//                       navigateToScorePage();
//                     }
//                     containerColorA =
//                         Colors.black; // Change the color back to black
//                   });
//                 });
//               },
//               child: Container(
//                 height: 70,
//                 width: 280,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       40,
//                     ),
//                     color: Color.fromARGB(255, 218, 211, 183)),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             40,
//                           ),
//                           color: const Color.fromARGB(255, 7, 93, 99),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "A",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Color.fromARGB(255, 218, 211, 183),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 70,
//                         width: 170,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               40,
//                             ),
//                             color: Color.fromARGB(255, 218, 211, 183)),
//                         child: Center(
//                           child: Text(Questions[index].options![0],
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color:
//                                       const Color.fromARGB(255, 250, 248, 248),
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (Questions[index].indexofAnswer == 1) {
//                     mark++;
//                     containerColorB = Color.fromARGB(255, 45, 143, 25);
//                   } else {
//                     containerColorB = Color.fromARGB(255, 221, 15, 0);
//                   }
//                   ;
//                 });
//                 Future.delayed(Duration(milliseconds: 300), () {
//                   setState(() {
//                     if (index != 4) {
//                       index++;
//                       questionNumber++;
//                     } else {
//                       navigateToScorePage();
//                     }
//                     containerColorB =
//                         Colors.black; // Change the color back to black
//                   });
//                 });
//               },
//               child: Container(
//                 height: 70,
//                 width: 280,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       40,
//                     ),
//                     color: containerColorB),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             40,
//                           ),
//                           color: const Color.fromARGB(255, 252, 249, 249),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "B",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 70,
//                         width: 170,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               40,
//                             ),
//                             color: containerColorB),
//                         child: Center(
//                           child: Text(Questions[index].options![1],
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color:
//                                       const Color.fromARGB(255, 250, 248, 248),
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (Questions[index].indexofAnswer == 2) {
//                     mark++;
//                     containerColorC = Color.fromARGB(255, 45, 143, 25);
//                   } else {
//                     containerColorC = Color.fromARGB(255, 221, 15, 0);
//                   }
//                   ;
//                 });
//                 Future.delayed(Duration(milliseconds: 300), () {
//                   setState(() {
//                     if (index != 4) {
//                       index++;
//                       questionNumber++;
//                     } else {
//                       navigateToScorePage();
//                     }
//                     containerColorC =
//                         Colors.black; // Change the color back to black
//                   });
//                 });
//               },
//               child: Container(
//                 height: 70,
//                 width: 280,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       40,
//                     ),
//                     color: containerColorC),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             40,
//                           ),
//                           color: const Color.fromARGB(255, 252, 249, 249),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "C",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 70,
//                         width: 170,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               40,
//                             ),
//                             color: containerColorC),
//                         child: Center(
//                           child: Text(Questions[index].options![2],
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color:
//                                       const Color.fromARGB(255, 250, 248, 248),
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (Questions[index].indexofAnswer == 3) {
//                     mark++;
//                     containerColorD = Color.fromARGB(255, 45, 143, 25);
//                   } else {
//                     containerColorD = Color.fromARGB(255, 221, 15, 0);
//                   }
//                   ;
//                 });
//                 Future.delayed(Duration(milliseconds: 300), () {
//                   setState(() {
//                     if (index != 4) {
//                       index++;
//                       questionNumber++;
//                     } else {
//                       navigateToScorePage();
//                     }
//                     containerColorD =
//                         Colors.black; // Change the color back to black
//                   });
//                 });
//               },
//               child: Container(
//                 height: 70,
//                 width: 280,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       40,
//                     ),
//                     color: containerColorD),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             40,
//                           ),
//                           color: const Color.fromARGB(255, 252, 249, 249),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "D",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 70,
//                         width: 170,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               40,
//                             ),
//                             color: containerColorD),
//                         child: Center(
//                           child: Text(Questions[index].options![3],
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color:
//                                       const Color.fromARGB(255, 250, 248, 248),
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
