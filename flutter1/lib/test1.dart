import 'dart:math';

import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  Test1({Key? key}) : super(key: key);

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  final int N = 10000;
  var primes = [];
  int time = 0;

  bool isPrime(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    for (int i = 2; i < n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    int j = 0;

    int t0 = DateTime.now().millisecondsSinceEpoch;

    for (int i = 0; i < N; i++) {
      bool foundPrime = false;
      while (!foundPrime) {
        j++;
        if (isPrime(j)) {
          primes.add(j);
          foundPrime = true;
        }
      }
    }

    time = DateTime.now().millisecondsSinceEpoch - t0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calculation Test'),
        ),
        body: Center(
          child: Text("Calculated " +
              N.toString() +
              " primes in " +
              time.toString() +
              " milliseconds \n" +
              primes.map((i) => i.toString()).join(",")),
        ));
  }
}
