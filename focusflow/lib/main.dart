import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusflow/login.dart';
import 'package:focusflow/services/auth.dart';

Client client = Client();
void main() {
  client
      .setEndpoint('http://localhost/v1')
      .setProject('ff')
      .setSelfSigned(status: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
