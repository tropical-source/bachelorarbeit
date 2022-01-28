import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Performance Test Suite'),
        ),
        body: Center(
            child: new Column(children: [
          ElevatedButton(
            onPressed: () {
              // Navigate to the second screen when tapped.
              Navigator.pushNamed(context, '/test1');
            },
            child: const Text('Test 1'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the second screen when tapped.
              Navigator.pushNamed(context, '/test2');
            },
            child: const Text('Test 2'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the second screen when tapped.
              Navigator.pushNamed(context, '/test3');
            },
            child: const Text('Test 3'),
          ),
        ])));
  }
}
