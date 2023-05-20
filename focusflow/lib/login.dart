import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';

import 'homepage.dart';
import 'onboard.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 18, 17, 17),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 60),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        OnBoard();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Sign In ",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600)))
                ],
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(right: 130),
              child: Text("Log in from following accounts",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white))),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    height: 70,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(131, 57, 57, 57),
                        border: Border.all(color: Colors.white38)),
                  ),
                  Positioned(
                      left: 67,
                      top: 20,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("lib/icons/google.png"),
                                fit: BoxFit.cover)),
                      ))
                ]),
                SizedBox(width: 10),
                Stack(children: [
                  Container(
                    height: 70,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(131, 57, 57, 57),
                        border: Border.all(color: Colors.white38)),
                  ),
                  Positioned(
                      left: 67,
                      top: 17,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("lib/icons/apple.png"),
                                fit: BoxFit.fitHeight)),
                      ))
                ]),
              ],
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                "or",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 17, color: Colors.white)),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(131, 57, 57, 57),
                  border: Border.all(color: Colors.white38)),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 7.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email Address",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(131, 57, 57, 57),
                  border: Border.all(color: Colors.white38)),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 7.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Stack(children: [
                Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 44, 43, 43),
                          spreadRadius: 1,
                          blurRadius: 10)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 127, 127, 213),
                          Color.fromARGB(255, 134, 168, 231),
                          Color.fromARGB(255, 145, 234, 228)
                        ]),
                  ),
                ),
                Positioned(
                  top: 17,
                  left: 143,
                  child: Text("Sign In",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600))),
                )
              ]),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.white))),
                SizedBox(width: 4),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("Sign Up",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.cyan[100],
                        ))))
              ],
            )
          ],
        ));
  }
}
