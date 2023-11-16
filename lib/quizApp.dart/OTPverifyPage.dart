import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/quizApp.dart/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class OTPverifyPage extends StatefulWidget {
  const OTPverifyPage({super.key});

  @override
  State<OTPverifyPage> createState() => _OTPverifyPageState();
}

class _OTPverifyPageState extends State<OTPverifyPage> {
  final CollectionReference OTPusernames =
      FirebaseFirestore.instance.collection('OTPusernames');

  void addUsernames() {
    final data = {
      'username': Provider.of<QuizProvider>(context).OTPusername.text
    };
    OTPusernames.add(data);
  }

  @override
  Widget build(BuildContext context) {
    final Providerobj = Provider.of<QuizProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 203, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 203, 184),
        title: Padding(
          padding: EdgeInsets.only(
              left: Providerobj.phoneNumberPage == true ? 50 : 110),
          child: Text(
            Providerobj.phoneNumberPage == true
                ? 'Create Account'
                : 'Verify Account',
            style: TextStyle(color: Color.fromARGB(255, 7, 93, 99)),
          ),
        ),
        elevation: 0.0,
        automaticallyImplyLeading:
            Providerobj.phoneNumberPage == true ? true : false,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 7, 93, 99), // Change the icon color to red
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Visibility(
              visible: Providerobj.phoneNumberPage,
              child: Container(
                height: 800,
                width: 500,
                child: Column(
                  children: [
                    Image.asset(
                      'images/phone.png',
                      color: Color.fromARGB(255, 7, 93, 99),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 7, 93, 99), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Border radius for rounded corners
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            controller: Providerobj.OTPusername,
                            decoration: InputDecoration(
                                border: InputBorder
                                    .none, // Remove the default underline
                                hintText: 'Username',
                                suffixIcon: Icon(
                                    Icons.person_4_outlined) // Placeholder text
                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 7, 93, 99), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Border radius for rounded corners
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                      context: context,
                                      showPhoneCode: false,
                                      onSelect: (Country country) {
                                        Providerobj.countryCode.text =
                                            country.phoneCode;
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        Providerobj.countryCode.text,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: const Color.fromARGB(
                                                255, 65, 58, 58)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: const Color.fromARGB(255, 87, 80, 80)),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: TextField(
                                  controller: Providerobj.phoneNumber,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Enter a number',
                                    suffixIcon: Icon(Icons.person_4_outlined),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 7, 93, 99)),
                        minimumSize: MaterialStateProperty.all(
                            const Size(335, 60)), // Increase the size here
                        textStyle: MaterialStateProperty.all(const TextStyle(
                          fontSize: 20,
                        )),
                      ),
                      onPressed: () {
                        if (Providerobj.OTPusername.text.isNotEmpty &&
                            Providerobj.phoneNumber.text.isNotEmpty) {
                          addUsernames();
                          Provider.of<QuizProvider>(context, listen: false)
                              .phoneToOTPpage();
                          Provider.of<QuizProvider>(context, listen: false)
                              .verifyUserPhoneNumber();
                        } else {
                          final snackBar = SnackBar(
                            content: Center(
                                child: Providerobj.OTPusername.text.isEmpty &&
                                        Providerobj.phoneNumber.text.isEmpty
                                    ? Text(
                                        'Enter your  Username & Phone number')
                                    : Providerobj.OTPusername.text.isEmpty &&
                                            Providerobj
                                                .phoneNumber.text.isNotEmpty
                                        ? Text('Enter your Username')
                                        : Text('Enter your phone number')),
                            duration: Duration(milliseconds: 600),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text(
                        "Send OTP",
                        style: TextStyle(
                            color: Color.fromARGB(255, 218, 211, 183),
                            fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
                visible: !Providerobj.phoneNumberPage,
                child: Container(
                  height: 720,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Image.asset(
                            'images/otp.gif',
                            fit: BoxFit.fill,
                            color: Color.fromARGB(255, 7, 93, 99),
                          ),
                        ),
                      ),
                      Text(
                        'Enter The Verification Code Send To',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '9207606286',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 116, 112, 112),
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                Providerobj.phoneToOTPpage();
                              },
                              child: Text('Wrong Number?'))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 7, 93, 99),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            onChanged: (value) {
                              Provider.of<QuizProvider>(context, listen: false)
                                  .enteredOTP = value;
                            },
                            onCompleted: (value) {},
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeColor: Colors.green,
                              inactiveColor: Color.fromARGB(255, 7, 93, 99),
                              selectedColor: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CountdownWidget(initialCountdown: 120),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't Recieve the Code?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 112, 112),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Provider.of<QuizProvider>(context,
                                        listen: false)
                                    .verifyUserPhoneNumber();
                                final snackBar = SnackBar(
                                  content: Center(child: Text('code send')),
                                  duration: Duration(
                                      milliseconds:
                                          600), // Adjust the duration as needed
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 27, 27, 27)),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 7, 93, 99)),
                          minimumSize: MaterialStateProperty.all(
                              const Size(335, 60)), // Increase the size here
                          textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 20,
                          )),
                        ),
                        onPressed: () {
                          if (Providerobj.otpFieldVisibility) {
                            Provider.of<QuizProvider>(context, listen: false)
                                .verifyOTPCode(context);
                          } else {
                            if (Provider.of<QuizProvider>(context,
                                        listen: false)
                                    .enteredOTP ==
                                1) {
                              final snackBar = SnackBar(
                                content: Center(child: Text('Enter the OTP')),
                                duration: Duration(
                                    milliseconds:
                                        600), // Adjust the duration as needed
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Provider.of<QuizProvider>(context, listen: false)
                                  .verifyUserPhoneNumber();
                              Provider.of<QuizProvider>(context, listen: false)
                                  .toOTPscreen();
                            }
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                              color: Color.fromARGB(255, 218, 211, 183),
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class CountdownWidget extends StatefulWidget {
  final int initialCountdown;

  CountdownWidget({required this.initialCountdown});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _countdownTimer;
  int _countdown = 0;

  @override
  void initState() {
    super.initState();
    _countdown = widget.initialCountdown;
    startCountdown();
  }

  void startCountdown() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        stopCountdown();
      }
    });
  }

  void stopCountdown() {
    if (_countdownTimer.isActive) {
      _countdownTimer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'OTP expire in $_countdown seconds',
      style: TextStyle(fontSize: 16),
    );
  }

  @override
  void dispose() {
    stopCountdown(); // Stop the countdown timer when the widget is disposed
    super.dispose();
  }
}
