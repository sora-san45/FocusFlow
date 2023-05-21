import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:focusflow/todotile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List l = [
    ["hello", false],
    ["hi", false]
  ];
  final titleControl = TextEditingController();

  var name;
  void changed(bool? val, int index) {
    setState(() {
      l[index][1] = !l[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      l.removeAt(index);
    });
  }

  void saveTask() {
    setState(() {
      l.add([titleControl.text, false]);
    });

    titleControl.clear();
    Navigator.of(context).pop();
  }

  void newTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("New Task"),
            backgroundColor: Color.fromARGB(255, 152, 193, 239),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            actions: [
              MaterialButton(
                  onPressed: saveTask,
                  child: Text(
                    "Save",
                  )),
              MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(Icons.delete))
            ],
            content: TextField(
              controller: titleControl,
              decoration: InputDecoration(labelText: "Enter task"),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 18, 17, 17),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Hi, ${name}",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                  SizedBox(width: 10),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/icons/waving-hand.png")),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                height: 130,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(131, 57, 57, 57),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Progress",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "tasks completed",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CircularPercentIndicator(
                        radius: 42,
                        lineWidth: 13,
                        percent: 1 / l.length,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 127, 127, 213),
                              Color.fromARGB(255, 134, 168, 231),
                              Color.fromARGB(255, 145, 234, 228)
                            ]),
                        backgroundColor: Color.fromARGB(255, 61, 60, 60),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          "${((1 / l.length) * 100).toStringAsFixed(0)}%",
                          style: TextStyle(
                              color: Color.fromARGB(255, 169, 169, 169),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text("Tasks",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(131, 57, 57, 57),
                  border: Border.all(color: Colors.white38)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 410,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: l.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ToDoTile(
                          title: l[index][0],
                          done: l[index][1],
                          index: index,
                          onChanged: (value) => changed(value, index),
                          deleteFun: (index) => deleteTask(index),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            newTask();
          },
          elevation: 15.0,
          foregroundColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 134, 168, 231),
          icon: Icon(Icons.edit),
          label: Text("Create task")),
    );
  }
}
