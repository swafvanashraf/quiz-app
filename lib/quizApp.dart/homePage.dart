import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/quizApp.dart/OTPverifyPage.dart';
import 'package:flutter_application_5/quizApp.dart/catogoryPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'QUIZ',
      home: homepage(),
    ),
  );
}

class homepage extends StatefulWidget {
  homepage({
    super.key,
  });

  @override
  State<homepage> createState() => _homepageState();
}

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn _googleSignIn = GoogleSignIn();

List<String> Usernames = [];

List<String> Passwords = [];
bool isSignin = true;

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    loadUsernames();
    loadPasswords();

    saveName();
  }

  saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'myName',
        Provider.of<QuizProvider>(context, listen: false)
            .myUsername
            .toString());
  }

  saveUsernames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('userkey', Usernames);
  }

  loadUsernames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Usernames = ((await prefs.getStringList('userkey')) ?? []);
  }

  savePasswords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('passkey', Passwords);
  }

  loadPasswords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Passwords = ((await prefs.getStringList('passkey')) ?? []);
  }

  @override
  Widget build(BuildContext context) {
    final Providerobj = Provider.of<QuizProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 203, 184),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                height: 200,
                width: 300,
                child: Image.asset(
                  'images/questionMark.png',
                  color: Color.fromARGB(255, 30, 104, 109),
                )),
            Center(
              child: Container(
                height: 170,
                width: 310,
                child: Row(
                  children: [
                    Text(
                      "Q",
                      style: TextStyle(
                          color: Color.fromARGB(255, 7, 93, 99),
                          fontWeight: FontWeight.bold,
                          fontSize: 135),
                    ),
                    Text("UIZ",
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                  offset: Offset(-1.5, -1.5),
                                  color: Color.fromARGB(255, 7, 93, 99)),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Color.fromARGB(255, 7, 93, 99)),
                              Shadow(
                                  // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Color.fromARGB(255, 7, 93, 99)),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Color.fromARGB(255, 7, 93, 99))
                            ],
                            color: Color.fromARGB(255, 207, 203, 184),
                            fontWeight: FontWeight.bold,
                            fontSize: 135))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // visible this container if the screen is sign in
            Visibility(
              visible: Providerobj.isSignin,
              child: Container(
                  height: 390,
                  width: double.infinity,
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        padding: EdgeInsets.all(10.0), // Padding around the box
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 7, 93, 99), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Border radius for rounded corners
                        ),
                        child: TextField(
                          controller: Providerobj.myusername,
                          decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default underline
                              hintText: Providerobj.histtext1,
                              hintStyle: TextStyle(
                                color: Providerobj.hintcolor1,
                              ),
                              suffixIcon: Icon(
                                  Icons.person_4_outlined) // Placeholder text
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        padding: EdgeInsets.all(10.0), // Padding around the box
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 7, 93, 99), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Border radius for rounded corners
                        ),
                        child: TextField(
                          controller: Providerobj.mypassword,
                          decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default underline
                              hintText: Providerobj.hinttext2,
                              hintStyle:
                                  TextStyle(color: Providerobj.hintcolor2),
                              suffixIcon: Icon(Icons
                                  .lock_outline_rounded) // Placeholder text
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                              onTap: () {
                                Provider.of<QuizProvider>(context,
                                        listen: false)
                                    .changeSigninSignup();
                              },
                              child: Text(
                                ' Sign up',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 33, 149, 243)),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                        saveName();
                        Providerobj.myUsername = Providerobj.myusername.text;
                        Providerobj.myPassword = Providerobj.mypassword.text;
                        Provider.of<QuizProvider>(context, listen: false)
                            .signinColorchanger(context);
                        Providerobj.myusername.clear();
                        Providerobj.mypassword.clear();
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Color.fromARGB(255, 218, 211, 183),
                            fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '----- OR -----',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      GestureDetector(
                        onTap: () async {
                          UserCredential? userCredential =
                              await signInWithGoogle();
                          if (userCredential != true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => catogoryPage()),
                            );
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homepage()));
                          }
                        },
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 207, 203, 184)),
                          child: Image.asset(
                            'images/google.png',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPverifyPage()),
                          );
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              'images/otp.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ])),
            ),

            //visible this container if the screen is sign out
            Visibility(
              visible: !Providerobj.isSignin,
              child: Container(
                height: 350,
                width: double.infinity,
                child: Column(
                  children: [
                    Text('Create your account'),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        padding: EdgeInsets.all(10.0), // Padding around the box
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 7, 93, 99), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Border radius for rounded corners
                        ),
                        child: TextField(
                          controller: Providerobj.newUsername,
                          decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default underline
                              hintText: Providerobj.hinttext3,
                              hintStyle: TextStyle(
                                color: Providerobj.hintcolor3,
                              ),
                              suffixIcon: Icon(
                                  Icons.person_4_outlined) // Placeholder text
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        padding: EdgeInsets.all(10.0), // Padding around the box
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 7, 93, 99), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Border radius for rounded corners
                        ),
                        child: TextField(
                          controller: Providerobj.newPassword1,
                          decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default underline
                              hintText: Providerobj.histtext4,
                              hintStyle:
                                  TextStyle(color: Providerobj.hintcolor4),
                              suffixIcon: Icon(Icons
                                  .lock_outline_rounded) // Placeholder text
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        padding: EdgeInsets.all(10.0), // Padding around the box
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 7, 93, 99), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Border radius for rounded corners
                        ),
                        child: TextField(
                          controller: Providerobj.newPassword2,
                          decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default underline
                              hintText: Providerobj.hinttext5,
                              hintStyle:
                                  TextStyle(color: Providerobj.hintcolor5),
                              suffixIcon: Icon(Icons
                                  .lock_outline_rounded) // Placeholder text
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 205),
                      child: Row(
                        children: [
                          Text(
                            "I have an account?",
                            style: TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                              onTap: () {
                                Provider.of<QuizProvider>(context,
                                        listen: false)
                                    .changeSigninSignup();
                              },
                              child: Text(
                                ' Sign in',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 33, 149, 243)),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
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
                        saveName();
                        Providerobj.NewUsername = Providerobj.newUsername.text;
                        Providerobj.NewPassword1 =
                            Providerobj.newPassword1.text;
                        Providerobj.NewPassword2 =
                            Providerobj.newPassword2.text;
                        Provider.of<QuizProvider>(context, listen: false)
                            .signupColorchanger(context);

                        saveUsernames();
                        loadUsernames();
                        savePasswords();
                        loadPasswords();
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color.fromARGB(255, 218, 211, 183),
                            fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Text("from",
            //     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
            // Container(
            //     height: 30,
            //     width: 100,
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: Icon(Icons.adb_sharp,
            //               color: Colors.black, size: 24.0),
            //         ),
            //         Text("E bugs",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 15))
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
