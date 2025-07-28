// ignore: unused_import

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calulator')),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("9"),
                customOutlinedButton("8"),
                customOutlinedButton("7"),
                customOutlinedButton("+"),
              ],
            ),

            Row(
              children: <Widget>[
                customOutlinedButton("6"),
                customOutlinedButton("5"),
                customOutlinedButton("4"),
                customOutlinedButton("-"),
              ],
            ),

            Row(
              children: <Widget>[
                customOutlinedButton("3"),
                customOutlinedButton("2"),
                customOutlinedButton("1"),
                customOutlinedButton("X"),
              ],
            ),

            Row(
              children: <Widget>[
                customOutlinedButton("C"),
                customOutlinedButton("0"),
                customOutlinedButton("="),
                customOutlinedButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlinedButton(String val) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: OutlinedButton(
          onPressed: () => btnClicked(val),
          // ignore: unnecessary_string_interpolations
          child: Text("$val", style: TextStyle(fontSize: 35.0)),
        ),
      ),
    );
  }

  late int first, second;
  late String res, text = "";
  late String opp;
  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "X" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
     
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }

      if (opp == "-") {
        res = (first - second).toString();
      }

      if (opp == "X") {
        res = (first * second).toString();
      }

      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }

    // ignore: annotate_overrides, use_function_type_syntax_for_parameters
    setState(() {
      text = res;
    });
  }
}
