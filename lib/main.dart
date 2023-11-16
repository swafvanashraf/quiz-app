import 'package:flutter/material.dart';
import 'package:flutter_application_5/firebase_options.dart';
import 'package:flutter_application_5/quizApp.dart/provider.dart';
import 'package:flutter_application_5/quizApp.dart/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider(
        create: (context) => QuizProvider(),
        child: MaterialApp(
          title: "Quiz",
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
