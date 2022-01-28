import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';

class Test2 extends StatefulWidget {
  Test2({Key? key}) : super(key: key);
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  List _items = [];
  int _time = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  void startTest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int t0 = DateTime.now().millisecondsSinceEpoch;
    // _items.forEach((element) async {
    //   await prefs.setString(element["key"], element["value"]);
    // });
    Future.wait(_items.map((e) => prefs.setString(e["key"], e["value"])));
    setState(() {
      _time = DateTime.now().millisecondsSinceEpoch - t0;
    });
  }

  void clearData() async {
    setState(() {
      _loading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _items = [];
      _loading = false;
    });
  }

  //read json
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('generated.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Storage Performance Test'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Load Data'),
                onPressed: readJson,
              ),
              (_items.length > 0
                  ? Column(children: [
                      ElevatedButton(
                          onPressed: startTest, child: Text('Start Test 2')),
                      ElevatedButton(
                          onPressed: clearData, child: Text("Clear Memory"))
                    ])
                  : Container()),
              (_time != 0
                  ? Text("Stored ${_items.length} Datapoints in $_time seconds")
                  : Container())
            ],
          ),
        ));
  }
}
