import 'package:flutter/material.dart';
import "Authentication/login.dart";
import "personInfo.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Paper Less';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "SolaimanLipi"),
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        body: SafeArea(child: PersonInfo()),
      ),
    );
  }
}
