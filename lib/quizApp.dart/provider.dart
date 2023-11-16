import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/quizApp.dart/winlosepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_5/quizApp.dart/catogoryPage.dart';

import 'homePage.dart';

class QuizProvider with ChangeNotifier {
  bool isSignin = true;

  String enteredOTP = '1';

  changeSigninSignup() {
    isSignin = !isSignin;
    notifyListeners();
  }

  bool isNotOtp = true;
  toOTPscreen() {
    isNotOtp = !isNotOtp;
    notifyListeners();
  }

  TextEditingController myusername = TextEditingController();
  TextEditingController mypassword = TextEditingController();
  TextEditingController newUsername = TextEditingController();
  TextEditingController newPassword1 = TextEditingController();
  TextEditingController newPassword2 = TextEditingController();
  TextEditingController OTPusername = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController countryCode = TextEditingController();

  String? myPassword;
  String? myUsername;
  String? NewUsername;
  String? NewPassword1;
  String? NewPassword2;

  String histtext1 = 'Username';
  String hinttext2 = 'Password';
  String hinttext3 = 'username';
  String histtext4 = 'Set your password';
  String hinttext5 = 'Enter again';

  Color hintcolor1 = Color.fromARGB(255, 109, 103, 103);
  Color hintcolor2 = Color.fromARGB(255, 109, 103, 103);
  Color hintcolor3 = Color.fromARGB(255, 109, 103, 103);
  Color hintcolor4 = Color.fromARGB(255, 109, 103, 103);
  Color hintcolor5 = Color.fromARGB(255, 109, 103, 103);

  signinColorchanger(BuildContext context) {
    bool userFound = false;

    for (int i = 0; i < Usernames.length; i++) {
      if (myUsername == Usernames[i] && myPassword == Passwords[i]) {
        userFound = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => catogoryPage()),
        );
        break; // Exit the loop since the user is found
      }
    }

    if (!userFound) {
      if (myusername.text.isEmpty && mypassword.text.isEmpty) {
        histtext1 = 'Enter your username';
        hinttext2 = 'Enter your password';
        hintcolor1 = Colors.red;
        hintcolor2 = Colors.red;
      } else if (myusername.text.isNotEmpty && mypassword.text.isEmpty) {
        hinttext2 = 'Enter your password';
        hintcolor2 = Colors.red;
      } else if (myusername.text.isEmpty && mypassword.text.isNotEmpty) {
        histtext1 = 'Enter your username';
        hintcolor1 = Colors.red;
      } else {
        final snackBar = SnackBar(
          content: Center(child: Text('User not found')),
          duration: Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    notifyListeners();
  }

  signupColorchanger(BuildContext context) {
    if (newUsername.text.isEmpty &&
        newPassword1.text.isEmpty &&
        newPassword2.text.isEmpty) {
      hintcolor3 = Colors.red;
      hintcolor4 = Colors.red;
      hintcolor5 = Colors.red;
    } else if (newUsername.text.isNotEmpty &&
        newPassword1.text.isEmpty &&
        newPassword2.text.isEmpty) {
      hintcolor4 = Colors.red;
      hintcolor5 = Colors.red;
    } else if (newUsername.text.isEmpty &&
        newPassword1.text.isNotEmpty &&
        newPassword2.text.isEmpty) {
      hintcolor3 = Colors.red;
      hintcolor5 = Colors.red;
    } else if (newUsername.text.isEmpty &&
        newPassword1.text.isEmpty &&
        newPassword2.text.isNotEmpty) {
      hintcolor3 = Colors.red;
      hintcolor4 = Colors.red;
    } else if (newUsername.text.isNotEmpty &&
        newPassword1.text.isNotEmpty &&
        newPassword2.text.isEmpty) {
      hintcolor5 = Colors.red;
    } else if (newUsername.text.isEmpty &&
        newPassword1.text.isNotEmpty &&
        newPassword2.text.isNotEmpty) {
      hintcolor3 = Colors.red;
    } else if (newUsername.text.isNotEmpty &&
        newPassword1.text.isEmpty &&
        newPassword2.text.isNotEmpty) {
      hintcolor4 = Colors.red;
    } else if (newUsername.text.isNotEmpty &&
        newPassword1.text.isNotEmpty &&
        newPassword2.text.isEmpty) {
      hintcolor5 = Colors.red;
    } else if (newUsername.text.isNotEmpty &&
        newPassword1.text.isNotEmpty &&
        newPassword2.text.isNotEmpty) {
      if (newPassword1.text == newPassword2.text) {
        Usernames.add(NewUsername.toString());
        Passwords.add(NewPassword1.toString());

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => catogoryPage()),
        );
      }
    }
    notifyListeners();
  }

  String? myCategory;
  int? selectedIndex;

  findCategory(int index) {
    selectedIndex = index;
    if (index == 0) {
      myCategory = 'Geometry';
    } else if (index == 1) {
      myCategory = 'Chemistry';
    } else if (index == 2) {
      myCategory = 'Physics';
    } else if (index == 3) {
      myCategory = 'Maths';
    }
    notifyListeners();
  }

  saveMark(int mark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('markKey', mark);
  }

  int i = 0;

  questionOverCheck(BuildContext context, int k, int mark) {
    if (i != 4) {
      i++;
    } else {
      saveMark(mark);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => winlosepage(k: k)));
    }
    notifyListeners();
    return i;
  }

  int savedMark = 0;
  String? category;
  String? savedName;
  Map<String, dynamic> userInfo = {};

  loadMark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedMark = (await prefs.getInt('markKey')) ?? 0;
    notifyListeners();
  }

  saveHistorylist() async {
    userInfo = {
      'username': savedName,
      'categoryName': category,
      'Mark': savedMark,
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (category != null) {
      history.add(userInfo);
    }
    List<String> historyList = history.map((item) => jsonEncode(item)).toList();
    prefs.setStringList('historyKey', historyList);
  }

  loadCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    category = (await prefs.getString('categoryKey') ?? '').toString();
    notifyListeners();
  }

  loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedName = (await prefs.getString('myName') ?? '').toString();
    notifyListeners();
  }

  bool logOutVariable = false;
  bool? logOutVar;

  Future<void> setBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Replace with your boolean value
    await prefs.setBool('myBooleanKey', logOutVariable);
    notifyListeners();
  }

  Future<bool?> getBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Provide a default value (in this case, false) if the key is not found
    logOutVar = prefs.getBool('myBooleanKey') ?? false;
    notifyListeners();
    return logOutVar;
  }

  logout() {
    logOutVariable = true;
    notifyListeners();
  }

  login() {
    logOutVariable = false;
    notifyListeners();
  }

  bool phoneNumberPage = true;

  phoneToOTPpage() {
    phoneNumberPage = !phoneNumberPage;
    notifyListeners();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void verifyUserPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => print('Logged In Successfully'),
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        otpFieldVisibility = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('TimeOut');
        print('Verifying phone number: ${phoneNumber.text}');
      },
    );
    notifyListeners();
  }

  var receivedID = '';
  bool otpFieldVisibility = false;

  Future<void> verifyOTPCode(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID, smsCode: enteredOTP);
    await auth
        .signInWithCredential(credential)
        .then((value) => print('User Login In Successful'));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => catogoryPage()),
    );
    notifyListeners();
  }
}
