import 'package:flutter/material.dart';
import 'home.dart';
import 'test1.dart';
import 'test2.dart';
import 'test3.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const Home(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/test1': (context) => Test1(),
      '/test2': (context) => Test2(),
      '/test3': (context) => Test3(),
    },
    title: 'Flutter Test Suite',
  ));
}
